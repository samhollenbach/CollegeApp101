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
    
    @IBOutlet weak var generalBtn: UIButton!
    
    @IBOutlet weak var oooBtn: UIButton!
    
    @IBOutlet weak var selectedOutline: UIImageView!
    
    @IBOutlet weak var essayReviewBtn: UIButton!

    @IBOutlet weak var pickSchoolsBtn: UIButton!
    
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
        CloseButton.isEnabled = false                       //I MOVED THE CLOSE BOX DOWN
        UIView.animate(withDuration: 0.5, animations: {     //CUZ I DIDNT KNOW HOW TO
                self.SAT_Guide_Image.alpha = 0              //CLICK THE BUTTONS UNDER IT
            }, completion: { finished in
                self.SAT_Guide_Image.isHidden = true
            })
        
    }
    
    @IBAction func generalPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations: {self.selectedOutline.center.x = self.generalBtn.center.x}, completion: nil)
    }
    
    @IBAction func oooPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations: {self.selectedOutline.center.x = self.oooBtn.center.x}, completion: nil)
    }
    
    @IBAction func essayReviewPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations: {self.selectedOutline.center.x = self.essayReviewBtn.center.x}, completion: nil)
    }
    
    @IBAction func pickSchoolsPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations: {self.selectedOutline.center.x = self.pickSchoolsBtn.center.x}, completion: nil)

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
