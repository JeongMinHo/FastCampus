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
    
        if player.isPlaying {
            pause()
        } else {
            play()
        }
        playButton.isSelected.toggle()
    }
    
    @IBAction func closeButtonTouchUpInside(_ sender: UIButton) {
        reset()
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Value
    let player = AVPlayer()
    
    // MARK: - Method
    func play() {
        player.play()
        playButton.isSelected = true
    }
    
    func pause() {
        player.pause()
        playButton.isSelected = false
    }
    
    func reset() {
        pause()
        player.replaceCurrentItem(with: nil)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerView.player = self.player
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        play()
        playButton.isSelected = false
    }
    
}

extension AVPlayer {
    var isPlaying: Bool {
        guard self.currentItem != nil else { return false }
        return self.rate != 0
    }
}
