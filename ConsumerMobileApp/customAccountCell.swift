//
//  customAccountCell.swift
//  Nano Invest
//
//  Created by Brilliant-005 on 12/1/16.
//  Copyright © 2016 Usman. All rights reserved.
//

import UIKit

class customAccountCell: UITableViewCell {

    @IBOutlet weak var lblDate: UILabel!
  @IBOutlet  weak var lblDescription: UILabel!
    @IBOutlet  weak var lblAmount:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
