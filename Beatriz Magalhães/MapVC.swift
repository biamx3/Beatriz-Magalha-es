//
//  MapVC.swift
//  Beatriz Magalhães
//
//  Created by Beatriz Melo Mousinho Magalhães on 4/25/15.
//  Copyright (c) 2015 Beatriz Melo Mousinho Magalhães. All rights reserved.
//

import UIKit
import MapKit
class MapVC: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var u:CGFloat = 1
    
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
    
    //Buttons
    var brian2Button:UIButton!
    
    //Front Brian
    let frontbrain = UIImage(named: "frontbrian")
    var image:UIImage!
    var imageView:UIImageView!
    
    //Label
    @IBOutlet weak var textLabel: UILabel!
    

    //Milestone locations
    let bepidLocation = CLLocation(latitude: -22.977864, longitude: -43.231646)
 
    override func viewWillAppear(animated: Bool) {
        
        UIView.animateWithDuration(3.0, animations: {
            self.textLabel.alpha = 1.0
            
            
        })
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
        
        self.textLabel.alpha = 0
        

        self.textLabel.text = "BEPiD: that's were it all started. When I entered the Brazilian Education Program for iOS development, I knew nothing about programming. I didn't even know what a String was."

        
        self.image = UIImage(named: "frontbrian.png")!
        self.imageView = UIImageView(image: image)
        
        
        self.imageView!.frame = CGRectMake(0,570,144,172)
        self.view.addSubview(imageView!)
        
        //Brian Button
        self.brian2Button = UIButton()
        self.brian2Button.frame = CGRectMake(102,570,144,172)
        self.brian2Button.addTarget(self, action: "brianPressed:", forControlEvents: .TouchUpInside)
        self.view.addSubview(brian2Button)

        
        //Navigation Bar Item
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "<back", style: UIBarButtonItemStyle.Plain, target: self, action: "back:")
        let swiftColor = UIColor(red: 251/255, green: 169/255, blue: 111/255, alpha: 1)
        navigationController?.navigationBar.tintColor = swiftColor
        
        let backButton = UIBarButtonItem(title: "< back", style: UIBarButtonItemStyle.Plain, target: self, action: "goBack:")
        navigationItem.leftBarButtonItem = backButton
        navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Geeza Pro", size: 20)!], forState: UIControlState.Normal)
        
        self.navigationItem.leftBarButtonItem = newBackButton;

        
        //Regions and Annotations
        var coordinateRegion = MKCoordinateRegionMakeWithDistance(bepidLocation.coordinate, 200, 200)
        self.mapView.setRegion(coordinateRegion, animated: true)
        let ann = MyAnnotation(title: "BEPiD", subtitle: "Brazilian Education Program for iOS Development", coordinate:CLLocationCoordinate2DMake(bepidLocation.coordinate.latitude,bepidLocation.coordinate.longitude))
        self.mapView.addAnnotation(ann)
        
        
        
        
        var circle: MKCircle = MKCircle(centerCoordinate: CLLocationCoordinate2D(latitude: bepidLocation.coordinate.latitude, longitude:bepidLocation.coordinate.longitude), radius: 50)
        self.mapView.addOverlay(circle)
        
        var mapType: MKMapType
        enum MKMapType: UInt {
            case Standard
        }
        self.mapView.delegate = self
    }
    
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        
        if let annotation = annotation as? MyAnnotation {
            
            let identifier = "pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as? MKPinAnnotationView {
                
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y:5)
                view.rightCalloutAccessoryView = UIButton.buttonWithType(.DetailDisclosure) as! UIView
                view.pinColor = MKPinAnnotationColor.Red
                view.enabled = true
                view.animatesDrop = true
                
                var imageView = UIImageView(image: UIImage(contentsOfFile: "image.png"))
                view.leftCalloutAccessoryView = imageView
                
                
            }
            return view
        }
        return nil
    }
    
    func brianPressed(sender:UIButton!){
        
        self.u++
        if self.u == 2{
            UIView.animateWithDuration(1.5, animations: {
                    self.textLabel.alpha = 0.0
                    self.textLabel.alpha = 1.0
                       self.textLabel.text = "And after a few months of hard work and challenging projects, I'm proud to say that I can now implement what I design."
            })
   
        } else if self.u == 3{
             UIView.animateWithDuration(1.5, animations: {
                self.textLabel.alpha = 0.0
                self.textLabel.alpha = 1.0
                self.textLabel.text = "It feels AWESOME."

            })
        } else if self.u == 4{
           UIView.animateWithDuration(1.5, animations: {
            self.textLabel.alpha = 0.0
            self.textLabel.alpha = 1.0
                self.textLabel.text = "So I'd like to share with you some of what I've accomplished on my way here."
            })
        } else if self.u == 5{
            self.imageView.animationImages = self.brianRunArray
            self.imageView.animationDuration = 1.2
            self.imageView.animationRepeatCount = 2
            self.imageView.startAnimating()
            UIView.animateWithDuration(1.2,animations:{
                self.imageView.frame.origin.x = self.imageView.frame.origin.x+400
                self.textLabel.alpha = 0
                
                var timer = NSTimer.scheduledTimerWithTimeInterval(1.2, target: self, selector: Selector("gosegue"), userInfo: nil, repeats: false)
            })
        }
    }
    
    func gosegue() {
        self.performSegueWithIdentifier("ontoProject", sender: self)
    }

    
    func back(sender: UIBarButtonItem) {
        var introductionVC:IntroductionVC = IntroductionVC()
        performSegueWithIdentifier("backtoConfession", sender: sender)
    }

    
    func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
        if (overlay is MKCircle)
        {
            var circleRenderer = MKCircleRenderer(overlay: overlay)
            circleRenderer.fillColor = UIColor(
                red: 1.0,
                green: 0.0,
                blue: 0,
                alpha: 0.5)
            
            return circleRenderer
        }
        return nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

