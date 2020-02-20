//
//  ViewController.swift
//  MyAlbum
//
//  Created by jeongminho on 2020/02/18.
//  Copyright © 2020 jeongminho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showAlert(_ sender: Any) {
        let message = "가격은 \(currentValue)입니다."
        
        let alert = UIAlertController(title: "Hello", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        let randomPrice = arc4random_uniform(10000) + 1
        currentValue = Int(randomPrice)
    }
}

