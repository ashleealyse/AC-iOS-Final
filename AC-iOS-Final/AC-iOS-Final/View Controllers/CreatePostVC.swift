//
//  CreatePostVC.swift
//  AC-iOS-Final
//
//  Created by Ashlee Krammer on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class CreatePostVC: UIViewController {

    //Variables
    
    //Outlets
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var textScroll: UITextView!
    
    //View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Actions
    
    //Post
    @IBAction func createPost(_ sender: UIBarButtonItem) {
    }
    
    
    //Add Photo
    @IBAction func addPhoto(_ sender: UIButton) {
    }
    
    

}

//Storyboard Instance
extension CreatePostVC {
    static public func storyBoardInstance() -> UIViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "CreatePostVC") as! CreatePostVC
        return vc
    }
}
