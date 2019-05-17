//
//  ViewController.swift
//  PerformSegue
//
//  Created by Thiago B Claramunt on 16/05/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func irParaTelaAmarela(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let amarelaViewController = storyboard.instantiateViewController(withIdentifier: "AmarelaViewController") as? AmarelaViewController else   { return }
        self.present(amarelaViewController, animated: true)
        
    }
    
}

