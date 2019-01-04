//
//  VNHSliderMainViewController.swift
//  VNHSlideMenuController
//
//  Created by Vasant Hugar on 31/10/17.
//  Copyright © 2017 Vasant Hugar. All rights reserved.
//

import UIKit

class VNHSliderMainViewController: UIViewController {
    
    @IBOutlet weak var controllerContainer: UIView?
    @IBOutlet weak var menuContainer: UIView?
    @IBOutlet weak var menuBackground: UIView?
    
    @IBOutlet var panGesture: UIPanGestureRecognizer?
    @IBOutlet var tapGesture: UITapGestureRecognizer?
    
    let slider = VNHSlider.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        slider.mainViewController = self
        
        setup()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        guard let identifier = segue.identifier else {
            return
        }
        
        switch identifier {
        case "VNHChildNavigationSegue":
            slider.childNavigationController = segue.destination as? UINavigationController
            break
            
        case "VNHMenuSegue":
            if let DVC = segue.destination as? VNHSliderLeftMenu {
                slider.menuViewController = DVC
                DVC.delegate = self
            }
            break
            
        default:
            break
        }
    }
    
}

extension VNHSliderMainViewController {
    
    func setup() {
        showMenu()
        addGestureTarget()
    }
    
    fileprivate func addGestureTarget() {
        tapGesture?.addTarget(self, action: #selector(tapped(_:)))
        panGesture?.addTarget(self, action: #selector(panned(_:)))
    }
    
    @objc fileprivate func tapped(_ sender: UITapGestureRecognizer) {
        hideMenu()
    }
    
    @objc fileprivate func panned(_ sender: UIPanGestureRecognizer) {
        
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
    
    fileprivate func showMenu() {
        
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
    
    fileprivate func hideMenu() {
        
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

extension VNHSliderMainViewController: VNHSliderLeftMenuDelegate {
    
    func didSelectRowAt(_ index: Int) {
        slider.mainViewController?.hideMenu()
        print(index.description)
        
        let identifier = "DemoViewController" + index.description
        if let viewController = self.storyboard?.instantiateViewController(withIdentifier: identifier) {
            viewController.title = identifier
            slider.childNavigationController?.viewControllers = [viewController]
        }
    }
}

extension UIViewController {
    
    func vnh_toggleMenu() {
        VNHSlider.instance.mainViewController?.showMenu()
    }
}
