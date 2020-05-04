//
//  SearchViewController.swift
//  MyNetflix
//
//  Created by jeongminho on 2020/04/30.
//  Copyright © 2020 jeongminho. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var resultCollectionView: UICollectionView!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UISearchBarDelegate

extension SearchViewController: UISearchBarDelegate {
    
    private func dismissKeyboard() {
        searchBar.resignFirstResponder()
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        dismissKeyboard()
        
        guard let searchTerm = searchBar.text, searchTerm.isEmpty == false else { return }
    }
}
