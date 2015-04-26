//
//  ConfessionVC.swift
//  Beatriz Magalhães
//
//  Created by Beatriz Melo Mousinho Magalhães on 4/24/15.
//  Copyright (c) 2015 Beatriz Melo Mousinho Magalhães. All rights reserved.
//

import UIKit

class ConfessionVC: UIViewController {
    
    
    //Var
    var w:CGFloat = 1
    //Labels
    @IBOutlet weak var confessionLabel: UILabel!
    @IBOutlet weak var beforeLabel: UILabel!
    @IBOutlet weak var okLabel: UILabel!
    @IBOutlet weak var swipeLabel: UILabel!
    
    @IBOutlet weak var wholeLabel: UIView!
    @IBOutlet weak var fiveLabel: UILabel!
    @IBOutlet weak var monthsLabel: UILabel!
    @IBOutlet weak var iLabel: UILabel!
    @IBOutlet weak var noLabel: UILabel!
    @IBOutlet weak var ideaLabel: UILabel!
    
    var ofwhatLabel = UILabel()
    var wasLabel = UILabel()
    var stringLabel = UILabel()
    
    //Front Brian
    var image:UIImage!
    var imageView:UIImageView!
    
    //Run and jump
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
    
    var brianJumpArray: [UIImage] = [
        UIImage(named: "jump1.png")!,
        UIImage(named: "jump2.png")!,
        UIImage(named: "jump3.png")!,
        UIImage(named: "jump4.png")!,
        UIImage(named: "jump5.png")!,
        UIImage(named: "jump6.png")!,
        UIImage(named: "jump7.png")!
    ]

    
    //Button
    var brian2Button:UIButton!
    
    //Screen size
    var width = UIScreen.mainScreen().bounds.size.width
    var height = UIScreen.mainScreen().bounds.size.height
    
    
    override func viewWillAppear(animated: Bool) {
        

        
        //Brian
        
        self.image = UIImage(named: "frontbrian.png")!
        self.imageView = UIImageView(image: image)
        self.imageView!.frame = CGRectMake(0,265,144,172)
        self.view.addSubview(imageView!)
        
        
        
        //Hide Labels and Brian image view
        
        self.confessionLabel.alpha = 0
        self.beforeLabel.alpha = 0
        self.fiveLabel.alpha = 0
        self.monthsLabel.alpha = 0
        self.iLabel.alpha = 0
        self.noLabel.alpha = 0
        self.ideaLabel.alpha = 0
        self.imageView.alpha = 0.0
        self.swipeLabel.alpha = 0.0
        
        
        
        //Show Labels
        UIView.animateWithDuration(1.0, delay: 2.0, options: nil, animations: {
            self.beforeLabel.alpha = 1.0
            }, completion: nil)
        
        UIView.animateWithDuration(0.7, delay: 4.5, options: nil, animations: {
            self.confessionLabel.alpha = 1.0
            }, completion: nil)
        
        UIView.animateWithDuration(10, delay: 6.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.2, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.confessionLabel.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2))
            }, completion:nil)
        
        UIView.animateWithDuration(8.0, delay: 6.8, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.2, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.beforeLabel.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2))
            }, completion:nil)
        
        UIView.animateWithDuration(5.0, delay: 7.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.2, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.okLabel.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2))
            }, completion:{finished in
        })
        var timer = NSTimer.scheduledTimerWithTimeInterval(7.5, target: self, selector: Selector("update"), userInfo: nil, repeats: false)
    }
    
    func update(){
        println("\(self.fiveLabel.frame.origin.x)")
        UIView.animateWithDuration(4.5, delay:0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.2, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.confessionLabel.frame.origin.y = self.height
            }, completion:nil)
        UIView.animateWithDuration(4.0, delay:0.3, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.2, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.beforeLabel.frame.origin.y = self.height
            }, completion:nil)
        UIView.animateWithDuration(3.5, delay:0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.2, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.okLabel.frame.origin.y = self.height
            }, completion:nil)
        UIView.animateWithDuration(1.0, delay:0, options: nil, animations: {
            self.fiveLabel.alpha = 1.0
        }, completion: nil)
        UIView.animateWithDuration(2.0, delay:0.0, options: nil, animations: {
            self.monthsLabel.alpha = 1.0
            }, completion: nil)
    
        UIView.animateWithDuration(1.5, delay:1.5, options: nil, animations: {
        self.iLabel.alpha = 1.0
            }, completion: nil)
        UIView.animateWithDuration(1.0, delay:2.5, options: nil, animations: {
            self.noLabel.alpha = 1.0
            }, completion: nil)
        UIView.animateWithDuration(1.0, delay:2.5, options: nil, animations: {
            self.ideaLabel.alpha = 1.0
            }, completion:{finished in
                UIView.animateWithDuration(1.0, delay:0.0, options: nil, animations: {
                    self.ofwhatLabel.alpha = 1.0
                    }, completion: {finished in
                        self.stringLabel.alpha = 1.0
                        UIView.animateWithDuration(1.0, delay:0.0, options: nil, animations: {
                            self.wasLabel.alpha = 1.0
                            }, completion: {finished in
                                UIView.animateWithDuration(0.1, delay: 0.0, options: nil, animations: {
                                    self.imageView.alpha=1.0
                                    }, completion: nil)
                                UIView.animateWithDuration(1.0, delay:3.0, options: nil, animations: {
                                    //self.imageView.alpha=1.0
                                    self.imageView.animationImages = self.brianRunArray
                                    self.imageView.animationDuration = 1.0
                                    self.imageView.animationRepeatCount = 1
                                    self.imageView.startAnimating()
                                    }, completion: nil)
                            })
                               // self.imageView.alpha=1.0
    
                        //Brian
                        UIView.animateWithDuration(1.0, delay:0.0, options: nil, animations: {

                            self.imageView.frame = CGRectMake(95,265,144,172)
                            }, completion: nil)
                        
                })
                

                UIView.animateWithDuration(0.5, delay:0.0, options: nil, animations: {
                    self.wholeLabel.frame.origin.x = 30
                    }, completion: nil)
        })
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "<back", style: UIBarButtonItemStyle.Plain, target: self, action: "back:")
        let swiftColor = UIColor(red: 251/255, green: 169/255, blue: 111/255, alpha: 1)
        navigationController?.navigationBar.tintColor = swiftColor
        
        let backButton = UIBarButtonItem(title: "< back", style: UIBarButtonItemStyle.Plain, target: self, action: "goBack:")
        navigationItem.leftBarButtonItem = backButton
        navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Geeza Pro", size: 20)!], forState: UIControlState.Normal)

        self.navigationItem.leftBarButtonItem = newBackButton;
        
        //Swipe
        
        var leftSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        var rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        leftSwipe.direction = .Left
        rightSwipe.direction = .Right
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        
        
        
        //Brian Button
        
        brian2Button = UIButton()
        brian2Button.frame = CGRectMake(95,265,144,172)
        brian2Button.addTarget(self, action: "brianPressed:", forControlEvents: .TouchUpInside)
        self.view.addSubview(brian2Button)
        
        //Of what a Label
        
        self.ofwhatLabel.text = "of what a"
        self.ofwhatLabel.font = UIFont(name: "Geeza Pro", size: 33)
        self.ofwhatLabel.frame = CGRectMake(400,490, 200, 172)
        self.ofwhatLabel.textColor = UIColor(red: 122/255, green: 132/255, blue: 255/255, alpha: 1.0)
        self.view.addSubview(self.ofwhatLabel)
        self.ofwhatLabel.alpha = 0.0
        
        
        
        //String Label
        
        self.stringLabel.text = "String"
        self.stringLabel.font = UIFont(name: "Menlo", size: 90)
        self.stringLabel.frame = CGRectMake(500,440, 400, 400)
        self.stringLabel.textColor = UIColor.redColor()
        self.view.addSubview(self.stringLabel)
        self.stringLabel.alpha = 0.0
        
        
        
        //was Label
        
        self.wasLabel.text = "was"
        self.wasLabel.font = UIFont(name: "Menlo-Italic", size: 60)
        self.wasLabel.frame = CGRectMake(860,500, 400, 400)
        self.wasLabel.textColor = UIColor(red: 122/255, green: 132/255, blue: 255/255, alpha: 1.0)
        
        
        
        self.view.addSubview(self.wasLabel)
        self.wasLabel.alpha = 0.0
        


        
     }
    
    func brianPressed(sender: UIButton!){
        self.w++
        if self.w == 2{
            self.imageView.animationImages = self.brianJumpArray
            self.imageView.animationDuration = 0.9
            self.imageView.animationRepeatCount = 1
            self.imageView.startAnimating()
            
            UIView.animateWithDuration(0.8, delay: 0.0, options: nil, animations: {
                self.imageView.frame.origin.x = (self.imageView.frame.origin.x*3.2)
                self.imageView.frame.origin.y = (self.imageView.frame.origin.y+72)
                }, completion: {finished in
                    self.imageView.animationImages = self.brianJumpArray
                    self.imageView.animationDuration = 0.8
                    self.imageView.animationRepeatCount = 1
                    self.imageView.startAnimating()
                        UIView.animateWithDuration(0.7, delay: 0.0, options: nil, animations: {
                            self.imageView.frame.origin.x = (self.imageView.frame.origin.x+100)
                            self.imageView.frame.origin.y = (self.imageView.frame.origin.y+60)
                            }, completion: {finished in
                                self.imageView.animationImages = self.brianJumpArray
                                self.imageView.animationDuration = 0.8
                                self.imageView.animationRepeatCount = 1
                                self.imageView.startAnimating()
                                    UIView.animateWithDuration(0.9, delay: 0.0, options: nil, animations: {
                                        self.imageView.frame.origin.x = (self.imageView.frame.origin.x+120)
                                        self.imageView.frame.origin.y = (self.imageView.frame.origin.y+40)
                                        self.brian2Button.frame = self.imageView.frame
                                        self.swipeLabel.alpha = 1.0
                                        }, completion: nil)
                    })
            })
        }
    }
    
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        if (sender.direction == .Right) {
            println("Swipe Right")
            performSegueWithIdentifier("fourthsegue", sender: sender)
            
        }
        if (sender.direction == .Left) {
    }
    }
    
    func back(sender: UIBarButtonItem) {
        // Perform your custom actions
        
        var introductionVC:IntroductionVC = IntroductionVC()
        // ...
        // Go back to the previous ViewController
        //self.navigationController?.popViewControllerAnimated(true)
        //        self.navigationController?.popToViewController(introductionVC, animated: false)
        
        performSegueWithIdentifier("backtoArt", sender: sender)
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
