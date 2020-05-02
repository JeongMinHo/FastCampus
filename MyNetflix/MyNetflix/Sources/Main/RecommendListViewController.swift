//
//  RecommendListViewController.swift
//  MyNetflix
//
//  Created by jeongminho on 2020/05/03.
//  Copyright © 2020 jeongminho. All rights reserved.
//

import UIKit

class RecommendListViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var sectionTitle: UILabel!
    
    // MARK: - Variable
    let viewModel = RecommendListViewModel()
    let cellIdentifier: String = "RecommendCell"
    
    // MARK: - Method
    func updateUI() {
        sectionTitle.text = viewModel.type.title
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
}

// MARK: - UICollectionViewDataSource
extension RecommendListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numofItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dequeued = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        guard let cell = dequeued as? RecommendCell else { return dequeued }
        
        let movie = viewModel.item(at: indexPath.item)
        cell.updateUI(movie: movie)
        
        return cell
    }
}

// MARK: - UICollectionViewFlowLayout
extension RecommendListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 160)
    }
}

// MARK: - RecommendListViewModel
class RecommendListViewModel {
    
    // MARK: - Value
    private (set) var type: RecommendingType = .my
    private var items: [DummyItem] = []
    var numofItems: Int {
        return items.count
    }
    
    // MARK: - Method
    func item(at index: Int) -> DummyItem {
        return items[index]
    }
    
    func updateType(_ type: RecommendingType) {
        self.type = type
    }
    
    func fetchItems() {
        self.items = MovieFetcher.fetch(type)
    }
    
    enum RecommendingType {
        case award
        case hot
        case my
        
        var title: String {
            switch self {
            case .award: return "아카데미 호평 영화"
            case .hot: return "취향저격 HOT 콘텐츠"
            case .my: return "내가 찜한 콘텐츠"
            }
        }
    }
}

// MARK: - DummyItem
struct DummyItem {
    let thumbnail: UIImage?
}

// MARK: - MovieFetcher
class MovieFetcher {
    static func fetch(_ type: RecommendListViewModel.RecommendingType) -> [DummyItem] {
        switch type {
        case .award:
            let movies = (1..<10).compactMap { DummyItem(thumbnail: UIImage(named: "img_movie_\($0)")) }
            return movies
        case .hot:
            let movies = (10..<19).compactMap { DummyItem(thumbnail: UIImage(named: "img_movie_\($0)"))}
            return movies
        case .my:
            let movies = (1..<10).compactMap { $0 * 2 }.map { DummyItem(thumbnail: UIImage(named: "img_movie_\($0)")) }
            return movies
        }
    }
}
