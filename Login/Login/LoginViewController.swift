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
    
    var containerSeahorseView = UIView(frame: CGRect(x: 240, y: 180, width: 0, height: 0))
    var containerTitleView = UIView(frame: CGRect(x: 100, y: 140, width: 174, height: 63))
    var containerJellyView = UIView(frame: CGRect(x: -217, y: 489, width: 648, height: 345))
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
            self.containerSeahorseView = UIView(frame: CGRect(x: 280, y: 140, width: 0, height: 0))
            self.containerTitleView = UIView(frame: CGRect(x: 110, y: 150, width: 174, height: 63))
            self.containerJellyView = UIView(frame: CGRect(x: -190, y: 450, width: 648, height: 345))
        })
    }
    
    func authAnimate() {
        UIView.animate(withDuration: 3.0, animations: { () -> Void in
            self.seahorseImage.center = self.containerSeahorseView.center
            self.appNameTitle.center = self.containerTitleView.center
            self.jellyImage.center = self.containerJellyView.center
            self.containerSeahorseView = UIView(frame: CGRect(x: 240, y: 180, width: 0, height: 0))
            self.containerTitleView = UIView(frame: CGRect(x: 100, y: 140, width: 174, height: 63))
            self.containerJellyView = UIView(frame: CGRect(x: -217, y: 489, width: 648, height: 345))
        })
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
                authAnimate()
            }
        } catch (let error) {
            errorLabel.text = (error as! ValidationError).message
            view.shake(duration: 2.0)
        }
    }
    
    func login() {
        do {
            let email = try emailTextField.validatedText(validationType: ValidatorType.email)
            let password = try passwordTextField.validatedText(validationType: ValidatorType.password)
            let user: User = User(email: email, password: password)
            
            if dataUser.data.contains(where: {$0.email == user.email}) == true && dataUser.data.contains(where: {$0.password == user.password}) == true {
                errorLabel.text = "You are authenticated"
                animate()
            } else {
                errorLabel.text = "Email or password are wrong!"
                view.shake(duration: 2.0)
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
        self.view.endEditing(true)
        print(dataUser.data)
    }
    
    
    
    @IBAction func signIn(_ sender: UIButton) {
        login()
        self.view.endEditing(true)
        print(dataUser.data)
    }
    
}

