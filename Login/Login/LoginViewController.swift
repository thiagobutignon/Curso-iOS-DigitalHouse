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
    @IBAction func signUp(_ sender: UIButton) {
        var user: User = User(email: emailLabel.text, password: passwordLabel.text)
    }
    
    @IBAction func signIn(_ sender: UIButton) {
    }
    
}

