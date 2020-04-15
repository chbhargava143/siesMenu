//
//  MenuCell.swift
//  sideMenuAk
//
//  Created by chbn on 15/04/20.
//  Copyright © 2020 chbn. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {

    @IBOutlet weak var menuLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        menuLbl.textColor = UIColor.systemOrange
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
