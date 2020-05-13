//
//  SearchListViewController.swift
//  MyNetflix
//
//  Created by jeongminho on 2020/05/12.
//  Copyright © 2020 jeongminho. All rights reserved.
//

import UIKit
import Firebase

protocol CellDelegate: class {
    func deleteAndReloadData()
}

class SearchListViewController: UIViewController, CellDelegate {
    
    func deleteAndReloadData() {
        self.tableView.reloadData()
    }
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
 
    // MARK: - Value
    let db = Database.database().reference().child("searchHistory")
    var searchTerms: [SearchTerm] = []
    var cellIdentifier: String = "SearchList"
    var cellDelegate: CellDelegate?

    
    // MARK: - View Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        db.observeSingleEvent(of: .value) { (snapshot) in
            guard let searchHistory = snapshot.value as? [String: Any] else { return }
            
            let data = try! JSONSerialization.data(withJSONObject: Array(searchHistory.values), options: [])
            
            let decoder = JSONDecoder()
            let searchTerms = try! decoder.decode([SearchTerm].self, from: data)
            self.searchTerms = searchTerms.sorted(by: { (first, second) -> Bool in
                first.timestamp > second.timestamp
            })
            self.searchTerms = searchTerms
            self.tableView.reloadData()
        }
        
        deleteAndReloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
}

// MARK: - UITableViewDataSource
extension SearchListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchTerms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dequeued = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        guard let cell = dequeued as? SearchListCell else { return dequeued}
        cell.searchTerm.text = searchTerms[indexPath.row].term
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension SearchListViewController: UITableViewDelegate {
    
}
