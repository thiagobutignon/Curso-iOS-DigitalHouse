//
//  ChecklistTableViewCell.swift
//  DesafioTableView
//
//  Created by Thiago B Claramunt on 21/05/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

class ChecklistTableViewCell: UITableViewCell {
    @IBOutlet weak var todoTextLabel: UILabel!
    
    @IBOutlet weak var checkmarkLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
