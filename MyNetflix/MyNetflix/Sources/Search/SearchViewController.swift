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
        
        // 검색 API
        SearchAPI.search(searchTerm) { movies in
            // collectionView로 표현
            
        }
    }
}

// 검색 API
class SearchAPI {
    
    static func search(_ term: String, completion: @escaping ([Movie]) -> Void) {
        
        let session = URLSession(configuration: .default)
        
        // URL
        guard var urlComponents = URLComponents(string: "https://itunes.apple.com/search?") else { return }
        let mediaQuery = URLQueryItem(name: "media", value: "movie")
        let entityQuery = URLQueryItem(name: "entity", value: "movie")
        let termQuery = URLQueryItem(name: "term", value: term)
        
        urlComponents.queryItems?.append(mediaQuery)
        urlComponents.queryItems?.append(entityQuery)
        urlComponents.queryItems?.append(termQuery)
        
        guard let requestURL = urlComponents.url else { return }
        
        let dataTask = session.dataTask(with: requestURL) { (data, response, error) in
            
            let successRange = 200..<300
            
            guard error == nil,
                let statusCode = (response as? HTTPURLResponse)?.statusCode
                , successRange.contains(statusCode) else {
                    completion([])
                    return
            }
            
            guard let resultData = data else {
                completion([])
                return
            }
        }
        dataTask.resume()
    }
}

// Movie 객체, Response 객체
struct Movie {
    
}

struct Response {
    
}

