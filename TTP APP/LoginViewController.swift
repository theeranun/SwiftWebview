//
//  LoginViewController.swift
//  TTP APP
//
//  Created by Theeranun Chitcharak on 11/10/2561 BE.
//  Copyright © 2561 Tuktukpass. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    @IBOutlet weak var lblStatus: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btnFbLogin = FBSDKLoginButton()
        btnFbLogin.readPermissions = ["public_profile","email"]
        btnFbLogin.delegate = self
        
        btnFbLogin.center = self.view.center
        self.view.addSubview(btnFbLogin)
        
        if FBSDKAccessToken.current() != nil {
            self.lblStatus.text = "Logged in"
        } else {
            self.lblStatus.text = "Not Logged In"
        }
        
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        if error != nil {
            self.lblStatus.text = error.localizedDescription
        } else if result.isCancelled {
            self.lblStatus.text = "User cancelled log in"
        } else {
            //successful login
            self.lblStatus.text = "User Logged in"
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        self.lblStatus.text = "User logged out"
    }

}
