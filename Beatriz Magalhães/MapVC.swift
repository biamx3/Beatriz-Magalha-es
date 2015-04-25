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
    let bepidLocation = CLLocation(latitude: -22.977914, longitude: -43.231685
)
 
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
        
        UIView.animateWithDuration(2, animations: {
            self.textLabel.alpha = 1.0
            self.textLabel.frame = 1.0
        })
        self.textLabel.text = "This is were it all started. When I entered the Brazilian Education Program for iOS development, I knew nothing about programming. I didn't even know what a String was."
        
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
        self.navigationItem.leftBarButtonItem = newBackButton;

        
        //Regions and Annotations
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(bepidLocation.coordinate, 300, 300)
        self.mapView.setRegion(coordinateRegion, animated: true)
        let ann = MyAnnotation(title: "BEPiD", subtitle: "Brazilian Education Program for iOS Development", coordinate:CLLocationCoordinate2DMake(bepidLocation.coordinate.latitude,bepidLocation.coordinate.longitude))
        self.mapView.addAnnotation(ann)
        var circle: MKCircle = MKCircle(centerCoordinate: CLLocationCoordinate2D(latitude: bepidLocation.coordinate.latitude, longitude:bepidLocation.coordinate.longitude), radius: 100)
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
            self.textLabel.text = "After a few months of hard work and challenging projects, I'm proud to say that I can implement what I design. And it's LIBERATING."
        }
        
    }
    
    func back(sender: UIBarButtonItem) {
        // Perform your custom actions
        
        var introductionVC:IntroductionVC = IntroductionVC()
        // ...
        // Go back to the previous ViewController
        //self.navigationController?.popViewControllerAnimated(true)
        //        self.navigationController?.popToViewController(introductionVC, animated: false)
        
        performSegueWithIdentifier("backtoConfession", sender: sender)
    }

    
    func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
        if (overlay is MKCircle)
        {
            var circleRenderer = MKCircleRenderer(overlay: overlay)
            circleRenderer.strokeColor = UIColor.greenColor()
            circleRenderer.fillColor = UIColor(
                red: 0,
                green: 1.0,
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

