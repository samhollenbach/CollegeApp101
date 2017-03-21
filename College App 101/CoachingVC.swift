//
//  CoachingVC.swift
//  College App 101
//
//  Created by Eric Ota on 3/6/17.
//  Copyright © 2017 Sam Hollenbach. All rights reserved.
//

import UIKit

class CoachingVC: UIViewController {

    @IBOutlet weak var SAT_Guide_Image: UIImageView!
    
    @IBOutlet weak var CloseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showSATGuide(_ sender: UIButton) {
        SAT_Guide_Image.isHidden = false
        CloseButton.isEnabled = true
        SAT_Guide_Image.alpha = 0
        UIView.animate(withDuration: 0.5, animations: { finished in
            self.SAT_Guide_Image.alpha = 1
        })
        
    }
    
    @IBAction func closeSATGuide(_ sender: AnyObject) {
        CloseButton.isEnabled = false
        UIView.animate(withDuration: 0.5, animations: {
                self.SAT_Guide_Image.alpha = 0
            }, completion: { finished in
                self.SAT_Guide_Image.isHidden = true
            })
        
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
