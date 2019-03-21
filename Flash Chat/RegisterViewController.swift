//
//  RegisterViewController.swift
//  Flash Chat
//
//  This is the View Controller which registers new users with Firebase
//

import UIKit
import SVProgressHUD
import Firebase

class RegisterViewController: UIViewController {

    
    //Pre-linked IBOutlets

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  
    @IBAction func registerPressed(_ sender: AnyObject) {
		SVProgressHUD.show();
        

		
		if let tempVal = emailTextfield.text, let passTemp = passwordTextfield.text {
        //TODO: Set up a new user on our Firbase database
			Auth.auth().createUser(withEmail: tempVal, password: passTemp) {
				(user, error) in
				
				if error != nil {
					print(error!)
				} else {
					SVProgressHUD.dismiss();
					print("\nSuccessfully registered: \(self.emailTextfield.text!)\n")
					self.performSegue(withIdentifier: "goToChat", sender: self)
				}
			}
		}

        
        
    } 
    
    
}
