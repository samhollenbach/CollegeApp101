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
    
    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
                Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                    if let error = error {
                        //self.showMessagePrompt(error.localizedDescription)
                        return
                    }
                print("\(user!.email!) created")
                //self.navigationController!.popViewController(animated: true)
                }
            }
        }
    }

    
    @IBAction func loginPressed(_ sender: Any) {
        if let email = self.username.text, let password = self.passfield.text {
            Auth.auth().signIn(withEmail: email, password: password){ (user, error) in
                // [START_EXCLUDE]
                if let error = error {
                    //self.showMessagePrompt(error.localizedDescription)
                    return
                }
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                print("\(user!.email!) created")
                //self.navigationController!.popViewController(animated: true)
            }
            // [END_EXCLUDE]
        }
    }

}
