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
    
    
    
}
