//
//  HomeViewController.swift
//  MyNetflix
//
//  Created by jeongminho on 2020/05/03.
//  Copyright © 2020 jeongminho. All rights reserved.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController {
    
    // MARK: - IBAction
    @IBAction func playButtonTouchUpInside(_ sender: UIButton) {
        
        SearchAPI.search("Avengers") { movies in
            guard let interstella = movies.first else { return }
            
            DispatchQueue.main.async {
                guard let url = URL(string: interstella.previewURL) else { return }
                
                let item = AVPlayerItem(url: url)
                
                let storyboard = UIStoryboard(name: "Player", bundle: nil)
                guard let VC = storyboard.instantiateViewController(identifier: "Player") as? PlayerViewController else { return }
                VC.modalPresentationStyle = .fullScreen
                VC.player.replaceCurrentItem(with: item)
                self.present(VC, animated: true, completion: nil)
            }
        }
    }
    
    
    // MARK: - Value
    var awardRecommendListViewController: RecommendListViewController!
    var hotRecommendListViewController: RecommendListViewController!
    var myRecommendListViewController: RecommendListViewController!
    
    // MARK: - Method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "award" {
            let VC = segue.destination as? RecommendListViewController
            awardRecommendListViewController = VC
            awardRecommendListViewController.viewModel.updateType(.award)
            awardRecommendListViewController.viewModel.fetchItems()
        } else if segue.identifier == "hot" {
            let VC = segue.destination as? RecommendListViewController
            hotRecommendListViewController = VC
            hotRecommendListViewController.viewModel.updateType(.hot)
            hotRecommendListViewController.viewModel.fetchItems()
        } else if segue.identifier == "my" {
            let VC = segue.destination as? RecommendListViewController
            myRecommendListViewController = VC
            myRecommendListViewController.viewModel.updateType(.my)
            myRecommendListViewController.viewModel.fetchItems()
        }
    }
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
