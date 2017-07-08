//
//  CoachingVC.swift
//  College App 101
//
//  Created by Eric Ota on 3/6/17.
//  Copyright © 2017 Sam Hollenbach. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        //LOGIN PRESSED, CHECK IF USERNAME AND PASSWORD ARE A LEGIT ACOUNT, THEN LOGIN
    }
    
    
}
