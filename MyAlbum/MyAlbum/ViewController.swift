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
    
    @IBAction func newButton(_ sender: UIButton) {
        
        let alert  = UIAlertController(title: "새로운 버튼", message: "버튼 추가", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        let action2 = UIAlertAction(title: "NO", style: .default, handler: nil)
        
        
        alert.addAction(action)
        alert.addAction(action2)
        present(alert, animated: true, completion: nil)
    }
}

