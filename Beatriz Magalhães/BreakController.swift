//
//  BreakController.swift
//  Beatriz Magalhães
//
//  Created by Beatriz Melo Mousinho Magalhães on 4/25/15.
//  Copyright (c) 2015 Beatriz Melo Mousinho Magalhães. All rights reserved.
//

import UIKit


class BreakController: UICollectionViewController, UICollectionViewDelegate {
    let reuseIdentifier = "callCell"
    
    //Label
    let label = UILabel()
    
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
    
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    
    
    let sectionInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    
    
    override func viewWillAppear(animated: Bool) {
        
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
        //        var fortextView = UIImageView()
        //        fortextView.frame = CGRectMake(15,220,110,600 )
        //        self.view.addSubview(fortextView)
        //        var blur = UIBlurEffect(style: UIBlurEffectStyle.Light)
        //        var blurView = UIVisualEffectView(effect: blur)
        //        blurView.frame = fortextView.bounds
        //        fortextView.alpha = 0.7
        //        fortextView.addSubview(blurView)
        
        
        if self.k==2{
            
            
            self.label.text = "I need a Break! was one of my most recent development projects and it was a big milestone for me programming-wise."
            self.label.font = UIFont(name: "Geeza Pro", size: 15)
            self.label.frame = CGRectMake(260, 640, 610, 150)
            self.label.numberOfLines = 3
            self.label.textColor = UIColor(red: 255/255, green: 173/255, blue: 115/255, alpha: 1.0)
            //self.label.textColor = UIColor.blackColor()
            self.label.numberOfLines = 25
            self.label.lineBreakMode = .ByWordWrapping
            self.view.addSubview(label)
            self.label.textAlignment = .Center
            
        } else if self.k==3 {
            UIView.animateWithDuration(3.0, animations: {
                self.label.alpha=0
                self.label.alpha=1
                self.label.text = "When work, school or life seem too overbearing and you can't bring yourself to read another email or do another boring task, what you really need is a break. And we've got your back! 'I need a break!' will give you the funniest, most unusual and fun break ideas you've ever seen to help you get back on track - in style."
            })
            
        } else if self.k==4{
            UIView.animateWithDuration(3.0, animations: {
                self.label.alpha=0
                self.label.alpha=1
                self.label.text = "After you answer three simple questions about your current settings, our app will provide you with a break activity that aims to get your brain juices flowing. Ideally, our breaks should get you out of your comfort-zone - even if just a little bit."
            })
            
            
        } else if self.k==5{
            self.imageView.animationImages = self.brianRunArray
            self.imageView.animationDuration = 0.5
            self.imageView.animationRepeatCount = 1
            self.imageView.startAnimating()
            UIView.animateWithDuration(1.2, animations: {
                self.imageView.frame.origin.x = self.imageView.frame.origin.x*4
                var timer = NSTimer.scheduledTimerWithTimeInterval(1.2, target: self, selector: Selector("gosegue"), userInfo: nil, repeats: false)
            })
        }
    }
    
    func gosegue() {
        self.performSegueWithIdentifier("toBrain", sender: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }
    
    func back(sender: UIBarButtonItem) {
        // Perform your custom actions
        
        var introductionVC:IntroductionVC = IntroductionVC()
        performSegueWithIdentifier("fromBreak", sender: sender)
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return 8
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! BreakCollectionViewCell
        let curr = indexPath.row % 8 + 1
        let imgName = "break\(curr).jpg"
        cell.pin3Image.image = UIImage(named: imgName)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView!,
        layout collectionViewLayout: UICollectionViewLayout!,
        sizeForItemAtIndexPath indexPath: NSIndexPath!) -> CGSize {
            return CGSize(width: self.width/3.33, height: self.height)
    }
    
    func collectionView(collectionView: UICollectionView!,
        layout collectionViewLayout: UICollectionViewLayout!,
        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            return sectionInsets
    }
    
}
