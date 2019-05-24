//
//  ListaCarrosVC.swift
//  CustomTableView
//
//  Created by Thiago B Claramunt on 21/05/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

class ListaCarrosVC: UIViewController {
    var arrayCarros: [Carro] = []
    
    @IBOutlet weak var carrosTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.carrosTableView.register(UINib(nibName: "CarroTableViewCell", bundle: nil), forCellReuseIdentifier: "CarroTableViewCell")
        
        self.carrosTableView.delegate = self
        self.carrosTableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.atualizaTabela()
    }
    
    func atualizaTabela() {
        self.arrayCarros = CarroManager.shared.getCarros()
        carrosTableView.reloadData()
    }
}

extension ListaCarrosVC: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        

        return arrayCarros.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CarroTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CarroTableViewCell", for: indexPath) as! CarroTableViewCell
        
        cell.configCell(carro: self.arrayCarros[indexPath.row])

        return cell

    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            CarroManager.shared.deletaCarro(index: indexPath.row)
             self.atualizaTabela()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let carroSelecionado: Carro = self.arrayCarros[indexPath.row]
        
        self.performSegue(withIdentifier: "DetalheVC", sender: carroSelecionado)
        
      
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc: DetalheVC? = segue.destination as? DetalheVC
        
        if let _vc = vc {
            _vc.carro = sender as? Carro
        }
    }
    
}
