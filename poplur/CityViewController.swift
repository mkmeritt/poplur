//
//  CityViewController.swift
//  poplur
//
//  Created by Mark Meritt on 2016-08-11.
//  Copyright © 2016 Apptist. All rights reserved.
//

import UIKit
import AVFoundation


class CityViewController: IndexViewController {
    
    
    let movieView: UIView! = UIView(frame: UIScreen.mainScreen().bounds)
    var videoPlayer: AVPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.addSubview(movieView)
        
        self.view.backgroundColor = UIColor.blackColor()
        
        let session: NSError! = nil
        let path: NSURL! = NSBundle.mainBundle().URLForResource("torontoclip", withExtension: "mp4")
        let asset: AVAsset! = AVAsset(URL: path)
        let playerItem: AVPlayerItem! = AVPlayerItem(asset: asset)
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print(session)
            
        }
        
        videoPlayer = AVPlayer(playerItem: playerItem)
        let videoLayer = AVPlayerLayer(player: videoPlayer)
        videoLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        videoLayer.frame = UIScreen.mainScreen().bounds
        movieView.layer.addSublayer(videoLayer)
        
        videoPlayer.seekToTime(kCMTimeZero)
        videoPlayer.volume = 0.0
        videoPlayer.actionAtItemEnd = AVPlayerActionAtItemEnd.None
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MainViewController.videoDidReachEnd(_:)), name: AVPlayerItemDidPlayToEndTimeNotification, object: self.videoPlayer.currentItem)
        

        
      
    }
    
    override func viewWillAppear(animated: Bool) {
        videoPlayer.play()
    }
    
    override func viewWillDisappear(animated: Bool) {
        videoPlayer.pause()
    }
    
    override func viewDidDisappear(animated: Bool) {
        videoPlayer.pause()
    }
    
    override func viewDidAppear(animated: Bool) {
        videoPlayer.play()
    }
    
    
    func videoDidReachEnd(notification: NSNotification) {
        self.videoPlayer.seekToTime(kCMTimeZero)
        self.videoPlayer.play()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
