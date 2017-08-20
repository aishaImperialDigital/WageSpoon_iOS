//
//  CommonCell
//  Wagespoon
//
//  Created by gqgnju on 26/07/17.
//  Copyright © 2017 Developer. All rights reserved.
//
import UIKit
class AppearanceCell: MyProfileParentCell{
   
 
    @IBOutlet var holderView: UIView!
    @IBOutlet var pickerImageView: UIImageView!
    @IBOutlet var facialMarkingTextField: UITextField!
    var appearencesModel: [WageSpoonApearList]?
    

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Initialization code
        Bundle.main.loadNibNamed("AppearanceCell", owner: self, options: nil)
        holderView.backgroundColor = UIColor.clear
        contentView.backgroundColor = UIColor.clear
        contentView.addSubview(holderView)
        
        pickerImageView.layer.cornerRadius = 15
        pickerImageView.layer.masksToBounds = true
        pickerImageView.layer.borderWidth = 1.0
        pickerImageView.layer.borderColor = UIColor.lightGray.cgColor
        
        appearencesModel = [WageSpoonApearList.init(data:"")]
        
        
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
    
    //@IBOutlet var imageView: UIImageView!
    
 
    func setProfileData(){
        facialMarkingTextField.text = appearencesModel?[0].apearence_name
    }
    
}
