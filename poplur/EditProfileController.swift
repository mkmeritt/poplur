//
//  ArtistViewController.swift
//  poplur
//
//  Created by Mark Meritt on 2016-08-09.
//  Copyright © 2016 Apptist. All rights reserved.
//

import UIKit

class EditProfileController: IndexViewController{
    var artistImg: UIImage!
    var scrollView: UIScrollView!
    
    var doubleTap: UITapGestureRecognizer! = nil
    
    var swipeDown: UISwipeGestureRecognizer! = nil

    
    
    @IBOutlet weak var artistImgView: UIImageView!  //load firebase image into image view
    
  
    
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
        
        
        
        doubleTap = UITapGestureRecognizer(target: self, action: #selector(EditProfileController.onDoubleTap))
        doubleTap.numberOfTapsRequired = 1
        
        let scrollView = UIScrollView()
        scrollView.frame = self.view.bounds
        scrollView.contentSize = CGSize(width: self.view.bounds.size.width, height: 1000)
        
        scrollView.showsVerticalScrollIndicator = false
        
        swipeDown = UISwipeGestureRecognizer(target: scrollView, action: #selector(EditProfileController.handleSwipeDown))
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        
        
        
        let view = UIView()
        view.backgroundColor = UIColor.clearColor()
        view.frame = CGRect(x: 0, y: 650, width: scrollView.bounds.size.width, height: 500)
        scrollView.addSubview(view)
        
        self.view.addSubview(scrollView)
        
        let textView = UITextView()
        textView.backgroundColor = UIColor.blackColor()
        textView.frame = CGRect(x: view.bounds.origin.x, y: view.bounds.origin.y + 50, width: view.bounds.size.width, height: view.bounds.size.height)

            textView.textColor = UIColor.whiteColor()
            textView.textAlignment = .Center
            textView.font = UIFont(name: "Apple SD Gothic Neo", size: 16)
            view.addSubview(textView)
       
        scrollView.addGestureRecognizer(doubleTap)
        scrollView.addGestureRecognizer(swipeDown)

      
    }
    
    func handleSwipeDown() {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func onDoubleTap() {
        let vc = storyboard?.instantiateViewControllerWithIdentifier("EditProfileDetailVC") as! EditProfileDetailController
        presentViewController(vc, animated: true, completion: nil)
    }
    
  }