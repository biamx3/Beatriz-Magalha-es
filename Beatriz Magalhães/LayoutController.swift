//
//  TraditionalCollectionVC.swift
//  Beatriz Magalhães
//
//  Created by Beatriz Melo Mousinho Magalhães on 4/23/15.
//  Copyright (c) 2015 Beatriz Melo Mousinho Magalhães. All rights reserved.
//

import UIKit

let reuseIdentifier = "collCell"

class LayoutController: UICollectionViewController, UICollectionViewDelegate {
    
    //Variable for Brian Button
    var k:CGFloat = 1
    
    //Screen size
    var width = UIScreen.mainScreen().bounds.size.width
    var height = UIScreen.mainScreen().bounds.size.height
    
    //Front Brian
    var image:UIImage!
    var imageView:UIImageView!
    
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
    
    //Buttons
    var brian2Button:UIButton!
    //var blankButton:UIButton!
    
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    
    
    let sectionInsets = UIEdgeInsets(top: 20.0, left: 0.0, bottom: 10.0, right: 0.0)
    
    
    override func viewWillAppear(animated: Bool) {
        
        //CUSTOMIZING NAVIGATION BAR
        
 

        //Brian
        UIView.animateWithDuration(1.0, animations:{
            self.imageView.frame = CGRectMake(102,570,144,172)
            self.imageView.animationImages = self.brianRunArray
            self.imageView.animationDuration = 0.5
            self.imageView.animationRepeatCount = 1
            self.imageView.startAnimating()
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = false

        
        let swiftColor = UIColor(red: 251/255, green: 169/255, blue: 111/255, alpha: 1)
        navigationController?.navigationBar.tintColor = swiftColor
        navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Geeza Pro", size: 20)!], forState: UIControlState.Normal)

        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "<back", style: UIBarButtonItemStyle.Plain, target: self, action: "back:")
        self.navigationItem.leftBarButtonItem = newBackButton;
        navigationController?.navigationBar.tintColor = swiftColor

        
        self.image = UIImage(named: "frontbrian.png")!
        self.imageView = UIImageView(image: image)
        
        
        self.imageView!.frame = CGRectMake(0,570,144,172)
        self.view.addSubview(imageView!)
        
        //Brian Button
        brian2Button = UIButton()
        brian2Button.frame = CGRectMake(102,570,144,172)
        brian2Button.addTarget(self, action: "brianPressed:", forControlEvents: .TouchUpInside)
        self.view.addSubview(brian2Button)

     
        //Layout customizing
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
    }
    
    
    func brianPressed(sender: UIButton!) {
        self.k++
        self.brian2Button.frame.origin.x = self.imageView.frame.origin.x*4.6
        if self.k==2{
            self.imageView.animationImages = self.brianRunArray
            self.imageView.animationDuration = 1.2
            self.imageView.animationRepeatCount = 1
            self.imageView.startAnimating()
            
            let label = UILabel()
            label.text = "keep tapping on Brian to continue!"
            label.font = UIFont(name: "Geeza Pro", size: 20)
            label.frame = CGRectMake(130, 620, 350, 172)
            label.numberOfLines = 1
            label.textColor = UIColor(red: 1, green: 116/255, blue: 79/255, alpha: 1.0)
            self.view.addSubview(label)
            label.alpha = 0.0
            
            UIView.animateWithDuration(1.5,animations:{
                self.imageView.frame.origin.x = (self.imageView.frame.origin.x*4.6)
            })
            
            UIView.animateWithDuration(1.3, delay: 1.0, options: nil, animations:{
                label.alpha = 1.0
                }, completion: nil)
            
        } else if self.k>=2 {
            self.imageView.animationImages = self.brianRunArray
            self.imageView.animationDuration = 1.2
            self.imageView.animationRepeatCount = 3
            self.imageView.startAnimating()
            UIView.animateWithDuration(1.3,animations:{
                self.imageView.frame.origin.x = self.imageView.frame.origin.x*2
                println("\(self.imageView.frame.origin.x)")
                
            var timer = NSTimer.scheduledTimerWithTimeInterval(0.7, target: self, selector: Selector("update"), userInfo: nil, repeats: false)
            })
        }
    }
    
    func update() {
        self.performSegueWithIdentifier("thirdsegue", sender: self)
    }

    
//    func blankPressed(sender: UIButton!){
//            performSegueWithIdentifier("secondsegue", sender: sender)
//    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }
    
    func back(sender: UIBarButtonItem) {
        // Perform your custom actions
        
        var introductionVC:IntroductionVC = IntroductionVC()
        // ...
        // Go back to the previous ViewController
        //self.navigationController?.popViewControllerAnimated(true)
//        self.navigationController?.popToViewController(introductionVC, animated: false)
        
        performSegueWithIdentifier("back1", sender: sender)
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return 6
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionViewCell
        let curr = indexPath.row % 6 + 1
        let imgName = "artwork\(curr).png"
        cell.pinImage.image = UIImage(named: imgName)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView!,
        layout collectionViewLayout: UICollectionViewLayout!,
        sizeForItemAtIndexPath indexPath: NSIndexPath!) -> CGSize {
            return CGSize(width: self.width*0.8, height: self.height*0.6)
    }
    
    func collectionView(collectionView: UICollectionView!,
        layout collectionViewLayout: UICollectionViewLayout!,
        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            return sectionInsets
    }
    
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        if (sender.direction == .Right) {
            println("Swipe Right")
            performSegueWithIdentifier("thirdsegue", sender: sender)
            
        }
    }

}
