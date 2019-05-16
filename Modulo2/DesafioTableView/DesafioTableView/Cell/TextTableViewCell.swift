//
//  TextTableViewCell.swift
//  DesafioTableView
//
//  Created by Thiago B Claramunt on 16/05/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

class TextTableViewCell: UITableViewCell, UITextViewDelegate {
    @IBOutlet weak var textView: UITextView!
    var textChanged: ((String) -> Void)?
    
}
