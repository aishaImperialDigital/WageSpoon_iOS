//
//  Extensions.swift
//  Wagespoon
//
//  Created by Ravi on 17/06/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import Foundation
import Foundation
import UIKit

extension UIView {

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }

    class func viewFromNibName(name: String) -> UIView? {

        let views = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
        return views!.first as? UIView
    }
}

extension UIRefreshControl {

    func beginRefreshingManually() {

        guard let scrollView = superview as? UIScrollView else { return }

        let offsetY = scrollView.contentOffset.y - frame.height

        scrollView.setContentOffset(CGPoint(x: 0, y: offsetY), animated: true)

        beginRefreshing()
    }
}

extension Data {
    func hex(separator:String = "") -> String {
        return (self.map { String(format: "%02X", $0) }).joined(separator: separator)
    }
}

extension Array {
    func contains<T>(obj: T) -> Bool where T : Equatable {
        return self.filter({$0 as? T == obj}).count > 0
    }
}

extension UISearchBar {
    public func setSerchTextcolor(color: UIColor) {
        let clrChange = subviews.flatMap { $0.subviews }
        guard let sc = (clrChange.filter { $0 is UITextField }).first as? UITextField else { return }
        sc.textColor = color
    }

}

extension UITextField {

    /// set icon with left padding of 8px
    func setLeftIcon(_ icon: UIImage, padding:Int,size:Int) {


        let outerView = UIView(frame: CGRect(x: 0, y: 0, width: size+padding, height: size) )
        let iconView  = UIImageView(frame: CGRect(x: 9, y: 0, width: size, height: size))
        iconView.image = icon
        outerView.addSubview(iconView)

        leftView = outerView
        leftViewMode = .always
    }
    
    /// set Withouticon with left padding of 8px
    func setLeftPadding(padding:Int,size:Int) {
        
        
        let outerView = UIView(frame: CGRect(x: 0, y: 0, width: size+padding, height: size) )
        let iconView  = UIImageView(frame: CGRect(x: 9, y: 0, width: size, height: size))
        outerView.addSubview(iconView)
        
        leftView = outerView
        leftViewMode = .always
    }
    
    

}


