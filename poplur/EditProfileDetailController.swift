//
//  EditProfileController.swift
//  poplur
//
//  Created by Mark Meritt on 2016-08-15.
//  Copyright © 2016 Apptist. All rights reserved.
//

import UIKit

class EditProfileDetailController: IndexViewController, UITextFieldDelegate, UITextViewDelegate {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    @IBOutlet weak var bioEditTextView: UITextView!
    
    @IBAction func doneBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    @IBOutlet weak var artistNameTxtField: UITextField!
    
    @IBAction func addImgBtnPressed(sender: AnyObject) {
        //save image to Firebase image 
    }
    
    @IBAction func addYouTubeVideoBtnPressed(sender: AnyObject) {
    }

    @IBAction func addMP3BtnPressed(sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
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
