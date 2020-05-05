//
//  SearchViewController.swift
//  MyNetflix
//
//  Created by jeongminho on 2020/04/30.
//  Copyright © 2020 jeongminho. All rights reserved.
//

import UIKit
import Kingfisher

class SearchViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var resultCollectionView: UICollectionView!
    
    // MARK: - Value
    var movies: [Movie] = []
    var cellIdentifier: String = "ResultCell"
    
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
            DispatchQueue.main.async {
                self.movies = movies
                self.resultCollectionView.reloadData()
            }
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
            
            let movies = SearchAPI.parseMovies(resultData)
            completion(movies)
        }
        dataTask.resume()
    }
    
    static func parseMovies(_ data: Data) -> [Movie] {
        let decoder = JSONDecoder()
        
        do {
            let response = try decoder.decode(Response.self, from: data)
            let movies = response.movies
            return movies
        } catch let error {
            print("Parsing error : \(error.localizedDescription)")
            return []
        }
    }
}

// MARK: - UICollecionViewDataSource
extension SearchViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let dequeued = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        guard let cell = dequeued as? ResultCell else { return dequeued }

        let movie = movies[indexPath.item]
        guard let url = URL(string: movie.thumbnailPath) else { return UICollectionViewCell() }
        
        cell.movieThumbnail.kf.setImage(with: url)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension SearchViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let movie = movies[indexPath.item]
        
        let storyBoard = UIStoryboard(name: "Player", bundle: nil)
        guard let VC = storyBoard.instantiateViewController(identifier: "Player") as? PlayerViewController else { return }
        VC.modalPresentationStyle = .overFullScreen
        
        present(VC, animated: true, completion: nil)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SearchViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let margin: CGFloat = 8
        let itemSpacing: CGFloat = 10
        
        let width = (collectionView.bounds.width - margin * 2 - itemSpacing * 2) / 3
        let height = width * 10 / 7
        
        return CGSize(width: width, height: height)
    }
}
