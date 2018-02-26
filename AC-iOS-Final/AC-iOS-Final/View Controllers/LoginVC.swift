//
//  LoginVC.swift
//  AC-iOS-Final
//
//  Created by Ashlee Krammer on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    //Variables
    
    //Outlets
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    //View Did Load
    override func viewDidLoad() {
        AuthUserService.manager.delegate = self
        super.viewDidLoad()
    }
    
    //Actions
    
    //Login
    @IBAction func loginButton(_ sender: UIButton) {
        AuthUserService.manager.signIn(withEmail: usernameTF.text!, password: passwordTF.text!)
    }
    
    //CreateAccount
    @IBAction func createAccountButton(_ sender: UIButton) {
        AuthUserService.manager.createUser(withEmail: usernameTF.text!, password: passwordTF.text!)
    }
}

//Login Delegates Called
extension LoginVC: AuthUserServiceDelegate {
    
    func didSignIn(_ userService: AuthUserService, user: AppUser) {
        let tbc = UITabBarController()
        let pst = PostVC.storyBoardInstance()
        pst.tabBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "postfeed"), tag: 0)
        let cpv = CreatePostVC.storyBoardInstance()
        cpv.tabBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "createpost"), tag: 1)
        tbc.viewControllers = [pst, cpv]
        present(tbc, animated: true, completion: nil)
        print("User Signed In")
    }

    func didFailSigningIn(_ userService: AuthUserService, error: Error) {
        let alert = UIAlertController(title: "Sign In Error ", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

//Storyboard Instance
extension LoginVC {
    static public func storyBoardInstance() -> UIViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        return vc
    }
}

//Create User Delegates Called
extension LoginVC {
    
    func didCreateUser(_ userService: AuthUserService, user: AppUser) {
        let alert = UIAlertController(title: "Account Created ", message: "Start Posting", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            self.navigationController?.popToRootViewController(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
        let tbc = UITabBarController()
        let pst = PostVC.storyBoardInstance()
        pst.tabBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "postfeed"), tag: 0)
        let cpv = CreatePostVC.storyBoardInstance()
        cpv.tabBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "createpost"), tag: 1)
        tbc.viewControllers = [pst, cpv]
        present(tbc, animated: true, completion: nil)
    }
    
    func didFailCreatingUser(_ userService: AuthUserService, error: Error) {
        let alert = UIAlertController(title: "Account Could Not Created ", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
}



