//
//  ViewController.swift
//  College App 101
//
//  Created by Sam Hollenbach on 2/26/17.
//  Copyright © 2017 Sam Hollenbach. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainScroll: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let vc0 = CoachingVC(nibName: "CoachingVC", bundle: nil)
        self.addChildViewController(vc0)
        self.mainScroll.addSubview(vc0.view)
        vc0.didMove(toParentViewController: self)
        
        let vc1 = TheHubVC(nibName: "TheHubVC", bundle: nil)
        var frame1 = vc1.view.frame
        frame1.origin.x = self.view.frame.size.width
        vc1.view.frame = frame1
        self.addChildViewController(vc1)
        self.mainScroll.addSubview(vc1.view)
        vc1.didMove(toParentViewController: self)
        
        let vc2 = AchievementTrackerVC(nibName: "AchievementTrackerVC", bundle: nil)
        var frame2 = vc2.view.frame
        frame2.origin.x = self.view.frame.size.width * 2
        vc2.view.frame = frame2
        self.addChildViewController(vc2)
        self.mainScroll.addSubview(vc2.view)
        vc2.didMove(toParentViewController: self)
        
        self.mainScroll.contentSize = CGSize(width: self.view.frame.size.width * 3, height: self.view.frame.size.height)
        self.mainScroll.contentOffset.x = self.view.frame.size.width

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

