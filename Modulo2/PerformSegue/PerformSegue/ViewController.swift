//
//  ViewController.swift
//  PerformSegue
//
//  Created by Thiago B Claramunt on 16/05/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let nome: String = "Thiago"
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //    @IBAction func irParaTelaAmarela(_ sender: UIButton) {
    //        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    //        guard let amarelaViewController = storyboard.instantiateViewController(withIdentifier: "AmarelaViewController") as? AmarelaViewController else   { return }
    //        self.present(amarelaViewController, animated: true)
    //
    //    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mostrarAmarelaViewController" {
            guard let amarelaViewController = segue.destination as? AmarelaViewController else { return }
            guard let nomeSender = sender as? String else { return }
            
            amarelaViewController.nome = nomeSender
        }
    }
    @IBAction func irParaTelaAmarela(_ sender: UIButton) {
        performSegue(withIdentifier: "mostrarAmarelaViewController", sender: textField.text)
    }
}

