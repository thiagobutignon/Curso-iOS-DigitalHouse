//
//  CadastrarCarroViewController.swift
//  CustomTableView
//
//  Created by Thiago B Claramunt on 23/05/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

class CadastrarCarroViewController: UIViewController {
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var anoTextField: UITextField!
    @IBOutlet weak var knTextField: UITextField!
    @IBOutlet weak var precoTextField: UITextField!
    @IBOutlet weak var imagemTableView: UITableView!
    var imagens: [String] = ["ferrari", "mustang", "porsche"]
    
    @IBOutlet weak var imagemCarroLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        self.imagemTableView.delegate = self
//        self.imagemTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func voltar(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cadastrar(_ sender: Any) {
        let carro = Carro(nome: nomeTextField.text!, nomeImagem:imagemCarroLabel.text!, ano: Int(anoTextField.text!)!, km: Int(knTextField.text!)!, preco: Float(precoTextField.text!)!)
        CarroManager.shared.adicionarCarro(carro: carro)
        self.dismiss(animated: true, completion: nil)
    }
    

    
}

extension CadastrarCarroViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.imagens.count
    }
    


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imagemCell", for: indexPath)
        
        cell.textLabel?.text = self.imagens[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.imagemCarroLabel.text =  self.imagens[indexPath.row]
    }
    

}
