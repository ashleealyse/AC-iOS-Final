//
//  DBService.swift
//  AC-iOS-Final
//
//  Created by Ashlee Krammer on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
import FirebaseDatabase

@objc protocol DBServiceDelegate: class {
    @objc optional func didFailToAddPost()
    @objc optional func didAddPost()
    @objc optional func didSaveImage()
    @objc optional func didFailToSaveImage()
}

class DBService: NSObject {
    
    private override init() {
        
        rootRef = Database.database().reference()
        usersRef = rootRef.child("users")
        postRef = rootRef.child("posts")
        super.init()
        
    }
    
    static let manager = DBService()
    
    var posts = [Post]()
    public func getAllPosts()-> DatabaseReference { return postRef }
    public func getUsers()-> DatabaseReference { return usersRef }
    var postRef: DatabaseReference!
    var rootRef: DatabaseReference!
    var usersRef: DatabaseReference!
    
    public weak var delegate: DBServiceDelegate?
    
    public func addImagesUsing(url: String, ref: DatabaseReference, id: String) {
        ref.child(id).child("imageURL").setValue(url)
        
    }
    
    
    
}
