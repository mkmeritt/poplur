//
//  EditProfileController.swift
//  poplur
//
//  Created by Mark Meritt on 2016-08-15.
//  Copyright © 2016 Apptist. All rights reserved.
//

import UIKit

class EditProfileDetailController: IndexViewController, UITextFieldDelegate {
    
    
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
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        artistNameTxtField.resignFirstResponder()
        
        //set artist name to Firebase account name
        
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
            self.view.endEditing(true)
    }
}
