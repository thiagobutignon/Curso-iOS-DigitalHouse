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
        
        if let _email = Utils.getStringObject(key: "email") {
            emailTextField.text = _email
        }
        
        let dicionario: [String: Any] = ["cachorro":"thiago", "gato": 27]
        Utils.saveDic(dic: dicionario, key: "meuDicionario")
        let dic = Utils.getDictionary(key: "meuDicionario")
        
        if let cachorro = dic["cachorro"] as? String {
            print(cachorro)
        }
    }
    
    
    private func fazerLogin(senha: String) {
        if self.passwordTextField.text ?? "" == senha {
          self.performSegue(withIdentifier: "segmentViewController", sender: nil)
        } else {
            print("------- Deu Ruim senha incorreta!")
        }
    }
    
    @IBAction func cadastrar(_ sender: UIButton) {
        
        if let _password = Utils.getStringObject(key: "password") {
            fazerLogin(senha: _password)
        } else {
            Utils.saveObject(key: "email", value: self.emailTextField.text ?? "")
            Utils.saveObject(key: "password", value: self.passwordTextField.text ?? "")
            
            print(Utils.getStringObject(key: "password") ?? "")
            print(Utils.getStringObject(key: "email") ?? "")
            fazerLogin(senha: Utils.getStringObject(key: "password") ?? "")
        }
    }
    
}

