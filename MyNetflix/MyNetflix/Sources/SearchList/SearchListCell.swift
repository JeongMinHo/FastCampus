//
//  SearchListCell.swift
//  MyNetflix
//
//  Created by jeongminho on 2020/05/12.
//  Copyright © 2020 jeongminho. All rights reserved.
//

import UIKit
import Firebase

class SearchListCell: UITableViewCell {
    
    // MARK: - Value
    let db = Database.database().reference().child("searchHistory")
    weak var cellDelegate: CellDelegate?
    
    var deleteSearchTerm: SearchTerm? {
        didSet {
            self.searchTerm.text = searchTerm.text
        }
    }

    // MARK: - IBOutlet
    @IBOutlet weak var searchTerm: UILabel!
    
    // MARK: - IBAction
    @IBAction func deleteSearchList(_ sender: UIButton) {
        
//        dataManager.removeData(db.child(cell))
//        cellDelegate?.delete(search: deleteSearchTerm?.term)
        cellDelegate?.delete(search: (deleteSearchTerm?.term)!)
        cellDelegate?.deleteAndReloadData()
    }
}
