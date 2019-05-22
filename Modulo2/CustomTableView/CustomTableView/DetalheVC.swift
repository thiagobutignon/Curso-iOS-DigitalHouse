//
//  DetalheVC.swift
//  CustomTableView
//
//  Created by Thiago B Claramunt on 21/05/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

class DetalheVC: UIViewController {

    @IBOutlet weak var imagemCarro: UIImageView!
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var ano: UILabel!
    @IBOutlet weak var km: UILabel!
    @IBOutlet weak var preco: UILabel!
    
    var carro: Carro?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let _carro = self.carro {
            self.nome.text = _carro.nome
            self.imagemCarro.image = UIImage(named: _carro.nomeImagem ?? "")
            self.ano.text = String(_carro.ano)
            self.km.text = String(_carro.km)
            self.preco.text = String(_carro.preco)
            
            
        }
    }
    
    @IBAction func voltar(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
