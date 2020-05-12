//
//  SearchListViewController.swift
//  MyNetflix
//
//  Created by jeongminho on 2020/05/12.
//  Copyright © 2020 jeongminho. All rights reserved.
//

import UIKit
import Firebase

class SearchListViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Value
    let db = Database.database().reference().child("searchHistory")
    
    // MARK: - View Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        db.observeSingleEvent(of: .value) { (snapshot) in
            print("value : \(snapshot)")
        }
    }
}
