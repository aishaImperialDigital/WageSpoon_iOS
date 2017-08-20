//
//  SideMenuCell.swift
//  Wagespoon
//
//  Created by Ravi on 02/07/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import UIKit

class SideMenuCell: UITableViewCell {

    //All XIB Objects
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!

    @IBOutlet weak var imageWidth: NSLayoutConstraint!
    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
