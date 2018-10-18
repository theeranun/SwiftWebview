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
    @IBOutlet weak var imageProfile: UIImageView!
    
    let btnFbLogin: FBSDKLoginButton = {
        let button = FBSDKLoginButton()
        button.readPermissions = ["public_profile","email"]
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(btnFbLogin)
        btnFbLogin.center = view.center
        btnFbLogin.delegate = self
        
        if FBSDKAccessToken.current() != nil {
            lblStatus.text = "Logged in"
            getUserProfile()
        } else {
            lblStatus.text = "Not Logged In"
        }
        
    }
    
    func getUserProfile(){
       
        let parameters = ["fields":"id, name, first_name, last_name, email, picture.type(large)"]
        FBSDKGraphRequest(graphPath: "me", parameters: parameters)?.start(completionHandler: {(connection, result, error) -> Void in
            if error != nil {
                self.lblStatus.text = error?.localizedDescription
                return
            }
            
            let faceDic = result as! NSDictionary
            let id = faceDic["id"] as! String
            let email = faceDic["email"] as! String
            let firstName = faceDic["first_name"] as! String
            let lastName = faceDic["last_name"] as! String
            
            let picture = faceDic["picture"] as! NSDictionary
            let fbData = picture["data"] as! NSDictionary
            let fbUrl = fbData["url"] as! String
            
            if let url = URL(string: fbUrl) {
                do {
                    let data = try Data(contentsOf: url)
                    self.imageProfile.image = UIImage(data: data)
                } catch let error {
                    print(error.localizedDescription)
                }
            }
            
            /*
            print("ID : \(id)")
            print("Email : \(email)")
            print("Name : \(firstName) \(lastName)")
            print("Profile Image : \(url)")
            */
            
            self.lblStatus.text = "\(firstName) \(lastName)"
           
        })
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        if error != nil {
            lblStatus.text = error.localizedDescription
        } else if result.isCancelled {
            lblStatus.text = "User cancelled log in"
        } else {
            //successful login
            lblStatus.text = "User Logged in"
            getUserProfile()
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        lblStatus.text = "User logged out"
        imageProfile.image = nil
    }

}
