//
//  TabBarViewController.swift
//  Jackpot
//
//  Created by bradley treuherz on 7/22/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Ensure the user is authenticated
        Authentication.verifyIsLoggedIn(self);
    }
}
