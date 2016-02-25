//
//  SmileSelectViewController.swift
//  smiles
//
//  Created by Alex Clark on 2/25/16.
//  Copyright © 2016 John Henning. All rights reserved.
//

import UIKit

class SmileSelectViewController: UIViewController {

    // Outlets
    @IBOutlet weak var trayView: UIView!
    
    // Variables
    var trayOriginalCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // Actions
    @IBAction func onTrayPanGesture(panGestureRecognizer: UIPanGestureRecognizer) {
        
        // Absolute (x,y) coordinates in parent view's coordinate system
        let point = panGestureRecognizer.locationInView(trayView)
        
        // Total translation (x,y) over time in parent view's coordinate system
        let translation = panGestureRecognizer.translationInView(trayView)
        
        if panGestureRecognizer.state ==
            UIGestureRecognizerState.Began {
                
            print("Gesture began at: \(point)")
            self.trayOriginalCenter = trayView.center
                
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
            
            print("Gesture changed at: \(point)")
            self.trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            
            print("Gesture ended at: \(point)")
            
        }
        
        
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
