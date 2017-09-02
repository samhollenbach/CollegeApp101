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
    
    // This list holds the two main view controllers
    var viewControllers : [UIViewController] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc0 = CoachingVC(nibName: "CoachingVC", bundle: nil)
        
        let vc1 = TheHubVC(nibName: "TheHubVC", bundle: nil)
        
        //Called in reverse order so coaching is on the right
        viewControllers.append(vc1)
        viewControllers.append(vc0)
        
        refreshMainVews()
    }
    
    //This method now does everything we were doing in viewDidLoad(), but for the views in the viewControllers list
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
    
    public func segueCoachingLobby(){
        let storyboard = UIStoryboard(name: "CoachingLobby", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CoachingLobby") as! CoachingLobbyVC
        vc.mainMenuVC = self
        vc.coachingLandingPage = viewControllers[1]
        slideInVC(vc: vc, onPanel: 1){ finished in
            print(finished)
            //You can put any stuff to run after the slide method completes in here
            //Finished is a boolean which just said if it finished running or not (i think always true here)
        }
        
    }
    
    // vc will slide up over the existing view on specified panel
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
    
    // vc will appear behind current view on specified panel, and the original view will slide down out of view
    public func slideOutVC(vc : UIViewController, onPanel : Int, completion: @escaping (Bool) -> ()){
        let vcOrig = viewControllers[onPanel]
        vcOrig.view.removeFromSuperview()
        self.mainScroll.addSubview(vc.view)
        self.mainScroll.addSubview(vcOrig.view)
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

