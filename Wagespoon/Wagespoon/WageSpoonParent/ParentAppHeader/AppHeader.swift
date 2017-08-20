//
//  Header.swift
//  Wagespoon
//
//  Created by gqgnju on 27/07/17.
//  Copyright © 2017 Developer. All rights reserved.
//

class AppHeader: UIView {
    
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var sideMenuButton: UIButton!
    override func awakeFromNib() {
        
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName:"AppHeader",bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }

    
}
