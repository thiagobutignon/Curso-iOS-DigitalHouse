//
//  ViewController.swift
//  ProjetoTableView
//
//  Created by Thiago B Claramunt on 14/05/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

enum Veiculo: Int {
    case carro = 0
    case moto = 1
}

class ViewController: UITableViewController {
    var carros: [String] = ["Carro 1", "Carro 2", "Carro 3", "Carro 4", "Carro 5"]
    var motos: [String] = ["Moto", "Harley", "CG", "Hornet"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        

        // Do any additional setup after loading the view.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case Veiculo.carro.rawValue:
            return "Carros"
        case Veiculo.moto.rawValue:
            return "Motos"
        default:
            return "Sem categoria"
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case Veiculo.carro.rawValue:
            return self.carros.count
        case Veiculo.moto.rawValue:
            return self.motos.count
        default:
            return Int()
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        
        switch indexPath.section {
        case Veiculo.carro.rawValue:
            cell.textLabel?.text = self.carros[indexPath.row]

        case Veiculo.moto.rawValue:
            cell.textLabel?.text = self.motos[indexPath.row]
        default:
            return UITableViewCell()
        }

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case Veiculo.carro.rawValue:
           print("Clicou na: \(self.carros[indexPath.row])")
            
        case Veiculo.moto.rawValue:
            print("Clicou na: \(self.motos[indexPath.row])")
        default:
            break
        }
        
        
    }
}

