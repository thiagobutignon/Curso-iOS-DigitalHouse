//
//  CarroLista.swift
//  CustomTableView
//
//  Created by Thiago B Claramunt on 21/05/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import Foundation

class CarroLista {
    var listaCarros: [Carro] = []
    
    init() {
        let row1 = Carro()
        let row2 = Carro()
        let row3 = Carro()
        
        row1.nome = "Ferrari"
        row1.nomeImagem = "ferrari"
        row1.ano = 2018
        row1.km = 48000
        row1.preco = 5000000.00
        
        row2.nome = "Porsche"
        row2.nomeImagem = "porsche"
        row2.ano = 2019
        row2.km = 12300
        row2.preco = 7500000.00
        
        row3.nome = "Mustang"
        row3.nomeImagem = "mustang"
        row3.ano = 2017
        row3.km = 32000
        row3.preco = 32000.00
        
        listaCarros.append(row1)
        listaCarros.append(row2)
        listaCarros.append(row3)
        
    }
}
