//
//  CollectionViewCell.swift
//  ProfileCreation
//
//  Created by Anthony Ma on 17/8/2016.
//  Copyright © 2016 Anthony Ma. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class CollectionViewCell: UICollectionViewCell, YTPlayerViewDelegate {
    
    var video: Video? {
        didSet {
            let videoId = video?.videoId
            let thebigView = UIView()
            let playView: YTPlayerView = YTPlayerView()
            playView.frame = self.contentView.frame
//            self.playerViewDidBecomeReady(playView)
            self.contentView.addSubview(playView)
            let playerVars: [String:Int] = ["playsinline" : 1]
            playView.loadWithVideoId(videoId!, playerVars: playerVars)
//            playView.loadVideoById(videoId!, startSeconds: 25.0, suggestedQuality: YTPlaybackQuality.Medium)
            
        }
    }
    
    /*
    func playerViewDidBecomeReady(playerView: YTPlayerView) {
            let alert = UIAlertController.init(title: "YouTube videos loaded", message: "", preferredStyle: .Alert)
            let alertAction = UIAlertAction.init(title: "Ok", style: .Cancel, handler: nil)
            alert.addAction(alertAction)
    }
 */
    
}
