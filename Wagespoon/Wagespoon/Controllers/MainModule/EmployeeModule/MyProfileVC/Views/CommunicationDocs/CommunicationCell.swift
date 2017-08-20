//
//  CommonCell
//  Wagespoon
//
//  Created by gqgnju on 26/07/17.
//  Copyright © 2017 Developer. All rights reserved.
//
import UIKit
class CommunicationCell: MyProfileParentCell{
   

    @IBOutlet var holderView: UIView!
    @IBOutlet var documentImage1: UIImageView!
    @IBOutlet var documentImage2: UIImageView!
    @IBOutlet var documentImage3: UIImageView!
    @IBOutlet var documentImage4: UIImageView!
    
    var certificationsModel: [WageSpoonCertifiList]?
  
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Initialization code
        Bundle.main.loadNibNamed("CommunicationCell", owner: self, options: nil)
        holderView.backgroundColor = UIColor.clear
        contentView.backgroundColor = UIColor.clear
        contentView.addSubview(holderView)
        
        
        
        documentImage1.layer.cornerRadius = 15
        documentImage1.layer.masksToBounds = true
        documentImage1.layer.borderWidth = 1.0
        documentImage1.layer.borderColor = UIColor.lightGray.cgColor

        documentImage2.layer.cornerRadius = 15
        documentImage2.layer.masksToBounds = true
        documentImage2.layer.borderWidth = 1.0
        documentImage2.layer.borderColor = UIColor.lightGray.cgColor
        
        documentImage3.layer.cornerRadius = 15
        documentImage3.layer.masksToBounds = true
        documentImage3.layer.borderWidth = 1.0
        documentImage3.layer.borderColor = UIColor.lightGray.cgColor
        
        documentImage4.layer.cornerRadius = 15
        documentImage4.layer.masksToBounds = true
        documentImage4.layer.borderWidth = 1.0
        documentImage4.layer.borderColor = UIColor.lightGray.cgColor
        
        certificationsModel = [WageSpoonCertifiList.init(data:"")]
        
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
    
    func setProfileData(){
    }

}
