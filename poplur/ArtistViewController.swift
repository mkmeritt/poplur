//
//  ArtistViewController.swift
//  poplur
//
//  Created by Mark Meritt on 2016-08-09.
//  Copyright © 2016 Apptist. All rights reserved.
//

import UIKit

class ArtistViewController: IndexViewController {
    var artistImg: UIImage!
    var scrollView: UIScrollView!
    
    
    @IBOutlet weak var artistImgView: UIImageView!
    
    @IBAction func addImgBtnPressed(sender: AnyObject) {
    }
    
    @IBAction func playBtnPressed(sender: AnyObject) {
    }
    
    @IBAction func fastFwdBtnPressed(sender: AnyObject) {
    }
    
    @IBOutlet weak var artistNameLbl: UILabel!
    
    @IBAction func rewindBtnPressed(sender: AnyObject) {
    }
    
    
    
    override init(index: Int){
        super.init(index: index)
        self.index = index
    }
    
    
   required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }
    
  }