//
//  AppTabbarController.swift
//  MyNetflix
//
//  Created by jeongminho on 2020/04/30.
//  Copyright © 2020 jeongminho. All rights reserved.
//

import UIKit

class AppTabbarController: UITabBarController {
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
