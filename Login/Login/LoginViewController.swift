//
//  LoginViewController.swift
//  Login
//
//  Created by Thiago B Claramunt on 13/05/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        errorLabel.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.isEqual(self.emailTextField) {
            self.passwordTextField.becomeFirstResponder()
        } else {
            self.passwordTextField.resignFirstResponder()
        }
        return true
    }
    
    func validate() {
        do{
            let email = try emailTextField.validatedText(validationType: ValidatorType.email)
            let password = try passwordTextField.validatedText(validationType: ValidatorType.password)
            let user: User = User(email: email, password: password)
            let data: () = user.addUser(user: user)
            save(data)
            
        } catch (let error) {
            errorLabel.text = (error as! ValidationError).message
        }
    }
    
    func save(_ data: ()) {
        errorLabel.text = "Email and password are registered!"
    }
    
    
    @IBAction func signUp(_ sender: UIButton) {
        validate()
    }
    
    
    
    @IBAction func signIn(_ sender: UIButton) {
    }
    
}

