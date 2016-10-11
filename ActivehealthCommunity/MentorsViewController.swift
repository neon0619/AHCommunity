//
//  MentorsViewController.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 8/24/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

class MentorsViewController: UIViewController,UIPopoverPresentationControllerDelegate, UIPopoverControllerDelegate {
    
    @IBOutlet var navBar: UINavigationBar!
    @IBOutlet var swiftPages: SwiftPages!
    
    var interactor:Interactor? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.navBar.setBackgroundImage(UIImage(), for: .default)
        self.navBar.shadowImage = UIImage()
        self.navBar.isTranslucent = true
        
        let VCIDs = ["userProfileController","myPreviouseRacesController"]
        let buttonImages = [
            UIImage(named:"coach_profile_icon")!,
            UIImage(named:"coach_bio_profile_icon")!,
        ]

        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let VCsInstanciated = VCIDs.map({ storyboard.instantiateViewController(withIdentifier: $0) })
        //        VCsInstanciated[0].view.frame = CGRectMake(0, 300, self.view.frame.width, 500)
        
        
        
        // Sample customization
        swiftPages.initializeWithVCsInstanciatedArrayAndButtonImagesArray(VCsArray: VCsInstanciated, buttonImagesArray: buttonImages)
        //swiftPagesView.initializeWithVCIDsArrayAndButtonImagesArray([], buttonImagesArray: buttonImages)
        swiftPages.setTopBarBackground(color: UIColor(patternImage: UIImage(named: "placeholder7")!))
        //        swiftPagesView.setTopBarBackground(UIColor.cl)
        swiftPages.setAnimatedBarColor(color: UIColor(red: 255/255, green: 250/255, blue: 205/255, alpha: 1.0))
        swiftPages.setContainerViewBackground(color: UIColor.lightGray)
        
        self.navBar.setBackgroundImage(UIImage(), for: .default)
        self.navBar.shadowImage = UIImage()
        self.navBar.isTranslucent = true
        
    }
    
    
    @IBAction func status(_ sender: AnyObject) {
        
        let statusAlertController = storyboard!.instantiateViewController(withIdentifier: "statusAlertController") as! StatusViewController
        statusAlertController.modalPresentationStyle = UIModalPresentationStyle.popover
        statusAlertController.preferredContentSize = CGSize(width: 200, height: statusAlertController.sportsList.count * 58)
        let popOver = statusAlertController.popoverPresentationController
        popOver?.delegate = self
        popOver?.sourceView = self.view
        popOver?.sourceRect = CGRect(x: (self.navBar.frame.origin.x) + 370, y: (self.navBar.frame.origin.y) + 20, width: 10, height: 10)
        self.present(statusAlertController, animated: true, completion: nil)
        
    }
    
    @IBAction func handleGesture(_ sender: UIPanGestureRecognizer) {
        
        let percentThreshold:CGFloat = 0.3
        
        // convert y-position to downward pull progress (percentage)
        let translation = sender.translation(in: view)
        let verticalMovement = translation.y / view.bounds.height
        let downwardMovement = fmaxf(Float(verticalMovement), 0.0)
        let downwardMovementPercent = fminf(downwardMovement, 1.0)
        let progress = CGFloat(downwardMovementPercent)
        
        guard let interactor = interactor else { return }
        
        switch sender.state {
        case .began:
            interactor.hasStarted = true
            dismiss(animated: true, completion: nil)
        case .changed:
            interactor.shouldFinish = progress > percentThreshold
            interactor.update(progress)
        case .cancelled:
            interactor.hasStarted = false
            interactor.cancel()
        case .ended:
            interactor.hasStarted = false
            interactor.shouldFinish
                ? interactor.finish()
                : interactor.cancel()
        default:
            break
        }
    }
    @IBAction func sleepTimer(_ sender: AnyObject) {
        
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        // Return no adaptive presentation style, use default presentation behaviour
        return .none
    }
}
