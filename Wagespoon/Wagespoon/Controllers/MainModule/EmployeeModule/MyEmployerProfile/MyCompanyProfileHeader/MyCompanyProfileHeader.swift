//
//  Header.swift
//  Wagespoon
//
//  Created by gqgnju on 27/07/17.
//  Copyright © 2017 Developer. All rights reserved.
//

class MyCompanyProfileHeader: UIView {
    
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var createAJobButton: UIButton!
    @IBOutlet var editProfileButton: UIButton!
    
    
    override func awakeFromNib() {
        imageView.layer.cornerRadius = ((imageView.frame.width / 2))//instead of let radius = CGRectGetWidth(self.frame) / 2
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.lightGray.cgColor

        
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName:"MyCompanyProfileHeader",bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }

    
}
