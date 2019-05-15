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
    @IBOutlet weak var seahorseImage: UIImageView!
    @IBOutlet weak var jellyImage: UIImageView!
    @IBOutlet weak var appNameTitle: UILabel!
    
    let containerSeahorseView = UIView(frame: CGRect(x: 240, y: 180, width: 0, height: 0))
    let containerTitleView = UIView(frame: CGRect(x: 100, y: 140, width: 174, height: 63))
    let containerJellyView = UIView(frame: CGRect(x: -217, y: 489, width: 648, height: 345))
    var dataUser: DataUser = DataUser(data: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        
        self.animate()
    }
    
    func animate() {
        UIView.animate(withDuration: 3.0, animations: { () -> Void in
            self.seahorseImage.center = self.containerSeahorseView.center
            self.appNameTitle.center = self.containerTitleView.center
            self.jellyImage.center = self.containerJellyView.center
        })
    }
    
    func authAnimate() {
        
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
        do {
            let email = try emailTextField.validatedText(validationType: ValidatorType.email)
            let password = try passwordTextField.validatedText(validationType: ValidatorType.password)
            let user: User = User(email: email, password: password)
            
            if dataUser.data.contains(where: {$0.email == user.email }) == true{
                errorLabel.text = "Email and password are registered!"
                view.shake(duration: 2.0)

            } else {
                save(user)
                errorLabel.text = "Sucess!"
            }
        } catch (let error) {
            errorLabel.text = (error as! ValidationError).message
            view.shake(duration: 2.0)
        }
    }
    
    func login() {
        do {
            let email = try emailTextField.validatedText(validationType: ValidatorType.email)
            let password = try emailTextField.validatedText(validationType: ValidatorType.password)
            let user: User = User(email: email, password: password)
            
            if dataUser.data.contains(where: {$0.email == user.email}) && dataUser.data.contains(where: {$0.password == user.password}) {
                errorLabel.text = "You are authenticated"
            } else {
                errorLabel.text = "You are authenticated"

            }
            
        } catch (let error) {
            errorLabel.text = (error as! ValidationError).message
            view.shake(duration: 2.0)
        }
    }
    
    func save(_ user: User) {
        dataUser.data.append(user)
    }
    
    
    @IBAction func signUp(_ sender: UIButton) {
        validate()
    }
    
    
    
    @IBAction func signIn(_ sender: UIButton) {
        
    }
    
}

