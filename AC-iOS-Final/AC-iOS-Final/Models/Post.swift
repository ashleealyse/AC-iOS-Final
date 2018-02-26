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
    var imageURL: String
    var comment: String
    var uID: String
    init(imageUrl: String, comment: String, uID: String) {
        self.imageURL = imageUrl
        self.comment = comment
        self.uID = uID
    }
    
    init(comment: String, uID: String){
        self.comment = comment
        self.uID = uID
        self.imageURL = ""
    }
}
