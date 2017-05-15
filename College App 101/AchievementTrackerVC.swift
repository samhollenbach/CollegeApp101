//
//  AchievementTrackerVC.swift
//  College App 101
//
//  Created by Eric Ota on 3/6/17.
//  Copyright © 2017 Sam Hollenbach. All rights reserved.
//

import UIKit

class AchievementTrackerVC: UIViewController {

    @IBOutlet weak var classesBtn: UIButton!
    @IBOutlet weak var interestsBtn: UIButton!
    @IBOutlet weak var sportsBtn: UIButton!
    @IBOutlet weak var volunteeringBtn: UIButton!
    @IBOutlet weak var workExperienceBtn: UIButton!
    @IBOutlet weak var schoolInvolvementBtn: UIButton!
    @IBOutlet weak var testingBtn: UIButton!
    @IBOutlet weak var awardsBtn: UIButton!
    @IBOutlet weak var otherBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func classesPressed(_ sender: UIButton) {
        classesBtn.setTitle("YEE BRUH", for: .normal)
    }
    
    @IBAction func interestsPressed(_ sender: UIButton) {
        interestsBtn.setTitle("YEE BRUH", for: .normal)
    }
    
    @IBAction func sportsPressed(_ sender: Any) {
        sportsBtn.setTitle("YEE BRUH", for: .normal)
    }
    
    @IBAction func volunteeringPressed(_ sender: Any) {
    }
    
    @IBAction func workExperiencePressed(_ sender: Any) {
    }
    
    @IBAction func schoolInvolvementPressed(_ sender: Any) {
    }
    
    @IBAction func testingPressed(_ sender: Any) {
    }
    
    @IBAction func awardsPressed(_ sender: Any) {
    }
    
    @IBAction func otherPressed(_ sender: Any) {
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
