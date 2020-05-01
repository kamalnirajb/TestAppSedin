//
//  UserCellTableViewCell.swift
//  TestApp
//
//  Created by Niraj Kumar on 01/05/2020.
//  Copyright © 2020 NirWorld. All rights reserved.
//

import UIKit

class UserCellTableViewCell: UITableViewCell{

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var createAt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
