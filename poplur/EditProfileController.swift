//
//  ArtistViewController.swift
//  poplur
//
//  Created by Mark Meritt on 2016-08-09.
//  Copyright © 2016 Apptist. All rights reserved.
//

import UIKit

class EditProfileController: IndexViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var artistImg: UIImage!
    var scrollView: UIScrollView!
    
    
    @IBOutlet weak var artistImgView: UIImageView!  //load firebase image into image view
    
    @IBAction func addImgBtnPressed(sender: AnyObject) { //edit profile
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .PhotoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        
        presentViewController(imagePickerController, animated: true, completion: nil)

    }
    
    @IBAction func playBtnPressed(sender: AnyObject) { //play track
    }
    
    @IBAction func fastFwdBtnPressed(sender: AnyObject) { //next track
    }
    
    @IBOutlet weak var artistNameLbl: UILabel! //name loaded from Firebase
    
    @IBAction func rewindBtnPressed(sender: AnyObject) { //previous track
    }
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        // The info dictionary contains multiple representations of the image, and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set photoImageView to display the selected image.
        
        // Dismiss the picker.
        dismissViewControllerAnimated(true, completion: nil)
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