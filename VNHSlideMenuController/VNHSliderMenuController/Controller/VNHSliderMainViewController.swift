//
//  VNHSliderMainViewController.swift
//  VNHSlideMenuController
//
//  Created by Vasant Hugar on 31/10/17.
//  Copyright © 2017 Vasant Hugar. All rights reserved.
//

import UIKit

fileprivate var sliderMainVC: VNHSliderMainViewController?

class VNHSliderMainViewController: UIViewController {
    
    @IBOutlet weak var controllerContainer: UIView?
    @IBOutlet weak var menuContainer: UIView?
    @IBOutlet weak var menuBackground: UIView?
    
    @IBOutlet var panGesture: UIPanGestureRecognizer?
    @IBOutlet var tapGesture: UITapGestureRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        sliderMainVC = self
        
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension VNHSliderMainViewController {
    
    func setup() {
        
        showMenu()
        addGestureTarget()
    }
    
    func addGestureTarget() {
        tapGesture?.addTarget(self, action: #selector(tapped(_:)))
        panGesture?.addTarget(self, action: #selector(panned(_:)))
    }
    
    @objc func tapped(_ sender: UITapGestureRecognizer) {
        hideMenu()
    }
    
    @objc func panned(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: self.view)
        print("Translation: \(translation)")
        
        switch sender.state {
        case .began:
            print("Begin")
            break
            
        case .ended:
            print("Ended")
            break
            
        default:
            print("Other")
            break
        }
        
        if translation.x < 0 {
            
        }
        else if (translation.x > 0) {
            
        }
        else {
            
        }
        
        //viewDrag.center = CGPoint(x: viewDrag.center.x + translation.x, y: viewDrag.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.view)
        
    }
}

extension VNHSliderMainViewController {
    
    func showMenu() {
        
        menuBackground?.isHidden = true
        
        var frameOfMenu = menuContainer?.bounds
        frameOfMenu?.origin.x = -((menuContainer?.frame.width)!)
        menuContainer?.frame = frameOfMenu!
        
        UIView.animate(withDuration: 0.4,
                       animations: {
                        
                        frameOfMenu?.origin.x = 0
                        self.menuContainer?.frame = frameOfMenu!
        
        }) { (finished) in
            self.menuBackground?.isHidden = false
        }
    }
    
    func hideMenu() {
        
        var frameOfMenu = menuContainer?.bounds
        frameOfMenu?.origin.x = 0
        menuContainer?.frame = frameOfMenu!
        
        UIView.animate(withDuration: 0.4,
                       animations: {
                        
                        frameOfMenu?.origin.x = -((self.menuContainer?.frame.width)!)
                        self.menuContainer?.frame = frameOfMenu!
                        
        }) { (finished) in
            self.menuBackground?.isHidden = true
        }
        
    }
}

extension UIViewController {
    
    func vnh_toggleMenu() {
        sliderMainVC?.showMenu()
    }
}
