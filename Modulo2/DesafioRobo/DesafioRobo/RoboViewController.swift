//
//  RoboViewController.swift
//  DesafioRobo
//
//  Created by Thiago B Claramunt on 16/05/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

class RoboViewController: UIViewController {

    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var corLabel: UILabel!
    @IBOutlet weak var forcaLabel: UILabel!
    
    var nome: String = ""
    var cor: String = ""
    var forca: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nomeLabel.text = self.nome
        self.corLabel.text = self.cor
        self.forcaLabel.text = String(self.forca)
        
    }
    
    @IBAction func voltar(_ sender: Any) {
        self.dismiss(animated: true)
        
    }
    

}
