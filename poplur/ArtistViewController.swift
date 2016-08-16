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
    
    @IBOutlet weak var artistImgView: UIImageView!
    
    @IBOutlet weak var artistNameLbl: UILabel!
    
    @IBAction func playBtnPressed(sender: AnyObject) {
    }
    
    @IBAction func rewindBtnPressed(sender: AnyObject) {
    }
    @IBAction func fastFwdBtnPressed(sender: AnyObject) {
    }
    
    func setUpArtistPage(name: String!, image: UIImage, bio: String) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.purpleColor()
        
        doubleTap = UITapGestureRecognizer(target: self, action: #selector(ArtistViewController.onDoubleTap))
        doubleTap.numberOfTapsRequired = 2
        
        artistImgView.clipsToBounds = true
        
        artistImgView.userInteractionEnabled = true
        artistImgView.backgroundColor = UIColor.yellowColor()
        artistImgView.addGestureRecognizer(doubleTap)
    }
    
    func onDoubleTap() {
        delegate?.doubleTapped()
    }
}
