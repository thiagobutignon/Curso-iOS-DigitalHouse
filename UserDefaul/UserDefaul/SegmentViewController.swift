//
//  SegmentViewController.swift
//  UserDefaul
//
//  Created by Thiago B Claramunt on 28/05/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

class SegmentViewController: UIViewController {

    @IBOutlet weak var colorSegmentController: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        if let _coreSelecionada = Utils.getStringObject(key: "corSelecionada") {
            let corSelecionada: Int = Int(_coreSelecionada) ?? -1
            self.colorSegmentController.selectedSegmentIndex = corSelecionada
            self.checkColor()
            
        } else {
            self.colorSegmentController.selectedSegmentIndex = -1
        }
    }
    
    private func checkColor() {
        switch self.colorSegmentController.selectedSegmentIndex {
        case 0:
            self.view.backgroundColor = .red
            break
        case 1:
            self.view.backgroundColor = .yellow
            break
        case 2:
            self.view.backgroundColor = .black
            break
        default:
            self.view.backgroundColor = .white
        }
    }
    
    @IBAction func colorPicker(_ sender: UISegmentedControl) {
        
        let corSelecionada: String = String(sender.selectedSegmentIndex)
        Utils.saveStringObject(key: "corSelecionada", value: corSelecionada)
        self.checkColor()
    }
    @IBAction func voltar(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
