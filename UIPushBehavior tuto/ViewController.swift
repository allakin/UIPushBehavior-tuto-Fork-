//
//  ViewController.swift
//  UIPushBehavior tuto
//
//  Created by Malek T. on 10/18/15.
//  Copyright © 2015 Medigarage Studios LTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var loginBtn: UIButton!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var enterBtn: UIButton!
    var animator: UIDynamicAnimator!

    
    @IBAction func logIn(_ sender: AnyObject) {
        // 1
        self.animator.removeAllBehaviors()
        // 2
        let pushBehaviorForButton = UIPushBehavior(items: [self.enterBtn], mode: UIPushBehaviorMode.instantaneous)
        pushBehaviorForButton.pushDirection = CGVector(dx: 5, dy: 0)
        let pushBehaviorForImage = UIPushBehavior(items: [self.imageView], mode: UIPushBehaviorMode.instantaneous)
        pushBehaviorForImage.pushDirection = CGVector(dx: -200, dy: 0)
        // 3
        self.animator.addBehavior(pushBehaviorForButton)
        self.animator.addBehavior(pushBehaviorForImage)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 1
        self.imageView.bounds.origin = CGPoint(x: 0, y: -1000)
        // 2
        self.enterBtn.layer.cornerRadius = 5.0
        self.loginBtn.layer.cornerRadius = 5.0
        self.animator = UIDynamicAnimator(referenceView: view)
        self.animator.removeAllBehaviors()
        // 3
        let snapBehavior = UISnapBehavior(item: self.imageView, snapTo: self.view.center)
        self.animator.addBehavior(snapBehavior)
        // 4
        UIView.animate(withDuration: 0.9, animations: { () -> Void in
            self.enterBtn.alpha = 1.0
        }) 

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

