//
//  Header.swift
//  Wagespoon
//
//  Created by gqgnju on 27/07/17.
//  Copyright © 2017 Developer. All rights reserved.
//

class LeaveComments: UIView {
    
    
  //  @IBOutlet var titleLabel: UILabel!
    @IBOutlet var textView: UITextView!
    @IBOutlet var postComment: UIButton!

  
    override func awakeFromNib() {
        
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName:"LeaveComments",bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }

    
}
