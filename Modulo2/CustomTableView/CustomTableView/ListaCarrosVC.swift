//
//  ListaCarrosVC.swift
//  CustomTableView
//
//  Created by Thiago B Claramunt on 21/05/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

class ListaCarrosVC: UIViewController {
     let item = CarroLista()
    
    @IBOutlet weak var carrosTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.carrosTableView.register(UINib(nibName: "CarroTableViewCell", bundle: nil), forCellReuseIdentifier: "CarroTableViewCell")
        
        self.carrosTableView.delegate = self
        self.carrosTableView.dataSource = self
    }
}

extension ListaCarrosVC: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.item.listaCarros.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CarroTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CarroTableViewCell", for: indexPath) as! CarroTableViewCell
        
        cell.configCell(carro: CarroLista.init().listaCarros[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell: CarroTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CarroTableViewCell", for: indexPath) as! CarroTableViewCell
        
        let carroSelecionado: Carro = CarroLista.init().listaCarros[indexPath.row]
        
        self.performSegue(withIdentifier: "DetalheVC", sender: carroSelecionado)
        
        dump(CarroLista.init().listaCarros[indexPath.row])
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc: DetalheVC? = segue.destination as? DetalheVC
        
        if let _vc = vc {
            _vc.carro = sender as? Carro
        }
    }
    
}
