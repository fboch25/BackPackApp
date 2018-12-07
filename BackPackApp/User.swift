//
//  User.swift
//  BackPackApp
//
//  Created by Frank Joseph Boccia on 12/6/18.
//  Copyright © 2018 Frank Joseph Boccia. All rights reserved.
//

import Foundation
import Firebase

struct User {
    
    let uid: String
    let email: String
    
    init(authData: Firebase.User) {
        uid = authData.uid
        email = authData.email!
    }
    
    init(uid: String, email: String) {
        self.uid = uid
        self.email = email
    }
}
