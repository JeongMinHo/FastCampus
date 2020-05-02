//
//  HomeViewController.swift
//  MyNetflix
//
//  Created by jeongminho on 2020/05/03.
//  Copyright © 2020 jeongminho. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
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
