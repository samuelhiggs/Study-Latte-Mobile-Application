//
//  SettingsViewController.swift
//  studylattefinal
//
//  Created by Samuel Higgs on 4/30/18.
//  Copyright © 2018 Samuel Higgs. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookCore
import FBSDKCoreKit
import FBSDKLoginKit

class SettingsViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("test")
        let loginView : FBSDKLoginManager = FBSDKLoginManager()
        loginView.loginBehavior = FBSDKLoginBehavior.web
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // If the logout button is pressed...
        if indexPath.section == 1 && indexPath.row == 0 {
            // Logout of Facebook
            let manager = FBSDKLoginManager()
            manager.logOut()
            FBSDKAccessToken.setCurrent(nil)
            FBSDKProfile.setCurrent(nil)
            // Segue to the main login screen
            performSegue(withIdentifier: "segVC", sender: nil)
        }
    }
}
