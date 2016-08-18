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

class UserController: IndexViewController {
    
    //user stuff
    var topLabel: UILabel = UILabel()
    
    var emailField: UITextField = UITextField()
    var passwordField: UITextField = UITextField()
    var youtubeField: UITextField = UITextField()
    var signUpButton: UIButton = UIButton()
    var logInButton: UIButton = UIButton()
    var signoutButton: UIButton = UIButton()
    
    //labels
    var emailLabel: UILabel = UILabel()
    var passwordLabel: UILabel = UILabel()
    var youtubeLabel: UILabel = UILabel()
    
    var youtubeVideosArray: NSMutableArray = NSMutableArray()

    var ref: FIRDatabaseReference!
    
    var registeredUser: User!
    
    override func viewDidLoad() {
        
        self.view.backgroundColor = UIColor.init(colorLiteralRed: 0/225, green: 0/225, blue: 50/225, alpha: 0.2)

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
        
        //labels 
    
        self.topLabel.backgroundColor = UIColor.clearColor()
        self.topLabel.font = UIFont.init(name: "Apple SD Gothic Neo", size: 40)
        self.topLabel.text = "Step in to Poplurity"
        self.topLabel.textColor = UIColor.whiteColor()
        
        self.emailLabel.backgroundColor = UIColor.init(white: 0.0, alpha: 0.0)
        self.emailLabel.textColor = UIColor.whiteColor()
        self.emailLabel.textAlignment = NSTextAlignment.Center
        self.emailLabel.text = "email"
        self.emailLabel.font = UIFont.init(name: "Apple SD Gothic Neo", size: 15)
        
        self.passwordLabel.backgroundColor = UIColor.init(white: 0.0, alpha: 0.0)
        self.passwordLabel.textColor = UIColor.whiteColor()
        self.passwordLabel.textAlignment = NSTextAlignment.Center
        self.passwordLabel.text = "password"
        self.passwordLabel.font = UIFont.init(name: "Apple SD Gothic Neo", size: 15)
        
        self.youtubeLabel.backgroundColor = UIColor.init(white: 0.0, alpha: 0.0)
        self.youtubeLabel.textColor = UIColor.whiteColor()
        self.youtubeLabel.textAlignment = NSTextAlignment.Center
        self.youtubeLabel.text = "YouTube channel name (optional)"
        self.youtubeLabel.font = UIFont.init(name: "Apple SD Gothic Neo", size: 15)
        
        //textfields
        
        
        //email textfield
        self.emailField.backgroundColor = UIColor.whiteColor()
        self.emailField.layer.cornerRadius = 7
        self.emailField.layer.borderWidth = 0.5
        self.emailField.font = UIFont.init(name: "Apple SD Gothic Neo", size: 15)
        
        //password textfield
        self.passwordField.backgroundColor = UIColor.whiteColor()
        self.passwordField.layer.cornerRadius = 7
        self.passwordField.layer.borderWidth = 0.5
        self.passwordField.secureTextEntry = true
        self.passwordField.font = UIFont.init(name: "Apple SD Gothic Neo", size: 15)
        
        //youtube textfield
        self.youtubeField.backgroundColor = UIColor.whiteColor()
        self.youtubeField.layer.cornerRadius = 7
        self.youtubeField.layer.borderWidth = 0.5
        self.youtubeField.font = UIFont.init(name: "Apple SD Gothic Neo", size: 15)
    
        //button
        self.signUpButton.backgroundColor = UIColor.whiteColor()
        self.signUpButton.layer.cornerRadius = 10
        self.signUpButton.layer.borderWidth = 0.5
        self.signUpButton.layer.borderColor = UIColor.grayColor().CGColor
        self.signUpButton.setTitle("Sign up", forState: .Normal)
        self.signUpButton.titleLabel?.font = UIFont.init(name: "Apple SD Gothic Neo", size: 15)
        self.signUpButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.signUpButton.userInteractionEnabled = true
        self.signUpButton.addTarget(self, action:#selector(UserController.touchSignUp(_:)), forControlEvents: .TouchUpInside)
        
        //button
        self.logInButton.backgroundColor = UIColor.whiteColor()
        self.logInButton.layer.cornerRadius = 10
        self.logInButton.layer.borderWidth = 0.5
        self.logInButton.setTitle("Log In", forState: .Normal)
        self.logInButton.titleLabel?.font = UIFont.init(name: "Apple SD Gothic Neo", size: 15)
        self.logInButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.logInButton.userInteractionEnabled = true
        self.logInButton.addTarget(self, action:#selector(UserController.touchLogIn(_:)), forControlEvents: .TouchUpInside)
        
        //button
        self.signoutButton.backgroundColor = UIColor.whiteColor()
        self.signoutButton.layer.cornerRadius = 10
        self.signoutButton.layer.borderWidth = 0.5
        self.signoutButton.setTitle("Signed out", forState: .Normal)
        self.signoutButton.titleLabel?.font = UIFont.init(name: "Apple SD Gothic Neo", size: 15)
        self.signoutButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.signoutButton.userInteractionEnabled = true
        self.signoutButton.addTarget(self, action:#selector(UserController.touchSignout(_:)), forControlEvents: .TouchUpInside)
        
        //auto resizing setting
        self.emailLabel.translatesAutoresizingMaskIntoConstraints = false
        self.emailField.translatesAutoresizingMaskIntoConstraints = false
        self.passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        self.passwordField.translatesAutoresizingMaskIntoConstraints = false
        self.youtubeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.youtubeField.translatesAutoresizingMaskIntoConstraints = false
        self.signUpButton.translatesAutoresizingMaskIntoConstraints = false
        self.logInButton.translatesAutoresizingMaskIntoConstraints = false
        self.signoutButton.translatesAutoresizingMaskIntoConstraints = false
        
        //add objects to view
        self.view.addSubview(self.topLabel)
        self.view.addSubview(self.emailLabel)
        self.view.addSubview(self.emailField)
        self.view.addSubview(self.passwordLabel)
        self.view.addSubview(self.passwordField)
        self.view.addSubview(self.youtubeLabel)
        self.view.addSubview(self.youtubeField)
        self.view.addSubview(self.signUpButton)
        self.view.addSubview(self.logInButton)
        self.view.addSubview(self.signoutButton)
        
        //View
        
        //title 
        let titleLabelLeft = NSLayoutConstraint(item: self.topLabel, attribute: .Leading, relatedBy: .Equal, toItem: self.view, attribute: .Leading, multiplier: 1.0, constant: 0)
        let titleLabelTopConstraint = NSLayoutConstraint(item: self.topLabel, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1.0, constant: 0)
        let titleLabelWidth = NSLayoutConstraint(item: self.topLabel, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: self.view.bounds.width)
        let titleLabelHeight = NSLayoutConstraint(item: self.topLabel, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: self.view.bounds.height/2)
        
        self.view.addConstraints([titleLabelLeft, titleLabelTopConstraint, titleLabelWidth, titleLabelHeight])
        
        //email label
        let emailLabelCenterX = NSLayoutConstraint(item: self.emailLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0)
        let emailLabelTopConstraint = NSLayoutConstraint(item: self.emailLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 5)
        let emailLabelWidth = NSLayoutConstraint(item: self.emailLabel, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 100)
        let emailLabelHeight = NSLayoutConstraint(item: self.emailLabel, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 15)
        
        self.view.addConstraints([emailLabelCenterX, emailLabelTopConstraint, emailLabelWidth, emailLabelHeight])

        
        //email textfield constraints
        let emailFieldCenterX = NSLayoutConstraint(item: self.emailField, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0)
        let emailFieldTopConstraint = NSLayoutConstraint(item: self.emailField, attribute: .Top, relatedBy: .Equal, toItem: self.emailLabel, attribute: .Top, multiplier: 1.0, constant: 13)
        let emailFieldWidth = NSLayoutConstraint(item: self.emailField, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 100)
        let emailFieldHeight = NSLayoutConstraint(item: self.emailField, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 30)
        
        self.view.addConstraints([emailFieldCenterX, emailFieldTopConstraint, emailFieldWidth, emailFieldHeight])
        
        //password label
        let passwordLabelCenterX = NSLayoutConstraint(item: self.passwordLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0)
        let passwordLabelTopConstraint = NSLayoutConstraint(item: self.passwordLabel, attribute: .Top, relatedBy: .Equal, toItem: self.emailField, attribute: .Top, multiplier: 1.0, constant: 35)
        let passwordLabelWidth = NSLayoutConstraint(item: self.passwordLabel, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 100)
        let passwordLabelHeight = NSLayoutConstraint(item: self.passwordLabel, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 15)
        
        self.view.addConstraints([passwordLabelCenterX, passwordLabelTopConstraint, passwordLabelWidth, passwordLabelHeight])
        
        //password textfield constraints
        let passwordFieldCenterX = NSLayoutConstraint(item: self.passwordField, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0)
        let passwordFieldTopConstraint = NSLayoutConstraint(item: self.passwordField, attribute: .Top, relatedBy: .Equal, toItem: self.passwordLabel, attribute: .Top, multiplier: 1.0, constant: 13)
        let passwordFieldWidth = NSLayoutConstraint(item: self.passwordField, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 100)
        let passwordFieldHeight = NSLayoutConstraint(item: self.passwordField, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 30)
        
        self.view.addConstraints([passwordFieldCenterX, passwordFieldTopConstraint, passwordFieldWidth, passwordFieldHeight])
        
        //youtube label
        let youtubeLabelCenterX = NSLayoutConstraint(item: self.youtubeLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0)
        let youtubeLabelTopConstraint = NSLayoutConstraint(item: self.youtubeLabel, attribute: .Top, relatedBy: .Equal, toItem: self.passwordField, attribute: .Top, multiplier: 1.0, constant: 35)
        let youtubeLabelWidth = NSLayoutConstraint(item: self.youtubeLabel, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: self.view.bounds.width)
        let youtubeLabelHeight = NSLayoutConstraint(item: self.youtubeLabel, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 15)
        
        self.view.addConstraints([youtubeLabelCenterX, youtubeLabelTopConstraint, youtubeLabelWidth, youtubeLabelHeight])
        
        //youtube textfield constraints
        let youtubeFieldCenterX = NSLayoutConstraint(item: self.youtubeField, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0)
        let youtubeFieldTopConstraint = NSLayoutConstraint(item: self.youtubeField, attribute: .Top, relatedBy: .Equal, toItem: self.youtubeLabel, attribute: .Top, multiplier: 1.0, constant: 13)
        let youtubeFieldWidth = NSLayoutConstraint(item: self.youtubeField, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 100)
        let youtubeFieldHeight = NSLayoutConstraint(item: self.youtubeField, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 30)
        
        self.view.addConstraints([youtubeFieldCenterX, youtubeFieldTopConstraint, youtubeFieldWidth, youtubeFieldHeight])
    
        //signup button constraints
        let signupbuttonCenterX = NSLayoutConstraint(item: self.signUpButton, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0)
        let signupbuttonTopConstraint = NSLayoutConstraint(item: self.signUpButton, attribute: .Top, relatedBy: .Equal, toItem: self.youtubeField, attribute: .Top, multiplier: 1.0, constant: 70)
        let signupbuttonWidth = NSLayoutConstraint(item: self.signUpButton, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 150)
        let signupbuttonHeight = NSLayoutConstraint(item: self.signUpButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 40)
        
        self.view.addConstraints([signupbuttonCenterX, signupbuttonTopConstraint, signupbuttonWidth, signupbuttonHeight])
        
        //login button constraints
        let loginButtonCenterX = NSLayoutConstraint(item: self.logInButton, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0)
        let loginButtonTopConstraint = NSLayoutConstraint(item: self.logInButton, attribute: .Top, relatedBy: .Equal, toItem: self.signUpButton, attribute: .Top, multiplier: 1.0, constant: 50)
        let loginButtonWidth = NSLayoutConstraint(item: self.logInButton, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 150)
        let loginButtonHeight = NSLayoutConstraint(item: self.logInButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 40)
        
        self.view.addConstraints([loginButtonCenterX, loginButtonTopConstraint, loginButtonWidth, loginButtonHeight])

        //signout button constraints
        let signoutButtonCenterX = NSLayoutConstraint(item: self.signoutButton, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0)
        let signoutButtonTopConstraint = NSLayoutConstraint(item: self.signoutButton, attribute: .Top, relatedBy: .Equal, toItem: self.logInButton, attribute: .Top, multiplier: 1.0, constant: 50)
        let signoutButtonWidth = NSLayoutConstraint(item: self.signoutButton, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 150)
        let signoutButtonHeight = NSLayoutConstraint(item: self.signoutButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 40)
        
        self.view.addConstraints([signoutButtonCenterX, signoutButtonTopConstraint, signoutButtonWidth, signoutButtonHeight])
    }
    
    // signup button action
    func touchSignUp(sender: UIButton!) {
        let signupEmail = self.emailField.text
        let password = self.passwordField.text
        let youtubeChannel = self.youtubeField.text
        
        //Check for sign up restrictions
        if (signupEmail!.isEmpty || password!.isEmpty) {
            let alert = UIAlertController.init(title: "Enter valid Email/Password", message: "Try again", preferredStyle: .Alert)
            let alertAction = UIAlertAction.init(title: "OK", style: .Cancel, handler: nil)
            alert.addAction(alertAction)
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else {
            //create user on firebase
            FIRAuth.auth()!.createUserWithEmail(signupEmail!, password: password!, completion: { (user, error) in
                if let error = error {
                    let alert = UIAlertController.init(title: "Oops", message: error.localizedDescription, preferredStyle: .Alert)
                    let alertAction = UIAlertAction.init(title: "Ok", style: .Cancel, handler: nil)
                    alert.addAction(alertAction)
                    self.presentViewController(alert, animated: true, completion: nil)
                }
                else {
                    if youtubeChannel!.isEmpty {
                        self.signoutButton.alpha = 1.0
//                        let emailTitle = user!.email!
//                        self.ref.child("Users").child(user!.uid).setValue(["email": emailTitle])
//                        self.ref.child("Users").child(user!.uid).child("Videos").setValue()
                        let uid = user!.uid
                        let email = user!.email
                        self.registeredUser = User.init(uid: uid, email: email!)
                        print("sign up successful")
                    }
                    else {
                        if youtubeChannel!.containsString(" ") {
                            let youtubeChannelString = youtubeChannel!.stringByReplacingOccurrencesOfString(" ", withString: "+")
                            self.signoutButton.alpha = 1.0
                            APIObject.sharedInstance.userChannelTitle = youtubeChannelString
                            APIObject.sharedInstance.getChannelID({ channelId in
                                print(channelId)
//                                let emailTitle = user!.email!
//                                self.ref.child("Users").child(user!.uid).setValue(["email": emailTitle])
                                // self.ref.child("Users").child(user!.uid).child("Videos").setValue()
                                self.presentViewController(CollectionViewController(), animated: true, completion: {})
                                print("sign up successful")
                            })
                            print("request started")
                        }
                        else {
                            self.signoutButton.alpha = 1.0
//                            APIObject().channelId = youtubeChannel!
                            if let channel = youtubeChannel {
                                APIObject.sharedInstance.channelId = channel
                                APIObject.sharedInstance.getChannelID({ channelId in
                                    // let uid = user!.uid
//                                    let emailTitle = user!.email!
//                                    self.ref.child("Users").child(user!.uid).setValue(["email": emailTitle])
                                    // self.ref.child("Users").child(user!.uid).child("Videos").setValue()
                                    self.presentViewController(CollectionViewController(), animated: true, completion: {})
                                    print(self.registeredUser.uid)
                                    print("sign up successful")
                            })
                        }
                    }
                }
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
                    let uid = user!.uid
                    let email = user!.email
                    self.registeredUser = User.init(uid: uid, email: email!)
                    print(self.registeredUser.uid)
                    print("Log in successful")
                }
            })
        }
    }
    
    func touchSignout(sender: UIButton!) {
        try! FIRAuth.auth()!.signOut()
        self.signoutButton.alpha = 0.0
    }
}
