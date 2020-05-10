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
    @IBOutlet weak var noResultText: UILabel!
    
    // MARK: - Method
    func animateDimmedView() {
        UIView.animate(withDuration: 1) { [weak self] in
            self?.dimmedView.alpha = 1
        }
    }
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animateDimmedView()
    }
}
