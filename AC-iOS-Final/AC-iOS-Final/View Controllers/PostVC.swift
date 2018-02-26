//
//  PostVC.swift
//  AC-iOS-Final
//
//  Created by Ashlee Krammer on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class PostVC: UIViewController {
    
    //Variables
    var posts = [Post]()
    //Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //View Did Load 
    override func viewDidLoad() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        super.viewDidLoad()
    }
    
    //Actions
    //Sign Out Button
    @IBAction func signoutButton(_ sender: UIBarButtonItem) {
        AuthUserService.manager.signOut()
    }
}

//Storyboard Instance
extension PostVC {
    static public func storyBoardInstance() -> UIViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "PostVC") as! PostVC
        return vc
    }
}

//Sign Out Delegates Called
extension PostVC: AuthUserServiceDelegate {
    func didSignOut(_ userService: AuthUserService) {
        present(LoginVC.storyBoardInstance(), animated: true, completion: nil)
        print("User Signed Out")
    }

    func didFailSigningOut(_ userService: AuthUserService, error: Error) {
        let alert = UIAlertController(title: "Signing Out Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

extension PostVC: UITableViewDelegate {
    
}

extension PostVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return posts.count
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
//        let thisPost = posts[indexPath.row]
        cell.postImage.image = #imageLiteral(resourceName: "largeimage")
//        cell.postTextView.text = thisPost.comment
        return cell
    }
    
}
