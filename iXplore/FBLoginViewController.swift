//
//  FBLoginViewController.swift
//  iXplore
//
//  Created by Larissa Clopton on 7/13/16.
//  Copyright © 2016 Larissa Clopton. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class FBLoginViewController: UIViewController , FBSDKLoginButtonDelegate {
    
    
    @IBOutlet weak var loginButton: FBSDKLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if (FBSDKAccessToken.currentAccessToken() != nil) {
            let mapViewController = MapViewController(nibName: "MapViewController", bundle: nil)
            navigationController?.pushViewController(mapViewController, animated: false)
        }
        else {
            loginButton.readPermissions = ["email"]
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("User Logged In")
    
        
        if error != nil {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            let mapViewController = MapViewController(nibName: "MapViewController", bundle: nil)
            navigationController?.pushViewController(mapViewController, animated: true)
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
    }
    
    func returnUserData() {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil) {
                // Process error
                print("Error: \(error)")
            }
            else {
                print("fetched user: \(result)")
                let userName : NSString = result.valueForKey("name") as! NSString
                print("User Name is: \(userName)")
                let userEmail : NSString = result.valueForKey("email") as! NSString
                print("User Email is: \(userEmail)")
            }
        })
    }
    
    
}

