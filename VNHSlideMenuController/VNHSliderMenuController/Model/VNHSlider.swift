//
//  VNHSlider.swift
//  VNHSlideMenuController
//
//  Created by Vasant Hugar on 04/01/19.
//  Copyright © 2019 Vasant Hugar. All rights reserved.
//

import UIKit

class VNHSlider {
    
    static let instance = VNHSlider()
    
    var mainViewController: VNHSliderMainViewController?
    
    var menuViewController: VNHSliderLeftMenu?
    
    var childNavigationController: UINavigationController?
    
    
    private init() {}
}
