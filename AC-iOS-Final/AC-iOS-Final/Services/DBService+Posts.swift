//
//  DBService+Posts.swift
//  AC-iOS-Final
//
//  Created by Ashlee Krammer on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//


import Foundation
import Firebase
import FirebaseDatabase
import FirebaseStorage
import UIKit

extension DBService{
    
    
    func addPost(image: UIImage?, comment: String){
        guard let currentUser = AuthUserService.getCurrentUser() else {print("could not get current user"); return}
        let ref = postRef.childByAutoId()
        let post = Post(comment: comment, uID: currentUser.uid)
        ref.setValue(["comment": post.comment,
                      "uID": post.uID])
        StorageService.manager.storeImage(image: image!, postId: ref.key)
        self.delegate?.didAddPost!()
    }

    
    public func getPosts(completion: @escaping (_ category: [Post]) -> Void) {
        postRef.observe(.value) { (dataSnapshot) in
            var posts = [Post]()
            guard let postSnapshots = dataSnapshot.children.allObjects as? [DataSnapshot] else {
                return
            }
            for thisPostsSnapshot in postSnapshots {
                guard let postObject = thisPostsSnapshot.value as? [String: Any] else {
                    return
                }
                
                guard let imageUrl = postObject["image"] as? String,
                    let comment = postObject["comment"] as? String,
                    let uID = postObject["uID"] as? String
                    else { print("error getting posts");return}
                
        
                let thisPost = Post(imageUrl: imageUrl, comment: comment, uID: uID)
                posts.append(thisPost)
            }
//            guard let userId = AuthUserService.getCurrentUser()?.uid else {print("cant get current users categories"); return}
//            cards = cards.filter{ $0.uID ==  userId} //sort by time
            
            DBService.manager.posts = posts
            completion(posts)
        }
    }
    
    
    
    
}

