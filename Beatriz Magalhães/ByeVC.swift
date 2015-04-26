//
//  ByeVC.swift
//  Beatriz Magalhães
//
//  Created by Beatriz Melo Mousinho Magalhães on 4/26/15.
//  Copyright (c) 2015 Beatriz Melo Mousinho Magalhães. All rights reserved.
//

import UIKit

class ByeVC: UIViewController {
    
    @IBOutlet weak var brianView: UIView!
    
    //Screen size
    var width = UIScreen.mainScreen().bounds.size.width
    var height = UIScreen.mainScreen().bounds.size.height
    
    //var x
    var x:Int = 1
    
    //Labels
    @IBOutlet weak var thanksLabel: UILabel!
    @IBOutlet weak var knowLabel: UILabel!
    
    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var creatingLabel: UILabel!
    @IBOutlet weak var dreamingLabel: UILabel!
    @IBOutlet weak var wwdcLabel: UILabel!

    
    //Run and jump animation images
    var brianJumpArray: [UIImage] = [
        UIImage(named: "jump1.png")!,
        UIImage(named: "jump2.png")!,
        UIImage(named: "jump3.png")!,
        UIImage(named: "jump4.png")!,
        UIImage(named: "jump5.png")!,
        UIImage(named: "jump6.png")!,
        UIImage(named: "jump7.png")!
    ]
    
    var brianRunArray: [UIImage] = [
        UIImage(named: "run1.png")!,
        UIImage(named: "run2.png")!,
        UIImage(named: "run3.png")!,
        UIImage(named: "run4.png")!,
        UIImage(named: "run5.png")!,
        UIImage(named: "run6.png")!,
        UIImage(named: "run7.png")!,
        UIImage(named: "run8.png")!,
        UIImage(named: "run9.png")!,
        UIImage(named: "run10.png")!,
        UIImage(named: "run11.png")!,
        UIImage(named: "run12.png")!,
    ]
    //Front Brian
    let frontbrain = UIImage(named: "frontbrian")
    var image:UIImage!
    var imageView:UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = false
        
        var b = UIBarButtonItem(title: "menu>", style: .Plain, target: self, action: Selector("sayHello"))
        
        
        
        let swiftColor = UIColor(red: 251/255, green: 169/255, blue: 111/255, alpha: 1)
        navigationController?.navigationBar.tintColor = swiftColor
        navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Geeza Pro", size: 20)!], forState: UIControlState.Normal)
        
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "<back", style: UIBarButtonItemStyle.Plain, target: self, action: "back:")
        self.navigationItem.leftBarButtonItem = newBackButton;
        navigationController?.navigationBar.tintColor = swiftColor
        self.navigationItem.rightBarButtonItem = b
        
        
        //Hide Labels
        self.goalLabel.alpha = 0.0
        self.creatingLabel.alpha = 0.0
        self.dreamingLabel.alpha = 0.0
        self.thanksLabel.alpha = 0.0
        self.wwdcLabel.alpha = 0.0
        self.knowLabel.alpha = 0.0
        
        //Show Brian Button
        self.imageView = UIImageView(image: self.frontbrain!)
        imageView.frame = CGRect(x: 0, y: 0, width: 144, height: 172)
        self.brianView.addSubview(imageView)
        
        self.brianView.frame = CGRectMake(self.width/5, 570, self.brianView.frame.width, self.brianView.frame.height)
        
        self.brianView.frame.origin.y = 570
    }
    
    func back(sender: UIBarButtonItem) {
        performSegueWithIdentifier("backProject", sender: sender)
    }
    
    func sayHello(){
        performSegueWithIdentifier("byeMenu", sender: self)
    }
    
    @IBAction func brianButton(sender: UIButton) {
        self.x++
        
        //Appearing Introducion Labels
        if self.x == 2 {
            
            self.imageView.animationImages = self.brianJumpArray
            self.imageView.animationDuration = 0.7
            self.imageView.animationRepeatCount = 1
            self.imageView.startAnimating()
            
            UIView.animateWithDuration(0.4, animations:{
                self.thanksLabel.alpha = 1.0
                self.brianView.frame.origin.x = (self.brianView.frame.origin.x*1.4)
                
            })
            
        }else if self.x == 3 {
            
            self.imageView.animationImages = self.brianJumpArray
            self.imageView.animationDuration = 0.7
            self.imageView.animationRepeatCount = 1
            self.imageView.startAnimating()
            
            
            UIView.animateWithDuration(0.5, animations:{
                self.knowLabel.alpha = 1.0
                self.brianView.frame.origin.x = (self.brianView.frame.origin.x*1.3)
            })
        } else if self.x == 4{
            self.imageView.animationImages = self.brianJumpArray
            self.imageView.animationDuration = 0.7
            self.imageView.animationRepeatCount = 1
            self.imageView.startAnimating()
            
            UIView.animateWithDuration(0.6, animations:{
                self.goalLabel.alpha = 1.0
                self.brianView.frame.origin.x = (self.brianView.frame.origin.x*1.4)
            })
            UIView.animateWithDuration(0.7, animations:{
                self.creatingLabel.alpha = 1.0
                self.brianView.frame.origin.x = (self.brianView.frame.origin.x*1.5)
            })
        } else if self.x == 5{
            self.imageView.animationImages = self.brianJumpArray
            self.imageView.animationDuration = 1.2
            self.imageView.animationRepeatCount = 1
            self.imageView.startAnimating()
            
            UIView.animateWithDuration(0.7, animations:{
                self.brianView.frame.origin.x = (self.brianView.frame.origin.x*1.2)
                self.dreamingLabel.alpha=1.0
            })
        }else if self.x == 6 {
            self.imageView.animationImages = self.brianRunArray
            self.imageView.animationDuration = 1.2
            self.imageView.animationRepeatCount = 1
            self.imageView.startAnimating()
            
            UIView.animateWithDuration(0.6, animations:{
                self.wwdcLabel.alpha = 1.0
                self.brianView.frame.origin.x = (self.brianView.frame.origin.x*2.5)
            })

        }
    }
    
    
override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
