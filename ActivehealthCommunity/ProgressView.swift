//
//  ProgressView.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 8/2/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

class ProgressView: UIView {
    
    private let progressLayer: CAShapeLayer = CAShapeLayer()
    private let progressLayerWhite : CAShapeLayer = CAShapeLayer()
    private var timer = NSTimer()
    private var progressLabel: UILabel
    private var startingPercentage = 0.0
    private var currentProgressPercentage: CGFloat = 0.0
    private var progressType = ""
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        progressLabel = UILabel()
        super.init(coder: aDecoder)
        //        createLabel()
        //        createProgressLayer()
        //        print(self.bounds)
    }
    
    
    
    override init(frame: CGRect) {
        progressLabel = UILabel()
        super.init(frame: frame)
        //        createLabel()
    }
    
    func createLabel(textColor : UIColor) {
        progressLabel = UILabel(frame: CGRectMake(0.0, 0.0, CGRectGetWidth(frame), 60.0))
        progressLabel.textColor = textColor
        progressLabel.textAlignment = .Center
        progressLabel.text = "0%"
        progressLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20.0)
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(progressLabel)
        
        addConstraint(NSLayoutConstraint(item: progressLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        addConstraint(NSLayoutConstraint(item: progressLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
    }
    
    func createProgressLayer(strokeColor : CGColor, strokeColor2 : CGColor, lineWidth : CGFloat, lineWidth2 : CGFloat, lineCap : String) {
        
        let startAngle = CGFloat(M_PI + M_PI_2)
        let endAngle = CGFloat(M_PI * 3 + M_PI_2)
        let centerPoint = CGPointMake(CGRectGetWidth(bounds)/2, CGRectGetHeight(bounds)/2)
        let radius = CGRectGetWidth(bounds)/2 - 5
        
        //        let gradientMaskLayer = gradientMask()
        progressLayer.path = UIBezierPath(arcCenter:centerPoint, radius: radius , startAngle:startAngle, endAngle:endAngle, clockwise: true).CGPath
        progressLayer.backgroundColor = UIColor.clearColor().CGColor
        progressLayer.fillColor = nil
        progressLayer.strokeColor = strokeColor
        progressLayer.lineWidth = lineWidth
        progressLayer.strokeStart = 0.0
        progressLayer.strokeEnd = 0.0
        progressLayer.lineCap = lineCap
        
        progressLayerWhite.path = UIBezierPath(arcCenter: centerPoint, radius: radius, startAngle: startAngle,endAngle:endAngle, clockwise: true).CGPath
        progressLayerWhite.fillColor = UIColor.clearColor().CGColor
        progressLayerWhite.strokeColor = strokeColor2
        progressLayerWhite.lineWidth = lineWidth2
        
        //        gradientMaskLayer.mask = progressLayer
        self.layer.addSublayer(progressLayerWhite)
        self.layer.addSublayer(progressLayer)
        
    }
    
    private func gradientMask() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        
        gradientLayer.locations = [0.0, 0.0]
        
        let colorTop: AnyObject = UIColor(red: 255.0/255.0, green: 213.0/255.0, blue: 63.0/255.0, alpha: 1.0).CGColor
        let colorBottom: AnyObject = UIColor(red: 255.0/255.0, green: 198.0/255.0, blue: 5.0/255.0, alpha: 1.0).CGColor
        let arrayOfColors: [AnyObject] = [colorTop, colorBottom]
        gradientLayer.colors = arrayOfColors
        
        return gradientLayer
    }
    
    func hideProgressView() {
        progressLayer.strokeEnd = 0.0
        progressLayer.removeAllAnimations()
        progressLabel.text = "Load content"
    }
    
    func animateProgressView(currentProgressPercentage : CGFloat, progressType: String) {
        self.currentProgressPercentage = currentProgressPercentage
        self.progressType = progressType
        
        progressLayer.strokeEnd = 0.0
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        
        animation.fromValue = CGFloat(startingPercentage)
        animation.toValue = CGFloat(currentProgressPercentage / 100)
        animation.duration = 1.0
        animation.delegate = self
        animation.removedOnCompletion = false
        animation.additive = true
        animation.fillMode = kCAFillModeForwards
        progressLayer.addAnimation(animation, forKey: "strokeEnd")
        
    }
    
    //    func backgroundThread(delay: Double = 0.0, background: (() -> Void)? = nil, completion: (() -> Void)? = nil) {
    //        dispatch_async(dispatch_get_global_queue(Int(QOS_CLASS_USER_INITIATED.rawValue), 0)) {
    //            if(background != nil){ background!(); }
    //
    //            let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
    //            dispatch_after(popTime, dispatch_get_main_queue()) {
    //                if(completion != nil){ completion!(); }
    //            }
    //        }
    //    }
    
    override func animationDidStart(anim: CAAnimation) {
        
        startingPercentage = 0.0
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: #selector(ProgressView.updateProgressViewLabelWithProgress(_:)), userInfo: nil, repeats: true)
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        
        timer.invalidate()
        if progressType == "percentage" {
            progressLabel.text = NSString(format: "%.0f %@", currentProgressPercentage , "%") as String
        }else {
            progressLabel.text = String(format: "%g", currentProgressPercentage)
        }
    }
    
    
    func updateProgressViewLabelWithProgress(percent: Float) {
        startingPercentage += (0.01 * 100)
        if progressType == "percentage" {
            progressLabel.text = NSString(format: "%.0f %@", startingPercentage , "%") as String
        }else {
            progressLabel.text = String(format: "%g", startingPercentage)
        }
        
    }
    
    func removeSubviews() {
        for viewToRemove in self.subviews {
            viewToRemove.removeFromSuperview()
        }
    }
    
}
