//
//  EditProfileController.swift
//  poplur
//
//  Created by Mark Meritt on 2016-08-15.
//  Copyright © 2016 Apptist. All rights reserved.
//

import UIKit

class EditProfileDetailController: IndexViewController, UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    @IBOutlet weak var bioEditTextView: UITextView!
    
    @IBAction func doneBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    @IBOutlet weak var artistNameTxtField: UITextField!
    
    @IBAction func addImgBtnPressed(sender: AnyObject) {
        //save image to Firebase image 
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .PhotoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        
        presentViewController(imagePickerController, animated: true, completion: nil)
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
    
    

    
    @IBAction func addYouTubeVideoBtnPressed(sender: AnyObject) {
    }

    @IBAction func addMP3BtnPressed(sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSizeMake(UIScreen.mainScreen().bounds.width, 1000)
        
        bioEditTextView.textColor = UIColor.whiteColor()
        artistNameTxtField.textColor = UIColor.whiteColor()
        
        
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        artistNameTxtField.resignFirstResponder()
        
        return true
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        bioEditTextView.endEditing(true)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
            artistNameTxtField.endEditing(true)
            bioEditTextView.endEditing(true)
    }
}
