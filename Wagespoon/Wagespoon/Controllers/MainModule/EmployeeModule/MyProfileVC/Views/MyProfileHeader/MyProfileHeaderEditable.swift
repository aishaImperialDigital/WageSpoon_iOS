//
//  Header.swift
//  Wagespoon
//
//  Created by gqgnju on 27/07/17.
//  Copyright © 2017 Developer. All rights reserved.
//

class MyProfileHeaderEditable: UIView {
    
    
  //  @IBOutlet var titleLabel: UILabel!
    @IBOutlet var profileImageView: UIImageView!

    @IBOutlet var doneProfileButton: UIButton!

    @IBOutlet var nameTitleTextField: UITextField!
    @IBOutlet var detailsTextField: UITextField!
    
    
    override func awakeFromNib() {
   
        nameTitleTextField.delegate = self as? UITextFieldDelegate
        detailsTextField.delegate = self as? UITextFieldDelegate
        
        profileImageView.layer.cornerRadius = ((profileImageView.frame.width / 2))//instead of let radius = CGRectGetWidth(self.frame) / 2
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.borderWidth = 1.0
        profileImageView.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName:"MyProfileHeaderEditable",bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.endEditing(true)
        return false
    }
}
