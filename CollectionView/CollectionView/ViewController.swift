//
//  ViewController.swift
//  CollectionView
//
//  Created by Thiago B Claramunt on 04/06/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myCollection: UICollectionView!
    
    var arrayNomes: [String] = ["Thiago", "Anita", "Bruno", "Felipe", "Samuel", "Giuliano", "Alessandra", "Alessandra 2", "Alessandra 3", "Alessandra 4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.myCollection.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        self.myCollection.delegate = self
        self.myCollection.dataSource = self
    }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayNomes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CustomCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        
        cell.setup(name: self.arrayNomes[indexPath.row], image: "")
        
        return cell
    }
    
    
}
