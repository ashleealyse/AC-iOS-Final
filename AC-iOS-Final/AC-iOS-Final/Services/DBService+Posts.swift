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

extension DBService{
    
    
    func addPost(image: String, comment: String){
//        for card in cards{
//            if card.question == question { //Question Already Exists
//                self.delegate?.didFailToAddCard!()
//                return
//            }
//        }
    
        guard let currentUser = AuthUserService.getCurrentUser() else {print("could not get current user"); return}
        let ref = postRef.childByAutoId()
        let post = Post(image: image, comment: comment, uID: currentUser.uid)
        ref.setValue(["image": post.image,
                      "comment": post.comment,
                      "uID": post.uID])
 
        self.delegate?.didAddPost!()
    }
    
    
    public func getPosts(completion: @escaping (_ category: [Post]) -> Void) {
        postRef.observe(.value) { (dataSnapshot) in
            var posts = [Post]()
            guard let postSnapshots = dataSnapshot.children.allObjects as? [DataSnapshot] else {
                return
            }
            for cardSnapshot in postSnapshots {
                guard let postObject = cardSnapshot.value as? [String: Any] else {
                    return
                }
                
                guard let image = postObject["image"] as? String,
                    let comment = postObject["comment"] as? String,
                    let uID = postObject["uID"] as? String
                    else { print("error getting posts");return}
                
                let thisPost = Post(image: image, comment: comment, uID: uID)
                posts.append(thisPost)
            }
            guard let userId = AuthUserService.getCurrentUser()?.uid else {print("cant get current users categories"); return}
//            cards = cards.filter{ $0.uID ==  userId}
            DBService.manager.posts = posts
            completion(posts)
        }
    }
    
    
    
    
    
    
    
}

