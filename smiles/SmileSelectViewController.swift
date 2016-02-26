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
    var trayCenterWhenOpen: CGPoint!
    var trayCenterWhenClosed: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trayCenterWhenOpen = trayView.center
        trayCenterWhenClosed = trayView.center
        trayCenterWhenClosed.y = trayCenterWhenClosed.y + 178
        
        trayView.center = trayCenterWhenClosed
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
            if panGestureRecognizer.velocityInView(self.trayView).y > 0 {
                UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.2, options: .AllowUserInteraction, animations: { () -> Void in
                    self.trayView.center = self.trayCenterWhenClosed
                    }, completion: { (Bool) -> Void in
                        //print("yay")
                })
            
                
            } else if panGestureRecognizer.velocityInView(self.trayView).y < 0 {
                UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.2, options: .AllowUserInteraction, animations: { () -> Void in
                    self.trayView.center = self.trayCenterWhenOpen
                    }, completion: { (Bool) -> Void in
                        //print("yay")
                })

            }
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            
            print("Gesture ended at: \(point)")
            
        }
        
        
    }
    
    @IBAction func onTrayTapGesture(sender: UITapGestureRecognizer) {
        if self.trayView.center == trayCenterWhenClosed {
            UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.2, options: .AllowUserInteraction, animations: { () -> Void in
                self.trayView.center = self.trayCenterWhenOpen
                }, completion: { (Bool) -> Void in
                    //print("yay")
            })
        }
        else if self.trayView.center == trayCenterWhenOpen {
            UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.2, options: .AllowUserInteraction, animations: { () -> Void in
                self.trayView.center = self.trayCenterWhenClosed
                }, completion: { (Bool) -> Void in
                    //print("yay")
            })
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
