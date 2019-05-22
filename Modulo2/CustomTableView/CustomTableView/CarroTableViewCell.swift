//
//  CarroTableViewCell.swift
//  CustomTableView
//
//  Created by Thiago B Claramunt on 21/05/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

class CarroTableViewCell: UITableViewCell {
    @IBOutlet weak var imagemCarro: UIImageView!
    @IBOutlet weak var nomeCarro: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(nome: String, imagem: String) {
        self.nomeCarro.text = nome
        self.imagemCarro.image = UIImage(named: imagem)
    }
    
    func configCell(carro: Carro) {
        self.nomeCarro.text = carro.nome
        if let _imagemNome = carro.nomeImagem {
            self.imagemCarro.image = UIImage(named: _imagemNome)
        }
    }
    
}
