//
//  CommonCell
//  Wagespoon
//
//  Created by gqgnju on 26/07/17.
//  Copyright © 2017 Developer. All rights reserved.
//
import UIKit
class CommonApplicantCell: UITableViewCell{
   
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var holderView: UIView!
    @IBOutlet var profileImageView: UIImageView!
    
    @IBOutlet var appointButton: UIButton!
    @IBOutlet var declineButton: UIButton!
    @IBOutlet var interviewButton: UIButton!
    @IBOutlet var waitlistButton: UIButton!

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Initialization code
        Bundle.main.loadNibNamed("CommonApplicantCell", owner: self, options: nil)
        holderView.backgroundColor = UIColor.clear
        contentView.backgroundColor = UIColor.clear
        contentView.addSubview(holderView)
        profileImageView.layer.cornerRadius = ((profileImageView.frame.width / 2))//instead of let radius = CGRectGetWidth(self.frame) / 2
        profileImageView.layer.masksToBounds = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
