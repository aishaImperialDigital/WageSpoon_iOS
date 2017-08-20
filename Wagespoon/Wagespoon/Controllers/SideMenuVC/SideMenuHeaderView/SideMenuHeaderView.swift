//
//  SideMenuHeaderView.swift
//  Wagespoon
//
//  Created by Ravi on 02/07/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import UIKit

class SideMenuHeaderView: UIView {

    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgViewUser: UIImageView!
    override func awakeFromNib() {
        imgViewUser.layer.cornerRadius = ((imgViewUser.frame.width / 2))//instead of let radius = CGRectGetWidth(self.frame) / 2
        imgViewUser.layer.masksToBounds = true

    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
