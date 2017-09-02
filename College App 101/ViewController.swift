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
        
        //let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let vc0 = CoachingVC(nibName: "CoachingVC", bundle: nil)
        self.addChildViewController(vc0)
        self.mainScroll.addSubview(vc0.view)
        vc0.didMove(toParentViewController: self)
        var frame0 = vc0.view.frame
        frame0.origin.x = self.view.frame.size.width
        vc0.view.frame = frame0
        
        let vc1 = TheHubVC(nibName: "TheHubVC", bundle: nil)
        self.addChildViewController(vc1)
        self.mainScroll.addSubview(vc1.view)
        vc1.didMove(toParentViewController: self)
        
//        let vc2 = AchievementTrackerVC(nibName: "AchievementTrackerVC", bundle: nil)
//        var frame2 = vc2.view.frame
//        frame2.origin.x = self.view.frame.size.width * 2
//        vc2.view.frame = frame2
//        //self.addChildViewController(vc2)
//        //self.mainScroll.addSubview(vc2.view)
//        vc2.didMove(toParentViewController: self)
        
        self.mainScroll.contentSize = CGSize(width: self.view.frame.size.width * 2, height: self.view.frame.size.height)
        //self.mainScroll.contentOffset.x = self.view.frame.size.width
    }
    
    //THIS METHOD WORKS, figure out where/how to call it appropriately.
    public func segueCoachingLobby(){
        let newVC = CoachingLobbyVC(nibName: "CoachingLobbyVC", bundle: nil)
        self.addChildViewController(newVC)
        self.mainScroll!.addSubview(newVC.view)
        newVC.didMove(toParentViewController: self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

