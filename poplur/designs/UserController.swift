//
//  LoginViewController.swift
//  ProfileCreation
//
//  Created by Anthony Ma on 7/8/2016.
//  Copyright © 2016 Anthony Ma. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

/*
 To do:
 create User class/struct to use artist name for email field signup
 create location field and set to user
 password restrictions (numbers, special chars)
 password generator button and action
 order of functions (api in which view)
 field to click artist version or still youtubeUsername 
 */

class UserController: IndexViewController, UITextFieldDelegate {
    
    var emailField: UITextField = UITextField()
    var passwordField: UITextField = UITextField()
    var signUpButton: UIButton = UIButton()
    var logInButton: UIButton = UIButton()
    var signoutButton: UIButton = UIButton()

    var ref: FIRDatabaseReference!
    
    override func viewDidLoad() {
        
        self.view.backgroundColor = UIColor.blackColor()

        //Firebase Database
        self.ref = FIRDatabase.database().reference()
        
        if let user = FIRAuth.auth()?.currentUser {
            self.signoutButton.alpha = 1.0
            self.emailField.text = user.email
        }
        else {
            self.signoutButton.alpha = 0.0
            self.emailField.text = ""
        }
        
        //textfields
        
        //email textfield
        self.emailField.backgroundColor = UIColor.whiteColor()
        
        //password textfield
        self.passwordField.backgroundColor = UIColor.whiteColor()
        self.passwordField.secureTextEntry = true
    
        //button
        self.signUpButton.backgroundColor = UIColor.whiteColor()
        self.signUpButton.setTitle("Sign up", forState: .Normal)
        self.signUpButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.signUpButton.userInteractionEnabled = true
        self.signUpButton.addTarget(self, action:#selector(UserController.touchSignUp(_:)), forControlEvents: .TouchDown)
        
        //button
        self.logInButton.backgroundColor = UIColor.whiteColor()
        self.logInButton.setTitle("Log In", forState: .Normal)
        self.logInButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.logInButton.userInteractionEnabled = true
        self.logInButton.addTarget(self, action:#selector(UserController.touchLogIn(_:)), forControlEvents: .TouchDown)
        
        //button
        self.signoutButton.backgroundColor = UIColor.whiteColor()
        self.signoutButton.setTitle("Signed out", forState: .Normal)
        self.signoutButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.signoutButton.userInteractionEnabled = true
        self.signoutButton.addTarget(self, action:#selector(UserController.touchSignout(_:)), forControlEvents: .TouchDown)
        
        //auto resizing setting
        self.emailField.translatesAutoresizingMaskIntoConstraints = false
        self.passwordField.translatesAutoresizingMaskIntoConstraints = false
        self.signUpButton.translatesAutoresizingMaskIntoConstraints = false
        self.logInButton.translatesAutoresizingMaskIntoConstraints = false
        self.signoutButton.translatesAutoresizingMaskIntoConstraints = false
        
        //add objects to view
        self.view.addSubview(self.emailField)
        self.view.addSubview(self.passwordField)
        self.view.addSubview(self.signUpButton)
        self.view.addSubview(self.logInButton)
        self.view.addSubview(self.signoutButton)
        
        //View
        
        self.signUpButton.addTarget(self, action: #selector(UserController.gotoProfilePage), forControlEvents: .TouchUpInside)
        
        //email textfield constraints
        let emailFieldCenterX = NSLayoutConstraint(item: self.emailField, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0)
        let emailFieldCenterY = NSLayoutConstraint(item: self.emailField, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 0)
        let emailFieldWidth = NSLayoutConstraint(item: self.emailField, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 100)
        let emailFieldHeight = NSLayoutConstraint(item: self.emailField, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 30)
        
        self.view.addConstraints([emailFieldCenterX, emailFieldCenterY, emailFieldWidth, emailFieldHeight])
        
        //password textfield constraints
        let passwordFieldCenterX = NSLayoutConstraint(item: self.passwordField, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0)
        let passwordFieldTopConstraint = NSLayoutConstraint(item: self.passwordField, attribute: .Top, relatedBy: .Equal, toItem: self.emailField, attribute: .Top, multiplier: 1.0, constant: 35)
        let passwordFieldWidth = NSLayoutConstraint(item: self.passwordField, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 100)
        let passwordFieldHeight = NSLayoutConstraint(item: self.passwordField, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 30)
        
        self.view.addConstraints([passwordFieldCenterX, passwordFieldTopConstraint, passwordFieldWidth, passwordFieldHeight])
    
        //signup button constraints
        let signupbuttonCenterX = NSLayoutConstraint(item: self.signUpButton, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0)
        let signupbuttonTopConstraint = NSLayoutConstraint(item: self.signUpButton, attribute: .Top, relatedBy: .Equal, toItem: self.passwordField, attribute: .Top, multiplier: 1.0, constant: 60)
        let signupbuttonWidth = NSLayoutConstraint(item: self.signUpButton, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 150)
        let signupbuttonHeight = NSLayoutConstraint(item: self.signUpButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 40)
        
        self.view.addConstraints([signupbuttonCenterX, signupbuttonTopConstraint, signupbuttonWidth, signupbuttonHeight])
        
        //login button constraints
        let loginButtonCenterX = NSLayoutConstraint(item: self.logInButton, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0)
        let loginButtonTopConstraint = NSLayoutConstraint(item: self.logInButton, attribute: .Top, relatedBy: .Equal, toItem: self.signUpButton, attribute: .Top, multiplier: 1.0, constant: 60)
        let loginButtonWidth = NSLayoutConstraint(item: self.logInButton, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 150)
        let loginButtonHeight = NSLayoutConstraint(item: self.logInButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 40)
        
        self.view.addConstraints([loginButtonCenterX, loginButtonTopConstraint, loginButtonWidth, loginButtonHeight])

        //signout button constraints
        let signoutButtonCenterX = NSLayoutConstraint(item: self.signoutButton, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0)
        let signoutButtonTopConstraint = NSLayoutConstraint(item: self.signoutButton, attribute: .Top, relatedBy: .Equal, toItem: self.logInButton, attribute: .Top, multiplier: 1.0, constant: 60)
        let signoutButtonWidth = NSLayoutConstraint(item: self.signoutButton, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 150)
        let signoutButtonHeight = NSLayoutConstraint(item: self.signoutButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 40)
        
        self.view.addConstraints([signoutButtonCenterX, signoutButtonTopConstraint, signoutButtonWidth, signoutButtonHeight])
    }
    
    // signup button action
    func touchSignUp(sender: UIButton!) {
        let email = self.emailField.text
        let password = self.passwordField.text
        
        
        //Check for sign up restrictions
        if (email!.isEmpty || password!.isEmpty) {
            let alert = UIAlertController.init(title: "Enter valid Email/Password", message: "Try again", preferredStyle: .Alert)
            let alertAction = UIAlertAction.init(title: "OK", style: .Cancel, handler: nil)
            alert.addAction(alertAction)
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else {
            //create user on firebase
            FIRAuth.auth()!.createUserWithEmail(email!, password: password!, completion: { (user, error) in
                if let error = error {
                    let alert = UIAlertController.init(title: "Oops", message: error.localizedDescription, preferredStyle: .Alert)
                    let alertAction = UIAlertAction.init(title: "Ok", style: .Cancel, handler: nil)
                    alert.addAction(alertAction)
                    self.presentViewController(alert, animated: true, completion: nil)
                }
                else {
                    self.signoutButton.alpha = 1.0
                    self.ref.child("Users").child(user!.uid).setValue(["username": user!])
                    print("sign up successful")
                }
            })
        }
    }
    
    func touchLogIn(sender: UIButton!) {
        let email = self.emailField.text
        let password = self.passwordField.text
        
        //Check for sign up restrictions
        if (email!.isEmpty || password!.isEmpty) {
            let alert = UIAlertController.init(title: "Enter valid Email/Password", message: "Try again", preferredStyle: .Alert)
            let alertAction = UIAlertAction.init(title: "OK", style: .Cancel, handler: nil)
            alert.addAction(alertAction)
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else {
            //create user on firebase
            FIRAuth.auth()!.signInWithEmail(email!, password: password!, completion: { (user, error) in
                if let error = error {
                    let alert = UIAlertController.init(title: "Error", message: error.localizedDescription, preferredStyle: .Alert)
                    let alertAction = UIAlertAction.init(title: "OK", style: .Cancel, handler: nil)
                    alert.addAction(alertAction)
                    self.presentViewController(alert, animated: true, completion: nil)
                }
                else {
                    self.signoutButton.alpha = 1.0
                    print("Log in successful")
                }
            })
        }
    }
    
    func touchSignout(sender: UIButton!) {
        try! FIRAuth.auth()!.signOut()
        self.signoutButton.alpha = 0.0
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        return true
    }
    
    func gotoProfilePage() {
        
        let vc = UIStoryboard(name:"MainStoryboard", bundle: nil).instantiateViewControllerWithIdentifier("EditProfileVC")
        
        presentViewController(vc, animated: true, completion: nil)
        
    }
    
    
}
