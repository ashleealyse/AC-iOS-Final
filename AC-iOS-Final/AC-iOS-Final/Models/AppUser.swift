//
//  AppUser.swift
//  AC-iOS-Final
//
//  Created by Ashlee Krammer on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation

class AppUser: NSObject { 
    var email: String
    var uID: String
    
    init(email: String, uID: String) {
        self.email = email
        self.uID = uID
    }
}
