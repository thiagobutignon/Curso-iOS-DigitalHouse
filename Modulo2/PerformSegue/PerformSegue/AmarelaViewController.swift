//
//  AmarelaViewController.swift
//  PerformSegue
//
//  Created by Thiago B Claramunt on 16/05/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

class AmarelaViewController: UIViewController {
    var nome: String?
    
    @IBOutlet weak var nomeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nomeLabel.text = self.nome
    }

    @IBAction func voltarButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
