//
//  MenuViewController.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 7/27/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit
import SideMenuController

protocol MenuViewControllerDelegate {
    func optionSelected(_ animal: Menu)
}

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView : UITableView!
    
    var delegate: MenuViewControllerDelegate?
    
    let segues = ["showHome","showCommunity","toUpcomingEvents","showMyRacePlan","toHelp","toHelp","toMyRewards","toHelp","toInbox","toHelp","toAbout","toHelp"]
    let menu: Array<Menu>! =  [Menu(title: "Home", image: UIImage(named: "home")),
    Menu(title: "My Community", image: UIImage(named: "my_community")),
    Menu(title: "Upcoming Events", image: UIImage(named: "my_community")),
    Menu(title: "My Race Plan", image: UIImage(named: "my_race_plan")),
    Menu(title: "My Training Diary", image: UIImage(named: "my_training_diary")),
    Menu(title: "My Races", image: UIImage(named: "my_races")),
    Menu(title: "My Rewards", image: UIImage(named: "my_reward")),
    Menu(title: "My Team", image: UIImage(named: "my_team")),
    Menu(title: "Inbox", image: UIImage(named: "inbox")),
    Menu(title: "Help", image: UIImage(named: "my_community")),
    Menu(title: "About", image: UIImage(named: "my_community")),
    Menu(title: "Log out", image: UIImage(named: "logout"))
    ]
    
    
    
    struct TableView {
        struct CellIdentifiers {
            static let AnimalCell = "menuCell"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        loadNibs()
        tableView.reloadData()
        
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
//        updateArrayMenuOptions()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableView.CellIdentifiers.AnimalCell, for: indexPath) as! MenuCell
        
        cell.backgroundColor = UIColor(netHex: 0xFF9310)
        cell.lblTitle.textColor = UIColor.white
        cell.setCellDetails(menu[(indexPath as NSIndexPath).row])
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        sideMenuController?.performSegue(withIdentifier: segues[indexPath.row], sender: nil)
        
//        let selectedOption = menu[indexPath.row]
//        delegate?.optionSelected(selectedOption)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! MenuHeaderCell
        headerCell.backgroundColor = UIColor(netHex: 0x0A1D37)
        let tap = UITapGestureRecognizer(target: self, action: #selector(MenuViewController.buttonClicked(_:)))
        headerCell.userImage.addGestureRecognizer(tap)
        headerCell.userImage.isUserInteractionEnabled = true
        headerCell.userName.textColor = UIColor.white
        headerCell.userName.text = "Fucking t0tep"
        
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 300
    }
    
    func buttonClicked(_ sender: UITapGestureRecognizer) {
       
        print("hmm")
        let vc = storyboard?.instantiateViewController(withIdentifier: "profileController") as! ProfileViewController
        show(vc, sender: self)
        
    }

    func loadNibs(){
        
        let menuCell = UINib(nibName: "MenuCell", bundle: nil)
        let headerCell = UINib(nibName: "MenuHeaderCell", bundle: nil)
        
        self.tableView.register(headerCell, forCellReuseIdentifier: "headerCell")
        self.tableView.register(menuCell, forCellReuseIdentifier: "menuCell")
    }
    
    

}

