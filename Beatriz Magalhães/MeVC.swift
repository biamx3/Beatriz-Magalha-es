//
//  MeVC.swift
//  Beatriz Magalhães
//
//  Created by Beatriz Melo Mousinho Magalhães on 4/26/15.
//  Copyright (c) 2015 Beatriz Melo Mousinho Magalhães. All rights reserved.
//

import UIKit

class MeVC: UIViewController {

    @IBOutlet weak var portView: UIView!
    @IBOutlet weak var linkView: UIView!
    @IBOutlet weak var eView: UIView!
    @IBOutlet weak var meLabel: UILabel!
    
    //Screen size
    var width = UIScreen.mainScreen().bounds.size.width
    var height = UIScreen.mainScreen().bounds.size.height

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = false
        
        var b = UIBarButtonItem(title: "menu>", style: .Plain, target: self, action: Selector("sayHello"))
        
        self.navigationItem.rightBarButtonItem = b
        
        let swiftColor = UIColor(red: 251/255, green: 169/255, blue: 111/255, alpha: 1)
        navigationController?.navigationBar.tintColor = swiftColor
        navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Geeza Pro", size: 20)!], forState: UIControlState.Normal)
        
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "<back", style: UIBarButtonItemStyle.Plain, target: self, action: "back:")
        self.navigationItem.leftBarButtonItem = newBackButton;
        navigationController?.navigationBar.tintColor = swiftColor
        
        
        //  Me Label
        self.meLabel.frame.origin.x = self.width
        self.meLabel.alpha = 0.0
        UIView.animateWithDuration(3.0, delay: 0.025, usingSpringWithDamping: 0.55, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.meLabel.alpha = 1.0
            self.meLabel.frame.origin.x = 440
            
            }, completion: { finished in
        })
        
        //  Link View
        self.linkView.frame.origin.x = self.width
        self.linkView.alpha = 0.0
        UIView.animateWithDuration(3.0, delay: 0.05, usingSpringWithDamping: 0.55, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.linkView.alpha = 0.8
            self.linkView.frame.origin.x = 440
            
            }, completion: { finished in
        })
        //  EView
        self.eView.frame.origin.x = self.width
        self.eView.alpha = 0.0
        UIView.animateWithDuration(3.0, delay: 0.075, usingSpringWithDamping: 0.55, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.eView.alpha = 0.8
            self.eView.frame.origin.x = 440
            
            }, completion: { finished in
        })
        
        //  PortView
        self.portView.frame.origin.x = self.width
        self.portView.alpha = 0.0
        UIView.animateWithDuration(3.0, delay: 0.025, usingSpringWithDamping: 0.55, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.portView.alpha = 0.8
            self.portView.frame.origin.x = 440
            
            }, completion: { finished in
        })
    }

    func sayHello(){
        performSegueWithIdentifier("meMenu", sender: self)
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
