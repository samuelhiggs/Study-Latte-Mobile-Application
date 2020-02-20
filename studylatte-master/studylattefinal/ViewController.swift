//
//  ViewController.swift
//  studylattefinal
//
//  Created by Samuel Higgs on 4/10/18.
//  Copyright © 2018 Samuel Higgs. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookCore
import FBSDKCoreKit
import FBSDKLoginKit

func applicationDidBecomeActive(application: UIApplication) {
    // Call the 'activate' method to log an app event for use
    // in analytics and advertising reporting.
    AppEventsLogger.activate(application)
    // ...
}

class ViewController: UIViewController, LoginButtonDelegate {
    
    var fbLoginSuccess = false
    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
        switch result {
        case .failed(_):
            print("facebook login failed")
            break
        case .cancelled:
            print("login cancelled")
            break
        case .success(_, _, _):
            fbLoginSuccess = true
            break
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: LoginButton) {
        print("You Logged Out.")
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        self.imageView.image = UIImage.init(named: "StudyWithSucculents")
        let theLoginButton = LoginButton(readPermissions: [ .publicProfile ])
        theLoginButton.delegate = self
        theLoginButton.frame.origin.y = 375
        theLoginButton.frame.origin.x = 65
        view.addSubview(theLoginButton)
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (fbLoginSuccess==true) {
            performSegue(withIdentifier: "segue1", sender: self)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
