//
//  CreatePostVC.swift
//  AC-iOS-Final
//
//  Created by Ashlee Krammer on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit
import Kingfisher
import FirebaseDatabase

class CreatePostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //Variables
    let controller = UIImagePickerController()
//    public var imagePost = UIImage()
    
    //Outlets
    @IBOutlet weak var postButtonOutlet: UIBarButtonItem!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var textScroll: UITextView!
    @IBOutlet weak var cancelButtonOutlet: UIBarButtonItem!
    
    //View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        DBService.manager.delegate = self 
        let controller = UIImagePickerController()
        self.controller.delegate = self
        controller.sourceType = .photoLibrary

        
        
    }
    
    //Actions
    
    //Cancel Post
    @IBAction func cancelPostButton(_ sender: UIBarButtonItem) {
        textScroll.text = ""
        postImage.image = nil
        textScroll.resignFirstResponder()
    }
    

    //Add Photo
    @IBAction func addPhoto(_ sender: UIButton) {
        present(controller, animated: true, completion: nil)
    }
    
    //Did Cancel
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    //Finished Picking Media
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
//        imagePost = image
        postImage.image = image
        dismiss(animated: true, completion: nil)
        
    }
        //Post
    @IBAction func createPost(_ sender: UIBarButtonItem) {
        
        if postImage.image != nil && textScroll.text != "" {
            DBService.manager.addPost(image: postImage.image, comment: textScroll.text)
            
            textScroll.text = ""
            postImage.image = nil
        } else {
            let alert = UIAlertController(title: "All Fields Required", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            }))
            self.present(alert, animated: true, completion: nil)
        }
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

extension CreatePostVC: DBServiceDelegate {
    
    func didAddPost() {
        let alert = UIAlertController(title: "Post Added", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func didFailToAddPost() {
        let alert = UIAlertController(title: "Error Posting", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension CreatePostVC: UITextViewDelegate {
    
    func textViewDidEndEditing(_ textView: UITextView) {
        resignFirstResponder()
        cancelButtonOutlet.isEnabled = false
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        cancelButtonOutlet.isEnabled = true
    }
    
}


