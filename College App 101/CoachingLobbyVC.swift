//
//  CoachingLobbyVC.swift
//  College App 101
//
//  Created by Eric Ota on 8/19/17.
//  Copyright © 2017 Sam Hollenbach. All rights reserved.
//

import UIKit

class CoachingLobbyVC: UIViewController {
    
    @IBOutlet var coachingLobbyView: UIView!
    
    var coachingLandingPage : UIViewController? = nil

    var mainMenuVC : ViewController? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goBackButton(_ sender: AnyObject) {
        mainMenuVC?.slideOutVC(vc: coachingLandingPage!, onPanel: 1){_ in 
    
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
