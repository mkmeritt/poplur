//
//  User.swift
//  ProfileCreation
//
//  Created by Anthony Ma on 14/8/2016.
//  Copyright © 2016 Anthony Ma. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class User: NSObject {
    
    var uid: String
    var email: String
    
    // Initialize from arbitrary data
    init(uid: String, email: String) {
        self.uid = uid
        self.email = email
    }
}
