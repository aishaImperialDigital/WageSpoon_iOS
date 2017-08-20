//
//  CommonCell
//  Wagespoon
//
//  Created by gqgnju on 26/07/17.
//  Copyright © 2017 Developer. All rights reserved.
//
import UIKit
class MyProfileParentCell: UITableViewCell{
   
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var doneButton: UIButton!
   

    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        // Initialization code
//        Bundle.main.loadNibNamed("AboutMeCell", owner: self, options: nil)
//        holderView.backgroundColor = UIColor.clear
//        contentView.backgroundColor = UIColor.clear
//        contentView.addSubview(holderView)
        
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
