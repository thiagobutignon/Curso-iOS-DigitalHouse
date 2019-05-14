//
//  LoginViewController.swift
//  Login
//
//  Created by Thiago B Claramunt on 13/05/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        errorLabel.text = ""
    }
    @IBAction func signUp(_ sender: UIButton) {
        let emailIsCorrect = Validation.emailVerification(email: emailLabel.text ?? "")
        if emailIsCorrect == true {
            let user: User = User(email: emailLabel.text ?? "", password: passwordLabel.text ?? "")
            let addUser: DataUsers = DataUsers()
            addUser.users.append(user)
            
            dump(addUser.users)
        } else {
            print("email está incorreto")
        }
        
    }
    
    @IBAction func signIn(_ sender: UIButton) {
    }
    
}

