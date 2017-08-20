//
//  Header.swift
//  Wagespoon
//
//  Created by gqgnju on 27/07/17.
//  Copyright © 2017 Developer. All rights reserved.
//

class BackHeader: UIView {
    
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var backButton: UIButton!
    override func awakeFromNib() {
        
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName:"BackHeader",bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }

    
}
