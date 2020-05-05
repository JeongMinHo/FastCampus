//
//  PlayerViewController.swift
//  MyNetflix
//
//  Created by jeongminho on 2020/05/03.
//  Copyright © 2020 jeongminho. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var playerView: PlayerView!
    @IBOutlet weak var controlView: UIView!
    @IBOutlet weak var playButton: UIButton!
    
    // MARK: - IBAction
    @IBAction func playButtonTouchUpInside(_ sender: UIButton) {
        playButton.isSelected.toggle()
    }
    
    @IBAction func closeButtonTouchUpInside(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Value
    let player = AVPlayer()
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }
    
}
