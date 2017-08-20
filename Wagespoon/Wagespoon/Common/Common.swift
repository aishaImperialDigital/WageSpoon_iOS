//
//  Common.swift
//  买一提
//
//  Created by gaoqingge on 15/01/16.
//  Copyright © 2016 gaoqingge. All rights reserved.
//

import UIKit
import Alamofire

class Common: NSObject {
    
    static func setUnknownView(_ View:AnyObject) {
        if View.isKind(of: UIView.self) {
            let button = View as! UIView
            button.layer.cornerRadius = 3.0
            button.layer.borderColor = UIColor.init(204,204,204).cgColor
            button.layer.borderWidth = 0.8
            button.clipsToBounds = true
        }
        if View.isKind(of: UIButton.self) {
            let button = View as! UIButton
            button.layer.cornerRadius = 3.0
            button.layer.borderColor = UIColor.init(204,204,204).cgColor
            button.layer.borderWidth = 0.8
            button.clipsToBounds = true
        }
    }
    
    static func setSignInViewBorder(_ View:AnyObject) {
        let view = View as! UIView
        view.layer.borderColor = UIColor.init(234,234,234).cgColor
        view.layer.borderWidth = 0.8
        view.clipsToBounds = true
    }
    
    static func setUnknownViewNoBorderColor(_ View:AnyObject) {
        if View.isKind(of: UIView.self) {
            let button = View as! UIView
            button.layer.cornerRadius = 3.0
            button.layer.borderColor = button.backgroundColor?.cgColor
            button.layer.borderWidth = 0.8
            button.clipsToBounds = true
        }
        if View.isKind(of: UIButton.self) {
            let button = View as! UIButton
            button.layer.cornerRadius = 3.0
            button.layer.borderColor = button.backgroundColor?.cgColor
            button.layer.borderWidth = 0.8
            button.clipsToBounds = true
        }
    }
    
    static func setUnknownViewNoCorner(_ View:AnyObject) {
        if View.isKind(of: UIView.self) {
            let button = View as! UIView
            button.layer.borderWidth = 0.6
            button.clipsToBounds = true
            button.layer.borderColor = UIColor.init(204,204,204).cgColor
        }
        if View.isKind(of: UIButton.self) {
            let button = View as! UIButton
            button.layer.borderWidth = 0.6
            button.clipsToBounds = true
            button.layer.borderColor = UIColor.init(204,204,204).cgColor
        }
    }
    
    static func setTextField(_ textField: UITextField)
    {
        textField.layer.borderColor = UIColor.init(204,204,204).cgColor
        textField.layer.borderWidth = 0.6
        textField.layer.cornerRadius = 4.0
        textField.borderStyle = .roundedRect
    }
    
    
    static func resizeImage(_ image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    static func setTopLayer(_ view: UIView) {
        let topBorder = CALayer.init()
        topBorder.frame = CGRect(x: 0, y: 0, width: Common.SCREEN_WIDTH, height: 0.5)
        topBorder.backgroundColor = UIColor.init(0xd2d0d0).cgColor
        
        view.layer.addSublayer(topBorder)
    }
    
    static func setBottomLayer(_ view: UIView, height: CGFloat) {
        let bottomBorder = CALayer.init()
        bottomBorder.frame = CGRect(x: 0, y: height-0.5, width: Common.SCREEN_WIDTH, height: 0.5)
        bottomBorder.backgroundColor = UIColor.init(0xd2d0d0).cgColor
        view.layer.addSublayer(bottomBorder)
    }
    
    static func dealResult(_ response: DataResponse<Any>) -> AnyObject? {
        print("======================")
        print( response.result.value)
         print("======================")
        switch response.result {
            case .success:
                if let JSON = response.result.value {
                    if (JSON as AnyObject).value(forKey: "errorcode") as! Int == 0 {
                        if let data = (JSON as AnyObject).value(forKey: "data") {
                            return data as AnyObject?
                        }
                    }
                    else {
                        Common.showHUD((JSON as AnyObject).value(forKey: "errormsg") as! String, 1.5)
                        
                    }
                }
                else {
                    Common.showHUD("Network error", 1.0)
                }
            case .failure(let error):
                print(error.localizedDescription)
                print(response.debugDescription)
        }

        return nil
    }
    
    
    static func showHUD(_ title:String, _ time:Double) {
       let windows = UIApplication.shared.keyWindow
        for window in UIApplication.shared.windows {
            MBProgressHUD.hide(for: window, animated: true)
        }
        let hud = MBProgressHUD.showAdded(to: windows!, animated: true)
        hud.label.text = title
        hud.label.numberOfLines = 0
        hud.bezelView.backgroundColor = UIColor.black
        hud.contentColor = UIColor.white
        hud.tintColor = UIColor.white
        hud.bezelView.alpha = 0.9
        hud.margin = 16
        hud.offset.y = 50
        hud.label.font = UIFont.systemFont(ofSize: 16)
        hud.mode = MBProgressHUDMode.customView
        hud.hide(animated: true, afterDelay: time)
        
    }

    
    static func getThemeColor() -> UIColor {
        return UIColor.init(0x1397EC) //0x0C68AC
    }
    
    static func getShortDate(_ date: String, format: String = "yyyy-MM-dd HH:mm:ss") -> String {
        let todaysDate = Date().dateFromString(date, format: format)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_US")
        let DateInFormat = dateFormatter.string(from: todaysDate)
        
        return DateInFormat
    }
    
    static func getDateString(_ date: String, endDate: String = "") -> String {
        let inputDate = Date().dateFromString(date, format: "yyyy-MM-dd HH:mm:ss")
        
        var now: Date?
        if endDate == "" {
            now = NSDate()  as Date
        }
        else {
            now = Date().dateFromString(endDate, format: "yyyy-MM-dd HH:mm:ss")
        }
        
//        let das = NSCalendar.current
//        let nowCom = das.dateComponents([.year, .month, .day, .hour, .minute], from: now as Date)
//        let timeCom = das.dateComponents([.year, .month, .day, .hour, .minute], from: inputDate)
        let dateComponentsFormatter = DateComponentsFormatter()
        dateComponentsFormatter.allowedUnits = [.year, .month, .day, .hour, .minute]
        dateComponentsFormatter.unitsStyle = .full
        if let difference = dateComponentsFormatter.string(from: inputDate, to: now!)?.components(separatedBy: ",")[0] {
            if  difference == "0 minutes" {
                return "just now"
            }
            else {
                return difference + " ago"
            }
        }
        else {
            return ""
        }
    }

    static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    static let RATIO = SCREEN_WIDTH/320
    static let STORYBOARD_BUYER = UIStoryboard.init(name: "Main", bundle: Bundle.main)
    static let STORYBOARD_SELLER = UIStoryboard.init(name: "Seller", bundle: Bundle.main)
}

extension Date {
    func dateFromString(_ date: String, format: String) -> Date {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = format
        return formatter.date(from: date)!
    }
}


extension String {
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        
        return boundingBox.height
    }
    
    func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    static func getPriceAttributedString(price: String, currency: String) -> NSAttributedString {
        let priceString = "$" + price + currency
        let priceMutableString = NSMutableAttributedString(
            string: priceString,
            attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 20, weight: UIFontWeightMedium)])
        priceMutableString.addAttribute(NSFontAttributeName,
                                        value: UIFont.systemFont(ofSize: 10),
                                        range: NSRange(
                                            location: price.characters.count+1,
                                            length: currency.characters.count))
        return priceMutableString
    }
    
    static func getPriceAttributedStringBracket(_ prefix: String, price: String, currency: String) -> NSAttributedString {
        let priceString = prefix + "($" + price + currency + ")"
        let priceMutableString = NSMutableAttributedString(
            string: priceString,
            attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 20, weight: UIFontWeightMedium)])
        priceMutableString.addAttribute(NSFontAttributeName,
                                        value: UIFont.systemFont(ofSize: 10),
                                        range: NSRange(
                                            location: price.characters.count + prefix.characters.count + 2,
                                            length: currency.characters.count))
        return priceMutableString
    }
    
    mutating func stringByRemovingRegexMatches(pattern: String, replaceWith: String = "*******") {
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
            let range = NSMakeRange(0, self.characters.count)
            self = regex.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: replaceWith)
        } catch {
            return
        }
    }
    
}


extension UIButton{
    func roundCorners(corners:UIRectCorner, radius: CGFloat){
        let borderLayer = CAShapeLayer()
        borderLayer.frame = self.layer.bounds
        borderLayer.strokeColor = UIColor.green.cgColor
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.lineWidth = 10.5
        let path = UIBezierPath(roundedRect: self.bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        borderLayer.path = path.cgPath
        self.layer.addSublayer(borderLayer)
    }
}


extension UITextField
{
    open override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = 15.0
        self.layer.borderWidth = 0.2
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.masksToBounds = true
        self.setLeftPadding1(padding:5,size:5)
    
    }
    
    /// set Withouticon with left padding of 8px
    func setLeftPadding1(padding:Int,size:Int) {
        
        
        let outerView = UIView(frame: CGRect(x: 0, y: 0, width: size+padding, height: size) )
        let iconView  = UIImageView(frame: CGRect(x: 9, y: 0, width: size, height: size))
        outerView.addSubview(iconView)
        
        leftView = outerView
        leftViewMode = .always
    }

}

func convertToDictionary(text: String) -> [String: Any]? {
    if let data = text.data(using: .utf8) {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            print(error.localizedDescription)
        }
    }
    return nil
}
