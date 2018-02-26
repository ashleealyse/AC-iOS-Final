//
//  CreatePostVC.swift
//  AC-iOS-Final
//
//  Created by Ashlee Krammer on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class CreatePostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //Variables
       let controller = UIImagePickerController()
    
    //Outlets
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var textScroll: UITextView!
    
    //View Did Load
    override func viewDidLoad() {
        let controller = UIImagePickerController()
        self.controller.delegate = self
        controller.sourceType = .photoLibrary
        super.viewDidLoad()
    }
    
    //Actions
    
    //Post
    @IBAction func createPost(_ sender: UIBarButtonItem) {
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
            postImage.image = image
            dismiss(animated: true, completion: nil)
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

//
//
//
//
//
//
//
////
////  BackgroundImageViewController.swift
////  LearningImagePickerStuff
////
////  Created by Ashlee Krammer on 12/21/17.
////  Copyright © 2017 Ashlee Krammer. All rights reserved.
////
//
//import UIKit
//
//class BackgroundImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//
//    //Outlets
//    @IBOutlet weak var backgroundImage: UIImageView!
//
//    //Variable
//
//    //View Did Load
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
//
//    //Touches began - detects touch
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("Screen touched")
//        let controller = UIImagePickerController()
//        controller.delegate = self
//        controller.sourceType = .photoLibrary
//        present(controller, animated: true, completion: nil)
//    }
//
//
//    //Conforming to Image Picker Controller
//
//
//    //Did Cancel
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        dismiss(animated: true, completion: nil)
//    }
//
//    //Finished Picking Media
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
//        backgroundImage.image = image
//        dismiss(animated: true, completion: nil)
//    }
//
//
//}
//







