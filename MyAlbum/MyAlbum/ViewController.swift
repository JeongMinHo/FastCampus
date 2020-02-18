//
//  ViewController.swift
//  MyAlbum
//
//  Created by jeongminho on 2020/02/18.
//  Copyright © 2020 jeongminho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func connectButton(_ sender:  UIButton) {
        
        let alert = UIAlertController(title: "My First App!", message: "Start", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }

    
}

