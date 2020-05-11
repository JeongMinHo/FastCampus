//
//  SeachResultViewController.swift
//  MyNetflix
//
//  Created by jeongminho on 2020/05/11.
//  Copyright © 2020 jeongminho. All rights reserved.
//

import UIKit

class NoResultViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var dimmedView: UIView!
    @IBOutlet var noResultText: UILabel!
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noResultText.isHidden = true
    }
}
