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
    var viewControllers : [UIViewController] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let vc0 = CoachingVC(nibName: "CoachingVC", bundle: nil)
        vc0.mainMenuVC = self
        //self.addChildViewController(vc0)
        //self.mainScroll.addSubview(vc0.view)
        //vc0.didMove(toParentViewController: self)
        //var frame0 = vc0.view.frame
        //frame0.origin.x = self.view.frame.size.width
        //vc0.view.frame = frame0
        
        
        
        let vc1 = TheHubVC(nibName: "TheHubVC", bundle: nil)
        //self.addChildViewController(vc1)
        //self.mainScroll.addSubview(vc1.view)
        //vc1.didMove(toParentViewController: self)
        
        viewControllers.append(vc1)
        viewControllers.append(vc0)
        
//        let vc2 = AchievementTrackerVC(nibName: "AchievementTrackerVC", bundle: nil)
//        var frame2 = vc2.view.frame
//        frame2.origin.x = self.view.frame.size.width * 2
//        vc2.view.frame = frame2
//        //self.addChildViewController(vc2)
//        //self.mainScroll.addSubview(vc2.view)
//        vc2.didMove(toParentViewController: self)
        refreshMainVews()
        
        //self.mainScroll.contentOffset.x = self.view.frame.size.width
    }
    
    public func refreshMainVews(){
        self.childViewControllers.forEach({ $0.removeFromParentViewController() })
        self.mainScroll.subviews.forEach({ $0.removeFromSuperview() })
        
        for (i, vc) in viewControllers.enumerated(){
            
            self.addChildViewController(vc)
            self.mainScroll.addSubview(vc.view)
            var frame = vc.view.frame
            frame.origin.x = self.view.frame.size.width * CGFloat(i)
            vc.view.frame = frame
            vc.didMove(toParentViewController: self)
        }
        
        self.mainScroll.contentSize = CGSize(width: self.view.frame.size.width * CGFloat(viewControllers.count), height: self.view.frame.size.height)
        
    }
    
    //THIS METHOD WORKS, figure out where/how to call it appropriately.
    public func segueCoachingLobby(){
        let storyboard = UIStoryboard(name: "CoachingLobby", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CoachingLobby") as! CoachingLobbyVC
        vc.mainMenuVC = self
        vc.coachingLandingPage = viewControllers[1]
        slideInVC(vc: vc, onPanel: 1){_ in
            
        }
        
        
        
        //self.addChildViewController(newVC)
        //self.mainScroll!.addSubview(newVC.view)
        //newVC.didMove(toParentViewController: self)
        
    }
    
    
    public func slideInVC(vc : UIViewController, onPanel : Int, completion: @escaping (Bool) -> ()){
        self.mainScroll.addSubview(vc.view)
        var frame = vc.view.frame
        frame.origin.x = self.view.frame.size.width * CGFloat(onPanel)
        frame.origin.y = self.view.frame.size.height
        vc.view.frame = frame
        //vc.didMove(toParentViewController: self)
        UIView.animate(withDuration: 0.3, animations: {
            vc.view.frame.origin.y = 0
            
            }, completion: {
                c in
                self.viewControllers[onPanel] = vc
                self.refreshMainVews()
                completion(c)
        })
    }
    
    public func slideOutVC(vc : UIViewController, onPanel : Int, completion: @escaping (Bool) -> ()){
        let vcOrig = viewControllers[onPanel]
        vcOrig.view.removeFromSuperview()
        self.mainScroll.addSubview(vc.view)
        self.mainScroll.addSubview(vcOrig.view)
        //var frame = vcOrig.view.frame
        //frame.origin.x = self.view.frame.size.width * CGFloat(onPanel)
        //frame.origin.y = self.view.frame.size.height
        //vc.view.frame = frame
        //vc.didMove(toParentViewController: self)
        UIView.animate(withDuration: 0.3, animations: {
            vcOrig.view.frame.origin.y = self.view.frame.size.height
            
            }, completion: {
                c in
                self.viewControllers[onPanel] = vc
                self.refreshMainVews()
                completion(c)
        })
        

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

