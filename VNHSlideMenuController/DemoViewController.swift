//
//  DemoViewController.swift
//  VNHSlideMenuController
//
//  Created by Vasant Hugar on 31/10/17.
//  Copyright © 2017 Vasant Hugar. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func menuButtonClicked(_ sender: Any) {
        vnh_toggleMenu()
    }
}

