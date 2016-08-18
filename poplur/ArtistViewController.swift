//
//  ArtistViewController.swift
//  poplur
//
//  Created by Mark Meritt on 2016-08-15.
//  Copyright © 2016 Apptist. All rights reserved.
//

import UIKit
import AVFoundation
import Firebase

protocol ArtistViewControllerDelegate {
    func doubleTapped()
}

class ArtistViewController: IndexViewController {
    
    var delegate: ArtistViewControllerDelegate?
        
    var doubleTap: UITapGestureRecognizer! = nil
    
    var audioPlayer: AVAudioPlayer!
    
    var playing = false
    
    @IBOutlet weak var playerView: UIView!
    
    
    @IBOutlet weak var artistImgView: UIImageView!
    
    @IBOutlet weak var artistNameLbl: UILabel!
    
    @IBAction func playBtnPressed(sender: AnyObject) {
        
        if playing == true {
            audioPlayer.pause()
        } else {
            audioPlayer.play()
        }
        
    }
    
    @IBAction func rewindBtnPressed(sender: AnyObject) {
    }
    @IBAction func fastFwdBtnPressed(sender: AnyObject) {
    }
    
    func setUpArtistPage(name: String!, image: UIImage, bio: String) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let artistData = ArtistDataSource()
       //
        

        do{
            
                    if(self.index == 3) {
        audioPlayer = try AVAudioPlayer(contentsOfURL: artistData.safeAlbum[0] as! NSURL)
            }
            if(self.index == 4) {
                audioPlayer = try AVAudioPlayer(contentsOfURL: artistData.royAlbum[0] as! NSURL)
            }
            if(self.index == 5) {
                audioPlayer = try AVAudioPlayer(contentsOfURL: artistData.ceasarAlbum[0] as! NSURL)
            }
            if(self.index == 6) {
                audioPlayer = try AVAudioPlayer(contentsOfURL: artistData.navAlbum[0] as! NSURL)
            }
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        playing = true
            
        } catch {
            print("Error getting the audio file")
        }
        
        let scrollView = UIScrollView()
        scrollView.frame = self.view.bounds
        scrollView.contentSize = CGSize(width: self.view.bounds.size.width, height: 1000)
        
        scrollView.showsVerticalScrollIndicator = false
        
        doubleTap = UITapGestureRecognizer(target: self, action: #selector(ArtistViewController.onDoubleTap))
        doubleTap.numberOfTapsRequired = 2
        
        artistImgView.clipsToBounds = true
        
        artistImgView.userInteractionEnabled = true
        if(self.index == 3) {

        artistImgView.image = artistData.safeImg       //
        
        artistNameLbl.text = artistData.safeName
        }
        
        if(self.index == 4) {
            artistImgView.image = artistData.royImg
            artistNameLbl.text = artistData.royName
        }
        
        if(self.index == 5) {
            artistImgView.image = artistData.danielImg
            artistNameLbl.text = artistData.danielName
        }
        
        if(self.index == 6) {
            artistImgView.image = artistData.navImg
            artistNameLbl.text = artistData.navName
        }
        
        scrollView.addGestureRecognizer(doubleTap)
        
        let clearView = UIView()
        clearView.backgroundColor = UIColor.clearColor()
        clearView.frame = CGRect(x: 0, y: 650, width: scrollView.bounds.size.width, height: 500)
        scrollView.addSubview(clearView)
        
   
        self.view.addSubview(scrollView)
        
    //    self.view.addSubview(artistIV)
        
        let textView = UITextView()
        textView.backgroundColor = UIColor.blackColor()
        textView.frame = CGRect(x: clearView.bounds.origin.x, y: clearView.bounds.origin.y + 50, width: clearView.bounds.size.width, height: clearView.bounds.size.height)
        if(self.index == 3) {

        textView.text = artistData.safeBio              //
        }
        
        if(self.index == 4) {
            textView.text = artistData.royBio
        }
        
        if(self.index == 5) {
            textView.text = artistData.ceasarBio
        }
        
        if(self.index == 6) {
            textView.text = artistData.navBio
        }
        
        textView.textColor = UIColor.whiteColor()
        textView.textAlignment = .Center
        textView.font = UIFont(name: "Apple SD Gothic Neo", size: 16)
        clearView.addSubview(textView)
        
     //   let pView = playerView
        
       // pView.removeFromSuperview()
        
       // pView.frame = CGRectMake(artistImgView.bounds.width/2, artistImgView.bounds.height/2, pView.frame.width / 2, pView.frame.height / 2)
        
     //   self.view.addSubview(pView)

    }
    
    func onDoubleTap() {
         audioPlayer.pause()
        delegate?.doubleTapped()
       
    }
    
    override func viewDidAppear(animated: Bool) {
        audioPlayer.play()
    }
    
    override func viewWillAppear(animated: Bool) {
        audioPlayer.play()
    }
    
    override func viewDidDisappear(animated: Bool) {
        audioPlayer.pause()
    }
    
    override func viewWillDisappear(animated: Bool) {
        audioPlayer.pause()
    }
}
