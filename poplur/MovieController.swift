//
//  MovieController.swift
//  poplur
//
//  Created by Mark Meritt on 2016-08-15.
//  Copyright © 2016 Apptist. All rights reserved.
//

import UIKit
import AVFoundation

class MovieController: IndexViewController {
    
    let vc = UIStoryboard(name: "MainStoryboard", bundle: nil).instantiateViewControllerWithIdentifier("ArtistVC") as! ArtistViewController
    
    let movieView: UIView! = UIView(frame: UIScreen.mainScreen().bounds)
    var doubleTap: UITapGestureRecognizer! = nil
    var videoPlayer: AVPlayer!
    
    var flipped = false
    
    let voteUpImg: UIImage! = UIImage(named: "upvote")
    let voteDownImg: UIImage! = UIImage(named: "downvote")
    
    func videoLoaded(videoName: String!, extensionName: String!) {
        let session: NSError! = nil
        let path: NSURL! = NSBundle.mainBundle().URLForResource(videoName, withExtension: extensionName)
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
        videoPlayer.volume = 1.0
        videoPlayer.actionAtItemEnd = AVPlayerActionAtItemEnd.None
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MovieController.videoDidReachEnd(_:)), name: AVPlayerItemDidPlayToEndTimeNotification, object: self.videoPlayer.currentItem)
    }

    override func viewDidLoad() {
        
        doubleTap = UITapGestureRecognizer(target: self, action: #selector(MovieController.onDoubleTap))
        doubleTap.numberOfTapsRequired = 2
        
        movieView.addGestureRecognizer(doubleTap)
        self.view.addSubview(movieView)
        
        self.view.backgroundColor = UIColor.blackColor()
      
     
        if(self.index == 3) {
            self.videoLoaded("safefeel", extensionName: "mp4")
        }
 
        
        let voteUpBtn: UIButton! = UIButton(frame: CGRectMake(UIScreen.mainScreen().bounds.width / 2 + 100, UIScreen.mainScreen().bounds.height / 2 + 250, voteUpImg.size.width / 2, voteUpImg.size.height / 2))
        
        voteUpBtn.setImage(voteUpImg, forState: .Normal)
        voteUpBtn.alpha = 0.5
        
        self.movieView.addSubview(voteUpBtn)
        
        let voteDownBtn: UIButton! = UIButton(frame: CGRectMake(UIScreen.mainScreen().bounds.width / 2 - 100, UIScreen.mainScreen().bounds.height / 2 + 250, voteUpImg.size.width / 2, voteUpImg.size.height / 2))
        
        voteDownBtn.setImage(voteDownImg, forState: .Normal)
        voteDownBtn.alpha = 0.5
        
        self.movieView.addSubview(voteDownBtn)

    }
    
    func videoDidReachEnd(notification: NSNotification) {
        self.videoPlayer.seekToTime(kCMTimeZero)
        self.videoPlayer.play()
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
    
    func onDoubleTap() {
        
        vc.delegate = self
        displayContentController(vc, frame: nil)
        
        UIView.transitionFromView(self.movieView, toView: vc.view, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromRight, completion: nil)
    }
}

extension MovieController : ArtistViewControllerDelegate {

    func doubleTapped() {
        UIView.transitionFromView(vc.view, toView: self.movieView, duration: 1, options: .TransitionFlipFromLeft, completion: nil)
    }
}
