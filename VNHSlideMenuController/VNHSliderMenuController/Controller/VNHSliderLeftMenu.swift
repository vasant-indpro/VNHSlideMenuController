//
//  VNHSliderLeftMenu.swift
//  VNHSlideMenuController
//
//  Created by Vasant Hugar on 31/10/17.
//  Copyright © 2017 Vasant Hugar. All rights reserved.
//

import UIKit

class VNHSliderLeftMenu: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

extension VNHSliderLeftMenu: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VNHSliderLeftMenuCell")
        
        cell?.textLabel?.text = "Menu " + indexPath.row.description
        
        return cell!
    }
    
    
}

