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
    
    @IBOutlet weak var password: UITextField!
    
    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            // ...
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        if let email = self.username.text, let password = self.password.text {
            Auth.auth().createUser(withEmail: email, password: password)
        } else {
            //self.showMessagePrompt("email/password can't be empty")
        }
    }
    
    
}
