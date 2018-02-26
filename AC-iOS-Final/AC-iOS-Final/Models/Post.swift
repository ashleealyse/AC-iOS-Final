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
    var image: String
    var comment: String
    var uID: String
    init(image: String, comment: String, uID: String) {
        self.image = image
        self.comment = comment
        self.uID = uID
    }
}
