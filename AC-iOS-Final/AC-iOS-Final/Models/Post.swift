//
//  Post.swift
//  AC-iOS-Final
//
//  Created by Ashlee Krammer on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
import UIKit

class Post {
    var comment: String
    var uID: String
    var imageURL: String
    init(comment: String, uID: String, imageURL: String) {
        self.comment = comment
        self.uID = uID
        self.imageURL = imageURL
    }
    
    init(comment: String, uID: String){
        self.comment = comment
        self.uID = uID
        self.imageURL = ""
    }
}
