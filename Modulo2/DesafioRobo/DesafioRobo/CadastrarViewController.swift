//
//  CadastrarViewController.swift
//  DesafioRobo
//
//  Created by Thiago B Claramunt on 16/05/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

class CadastrarViewController: UIViewController {

    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var corTextField: UITextField!
    @IBOutlet weak var forcaTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        nomeTextField.text = ""
        corTextField.text = ""
        forcaTextField.text = ""
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  
        
        
        if segue.identifier == "mostrarRobo" {
            guard let roboViewController = segue.destination as? RoboViewController else { return }
                        guard let roboSender = sender as? Robo else { return }
            
            roboViewController.nome = roboSender.nome
            roboViewController.cor = roboSender.cor
            roboViewController.forca = roboSender.forca
    
        }
    }
    @IBAction func cadastrarRobo(_ sender: Any) {
        guard let nome = nomeTextField.text, let cor = corTextField.text, let forca = Int(forcaTextField.text ?? "1")  else {
            return
        }
        let robo: Robo = Robo(nome: nome, cor: cor, forca: forca)

        print(performSegue(withIdentifier: "mostrarRobo", sender: robo))
    

    }
    
}

