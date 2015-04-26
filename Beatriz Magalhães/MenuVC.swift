//
//  MenuVC.swift
//  Beatriz Magalhães
//
//  Created by Beatriz Melo Mousinho Magalhães on 4/26/15.
//  Copyright (c) 2015 Beatriz Melo Mousinho Magalhães. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {

    @IBOutlet weak var storyView: UIView!
    @IBOutlet weak var artView: UIView!
    @IBOutlet weak var devView: UIView!
    @IBOutlet weak var contactView: UIView!
    
    @IBOutlet weak var nameView: UIView!
    
    var storyButton:UIButton!
    var artButton:UIButton!
    
    //Screen size
    var width = UIScreen.mainScreen().bounds.size.width
    var height = UIScreen.mainScreen().bounds.size.height
    
    
    override func viewWillAppear(animated: Bool) {
  
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = true

     //   self.nameView.backgroundColor = UIColor(red: 255/255, green: 68/255, blue: 43/255, alpha: 1.0)
        nameView.alpha = 0.0
        
        //Name
        var nameLabel = UILabel()
        nameLabel.font = UIFont(name: "GeezaPro-Bold", size: 100)
        nameLabel.text = "BEATRIZ MAGALHAES"
        nameLabel.textColor = UIColor.whiteColor()
        nameLabel.textAlignment = .Center
        nameLabel.frame = CGRectMake(15, 15, self.width, 40)
        
        
        //  Name View
        self.nameView.frame = CGRectMake(900, 300, self.width*3, 60)
        self.nameView.alpha = 0.0
        UIView.animateWithDuration(3.6, delay: 1, usingSpringWithDamping: 0.55, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.nameView.alpha = 0.8
            self.nameView.frame = CGRectMake(0, 300, self.width*3, 60)
            
            }, completion: { finished in
                println(" life animation worked")
        })

        
        //  Story View
        self.storyView.frame = CGRect(x:self.width, y:350, width:750, height:70)
        self.storyView.alpha = 0.0
        UIView.animateWithDuration(3.6, delay: 0.25, usingSpringWithDamping: 0.55, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.storyView.alpha = 0.8
            self.storyView.frame = CGRect(x:170, y:350, width:650, height:70)
            
            }, completion: { finished in
                println(" life animation worked")
        })
        
        //  ArtView
        self.artView.frame = CGRect(x:self.width, y:440, width:750, height:70)
        self.artView.alpha = 0.0
        UIView.animateWithDuration(3.6, delay: 0.5, usingSpringWithDamping: 0.55, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.artView.alpha = 0.8
            self.artView.frame = CGRect(x:170, y:440, width:650, height:70)
            
            }, completion: { finished in
                println(" life animation worked")
        })
        
        //  ArtView
        self.devView.frame = CGRect(x:self.width, y:530, width:750, height:70)
        self.devView.alpha = 0.0
        UIView.animateWithDuration(3.6, delay: 0.65, usingSpringWithDamping: 0.55, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.devView.alpha = 0.8
            self.devView.frame = CGRect(x:170, y:530, width:650, height:70)
            
            }, completion: { finished in
                println(" life animation worked")
        })
        
        //  ArtView
        self.contactView.frame = CGRect(x:self.width, y:620, width:750, height:70)
        self.contactView.alpha = 0.0
        UIView.animateWithDuration(3.6, delay: 0.75, usingSpringWithDamping: 0.55, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.contactView.alpha = 0.8
            self.contactView.frame = CGRect(x:170, y:620, width:650, height:70)
            
            }, completion: { finished in
                println(" life animation worked")
        })

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
