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
    FIRAuth.auth()!.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
      if error == nil {
        
        self.performSegue(withIdentifier: "loggedIn", sender: self)
        
      } else if let errormsg = error?.localizedDescription {
        
        let alert = UIAlertController(title: "Alert", message: errormsg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
      
        print(errormsg)
        
      } else {
        
        print("Auth Error")
        
      }
    }
  }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
