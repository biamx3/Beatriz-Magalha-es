//
//  ViewController.swift
//  Beatriz Magalhães
//
//  Created by Beatriz Melo Mousinho Magalhães on 4/22/15.
//  Copyright (c) 2015 Beatriz Melo Mousinho Magalhães. All rights reserved.
//

import UIKit

class IntroductionVC: UIViewController {
    
    @IBOutlet weak var brianView: UIView!
    
    //Screen size
    var width = UIScreen.mainScreen().bounds.size.width
    var height = UIScreen.mainScreen().bounds.size.height
    
    var originalX:CGFloat!
    //var x
    var x:Int = 1
    
    //Labels
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!

    @IBOutlet weak var hiLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var studentLabel: UILabel!
    @IBOutlet weak var swiperightLabel: UILabel!
    
    @IBOutlet weak var swipeLabel: UILabel!
    
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
        
        //Set original X
        self.originalX = self.brianView.frame.origin.x
        println("\(self.originalX)")
        
        //Swipe
        var leftSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        var rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        leftSwipe.direction = .Left
        rightSwipe.direction = .Right
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        
        //Hide Labels
        self.hiLabel.alpha = 0.0
        self.nameLabel.alpha = 0.0
        self.ageLabel.alpha = 0.0
        self.studentLabel.alpha = 0.0
        self.swipeLabel.alpha = 0.0
        self.swiperightLabel.alpha = 0.0
        self.firstLabel.alpha = 0.0
        self.secondLabel.alpha = 0.0
        
        //Show instructions
        UIView.animateWithDuration(0.8, delay: 0.3, options: nil, animations: {
            self.firstLabel.alpha = 1.0
            self.secondLabel.alpha = 1.0
            }, completion: nil)
        
        
        //Show Brian Button
         self.imageView = UIImageView(image: self.frontbrain!)
        imageView.frame = CGRect(x: 0, y: 0, width: 144, height: 172)
        self.brianView.addSubview(imageView)
        
        self.brianView.frame = CGRectMake(self.width/5, 570, self.brianView.frame.width, self.brianView.frame.height)
        
        self.brianView.frame.origin.y = 570
    }
    
    @IBAction func brianButton(sender: UIButton) {
        
        //Disappearing Initial Introduction Labels
        UIView.animateWithDuration(0.2, animations:{
            self.firstLabel.alpha = 0.0
        })
        UIView.animateWithDuration(0.3, animations:{
            self.secondLabel.alpha = 0.0
        })
        
        self.x++
        
        //Appearing Introducion Labels
        if self.x == 2 {
            
            self.imageView.animationImages = self.brianJumpArray
            self.imageView.animationDuration = 0.7
            self.imageView.animationRepeatCount = 1
            self.imageView.startAnimating()

            UIView.animateWithDuration(0.4, animations:{
                self.hiLabel.alpha = 1.0
                self.brianView.frame.origin.x = (self.brianView.frame.origin.x*2)

             })
            
        }else if self.x == 3 {

            self.imageView.animationImages = self.brianJumpArray
            self.imageView.animationDuration = 0.7
            self.imageView.animationRepeatCount = 1
            self.imageView.startAnimating()


            UIView.animateWithDuration(0.5, animations:{
                self.nameLabel.alpha = 1.0
                    self.brianView.frame.origin.x = (self.brianView.frame.origin.x*2)
                })
        } else if self.x == 4{
            self.imageView.animationImages = self.brianJumpArray
            self.imageView.animationDuration = 0.7
            self.imageView.animationRepeatCount = 1
            self.imageView.startAnimating()

            UIView.animateWithDuration(0.6, animations:{
                self.ageLabel.alpha = 1.0
                self.brianView.frame.origin.x = (self.brianView.frame.origin.x*2)
            })
            UIView.animateWithDuration(0.7, animations:{
                self.studentLabel.alpha = 1.0
                self.brianView.frame.origin.x = (self.brianView.frame.origin.x*0.7)
            })
        } else if self.x == 5{
            self.imageView.animationImages = self.brianRunArray
            self.imageView.animationDuration = 1.2
            self.imageView.animationRepeatCount = 2
            self.imageView.startAnimating()
            
            UIView.animateWithDuration(2.0, animations:{
                self.brianView.frame.origin.x = (self.brianView.frame.origin.x*1.8)
                self.swiperightLabel.alpha=1.0
                self.swipeLabel.alpha = 1.0
                
            })
        }
    }
    
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        if (sender.direction == .Right) {
            println("Swipe Right")
            performSegueWithIdentifier("firstsegue", sender: sender)

            }
        if (sender.direction == .Left) {
            println("Swipe Left")
            
            //Reset Labels
            self.hiLabel.alpha = 0.0
            self.nameLabel.alpha = 0.0
            self.ageLabel.alpha = 0.0
            self.studentLabel.alpha = 0.0
            self.swipeLabel.alpha = 0.0
            
            //Reset X Value
            self.x = 1
            self.brianView.frame.origin.x = 102
        }
    }
 

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



