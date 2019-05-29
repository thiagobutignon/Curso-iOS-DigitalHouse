//
//  ViewController.swift
//  UserDefaul
//
//  Created by Thiago B Claramunt on 28/05/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Utils.getStringObject(key: "email") != nil {
            emailTextField.text = Utils.getStringObject(key: "email")
        } else {
            emailTextField.text = ""
        }
    }


    @IBAction func cadastrar(_ sender: UIButton) {
        Utils.saveObject(key: "email", value: self.emailTextField.text ?? "")
        Utils.saveObject(key: "password", value: self.passwordTextField.text ?? "")
        
        performSegue(withIdentifier: "segmentViewController", sender: nil)
    }
    
}

