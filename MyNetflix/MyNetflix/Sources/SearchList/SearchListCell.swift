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
            
    
    let db = Database.database().reference().child("searchHistory")
    weak var cellDelegate: CellDelegate?
    
    var minho = SearchListViewController()
    
    // MARK: - IBOutlet
    @IBOutlet weak var searchTerm: UILabel!
    
    // MARK: - IBAction
    @IBAction func deleteSearchList(_ sender: UIButton) {

        let rootRef = db.database.reference()
        let memoryRef = rootRef.child("searchHistory").child("Avengers")
        memoryRef.removeValue()
        cellDelegate?.deleteAndReloadData()
    
    }
    
}
