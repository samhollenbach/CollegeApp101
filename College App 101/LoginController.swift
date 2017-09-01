//
//  CoachingVC.swift
//  College App 101
//
//  Created by Eric Ota on 3/6/17.
//  Copyright © 2017 Sam Hollenbach. All rights reserved.
//

import UIKit
import Firebase

class LoginController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var passfield: UITextField!
    
    @IBOutlet weak var loginStatusLabel: UILabel!
    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginStatusLabel.adjustsFontSizeToFitWidth = true
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            // ...
        }
        // Do any additional setup after loading the view.
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signupPressed(_ sender: Any) {
        if let email = username.text {
            if let password = passfield.text {
                self.loginStatusLabel.textColor = UIColor.black
                self.loginStatusLabel.text = "Creating new account..."
                Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                    if let error = error {
                        self.loginStatusLabel.textColor = UIColor.red
                        self.loginStatusLabel.text = "\(error.localizedDescription)"
                        return
                    }
                self.loginStatusLabel.text = "Successfully created account with \(email)!"
                print("\(user!.email!) created")
                }
            }
        }
    }

    
    @IBAction func loginPressed(_ sender: Any) {
        if let email = self.username.text, let password = self.passfield.text {
            self.loginStatusLabel.textColor = UIColor.black
            self.loginStatusLabel.text = "Loggin in..."
            Auth.auth().signIn(withEmail: email, password: password){ (user, error) in
                if let error = error {
                    self.loginStatusLabel.textColor = UIColor.red
                    self.loginStatusLabel.text = "\(error.localizedDescription)"
                    return
                }
                self.loginStatusLabel.text = "Sucessfully logged in"
                
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                print("\(user!.email!) created")
                //self.navigationController!.popViewController(animated: true)
            }
        }
    }

}
