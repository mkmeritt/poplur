//
//  ArtistViewController.swift
//  poplur
//
//  Created by Mark Meritt on 2016-08-09.
//  Copyright © 2016 Apptist. All rights reserved.
//

import UIKit

class EditProfileController: IndexViewController {
    var artistImg: UIImage!
    var scrollView: UIScrollView!
    
    
    @IBOutlet weak var artistImgView: UIImageView!  //load firebase image into image view
    
    @IBAction func addImgBtnPressed(sender: AnyObject) { //edit profile
    }
    
    @IBAction func playBtnPressed(sender: AnyObject) { //play track
    }
    
    @IBAction func fastFwdBtnPressed(sender: AnyObject) { //next track
    }
    
    @IBOutlet weak var artistNameLbl: UILabel! //name loaded from Firebase
    
    @IBAction func rewindBtnPressed(sender: AnyObject) { //previous track
    }
    
    
    
    override init(index: Int){
        super.init(index: index)
        self.index = index //index of VC 
    }
    
    
   required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }
    
  }