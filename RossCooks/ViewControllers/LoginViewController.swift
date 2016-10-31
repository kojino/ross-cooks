//
//  LoginViewController.swift
//  RossCooks
//
//  Created by Luca Hagel on 10/13/16.
//  Copyright © 2016 Luca Hagel. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!

  @IBAction func loginButton(_ sender: AnyObject) {
    FIRAuth.auth()!.signIn(withEmail: emailTextField.text!,
                           password: passwordTextField.text!)
    //if let user: FIRUser = FIRAuth.auth()?.currentUser {
      //print(user.email)
    //}
  }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
}
