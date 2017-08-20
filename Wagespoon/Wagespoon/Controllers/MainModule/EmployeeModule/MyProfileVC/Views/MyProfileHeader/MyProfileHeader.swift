//
//  Header.swift
//  Wagespoon
//
//  Created by gqgnju on 27/07/17.
//  Copyright © 2017 Developer. All rights reserved.
//

class MyProfileHeader: UIView {
    
    
  //  @IBOutlet var titleLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var seeComments: UIButton!
    @IBOutlet var leaveComments: UIButton!
    @IBOutlet var previewButton: UIButton!
    @IBOutlet var editProfileButton: UIButton!
    @IBOutlet var aceptButton: UIButton!
    @IBOutlet var rejectButton: UIButton!
    @IBOutlet var userLikesLabel: UILabel!
    @IBOutlet var userDisLikesLabel: UILabel!
    
    
    @IBOutlet var completionLabel: UILabel!
    @IBOutlet var nameTitleLabel: UILabel!
    @IBOutlet var detailsLabel: UILabel!
    
    
    override func awakeFromNib() {
        imageView.layer.cornerRadius = ((imageView.frame.width / 2))//instead of let radius = CGRectGetWidth(self.frame) / 2
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.lightGray.cgColor

        
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName:"MyProfileHeader",bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }

    
}
