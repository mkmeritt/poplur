//
//  MainViewController.swift
//  poplur
//
//  Created by Mark Meritt on 2016-08-06.
//  Copyright © 2016 Apptist. All rights reserved.
//

import UIKit
import AVFoundation
import CoreLocation

class MainViewController: IndexViewController, CLLocationManagerDelegate {
    
       
    let movieView: UIView! = UIView(frame: UIScreen.mainScreen().bounds)
    var videoPlayer: AVPlayer!
    var swipeLeft: UISwipeGestureRecognizer!
    var window: UIWindow?
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
     
        self.view.addSubview(movieView)
     
        self.view.backgroundColor = UIColor.blackColor()

        
        let session: NSError! = nil
        let path: NSURL! = NSBundle.mainBundle().URLForResource("poplursplash", withExtension: "mp4")
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
        
        let gradient: CAGradientLayer! = CAGradientLayer(layer: movieView.layer)
        gradient.frame = UIScreen.mainScreen().bounds
        
        let color1 = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 0.6).CGColor as CGColorRef
        let color2 = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.3).CGColor as CGColorRef
        
        gradient.colors = [color1, color2]
        gradient.locations = [0.9, 0.1]
        
        let poplurImg: UIImage! = UIImage(named: "poplur")
        
        let poplurImgView: UIImageView! = UIImageView(frame: CGRectMake(UIScreen.mainScreen().bounds.width / 2 - 160, UIScreen.mainScreen().bounds.height / 1.2, poplurImg.size.width / 1.2, poplurImg.size.height / 1.2))
        
        poplurImgView.image = poplurImg

        self.view.addSubview(poplurImgView)

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
