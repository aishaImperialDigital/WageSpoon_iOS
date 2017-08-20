//
//  CommonCell
//  Wagespoon
//
//  Created by gqgnju on 26/07/17.
//  Copyright © 2017 Developer. All rights reserved.
//
import UIKit
class AboutMeCell: MyProfileParentCell{
   
  
    @IBOutlet var holderView: UIView!
    @IBOutlet var textView: UITextView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Initialization code
        Bundle.main.loadNibNamed("AboutMeCell", owner: self, options: nil)
        holderView.backgroundColor = UIColor.clear
        contentView.backgroundColor = UIColor.clear
        contentView.addSubview(holderView)
        
        textView.text = "Describe yourself in maximum 50 words"
        textView.textColor = UIColor.lightGray
        
        
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

    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
           // textView.text = nil
            textView.textColor = UIColor.black
        }
    }
   // Then when the user finishes editing the text view and it's resigned as the first responder, if the text view is empty, reset its placeholder by re-adding the placeholder text and setting its color to light gray.
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Describe yourself in maximum 50 words"
            textView.textColor = UIColor.lightGray
        }
    }
}
