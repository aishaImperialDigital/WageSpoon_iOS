//
//  Utility.swift
//  Wagespoon
//
//  Created by Ravi on 17/06/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import Foundation

import Foundation
import UIKit
import SystemConfiguration

let debubPrintLog:Int = 1
var numberFormatter: NumberFormatter!

class Utility: NSObject
{

    //MARK: - Check For Empty String

    class func checkIfStringContainsText(string:String?) -> Bool
    {
        if let stringEmpty = string {
            let newString = stringEmpty.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            if(newString.isEmpty){
                return false
            }
            return true
        } else {
            return false
        }
    }

    //MARK: - Get value from dictionary

    //MARK: - Get Methods
    //Get value from dictionary
    class func getObjectForKey(key:String!,dictResponse:NSDictionary!) -> AnyObject! {
        if key != nil{
            if let dict = dictResponse {
                if let value: AnyObject = dict.value(forKey: key) as AnyObject? {
                    if let _:NSNull = value as? NSNull{
                        return "" as AnyObject!
                    }else{
                        if let valueString = value as? String{
                            if valueString == "<null>"{
                                return "" as AnyObject!
                            }
                        }
                        return value
                    }
                } else {return "" as AnyObject!}
            } else {return "" as AnyObject!}
        } else {return "" as AnyObject!}
    }

    class func getObjectForKeyNumber(key:String!,dictResponse:NSDictionary!) -> NSNumber! {
        if key != nil{
            if let dict = dictResponse {
                if let value: AnyObject = dict.value(forKey: key) as AnyObject? {
                    if let _:NSNull = value as? NSNull{
                        return 0
                    }else{
                        if let valueString = value as? String{
                            if valueString == "<null>"{
                                return 0
                            }
                        }
                        return value as! NSNumber
                    }
                } else {return 0}
            } else {return 0}
        } else {return 0}
    }

    class func getObjectForKeyInt(key:String!,dictResponse:NSDictionary!) -> Int! {
        if key != nil{
            if let dict = dictResponse {
                if let value: AnyObject = dict.value(forKey: key) as AnyObject? {
                    if let _:NSNull = value as? NSNull{
                        return 0
                    }else{
                        if let valueString = value as? String{
                            if valueString == "<null>"{
                                return 0
                            }
                        }
                        return value as! Int
                    }
                } else {return 0}
            } else {return 0}
        } else {return 0}
    }


    //MARK: - Get value from user defaults
    class func getUniqueIdentifier()-> String {
        return  (UIDevice.current.identifierForVendor?.uuidString)!
    }


    //MARK: - Get value from user defaults
    class func getValueFromUserDefaultsForKey(keyName:String!) -> AnyObject? {
        if !Utility.checkIfStringContainsText(string: keyName) {
            return nil
        }
        let value: AnyObject? = UserDefaults.standard.object(forKey: keyName) as AnyObject?
        if value != nil {
            return value
        } else {
            return nil
        }
    }
    //MARK: - Set value to user defaults

    class func setValueToUserDefaultsForKey(keyName:String!, value:AnyObject!) {

        if !Utility.checkIfStringContainsText(string: keyName) {
            return
        }
        if  value == nil {
            return
        }
        UserDefaults.standard.set(value, forKey: keyName)
        UserDefaults.standard.synchronize()
    }

    //MARK: - NSNotificationCenter methods
    class func addObserverToNSNotificationCenterForNameKey(observer: AnyObject, selector: Selector, name: String?, object: AnyObject?) {

        if !Utility.checkIfStringContainsText(string: name) {
            return
        }

        NotificationCenter.default.addObserver(observer, selector: selector, name: name.map { NSNotification.Name(rawValue: $0) },object: object)

    }


    //Remove Observer frpm NSNotificationCenter defaultCenter
    class func removeObserverFromNSNotificationCenterForNameKey(observer: AnyObject, name: String?,object: AnyObject?) {

        NotificationCenter.default.removeObserver(observer, name: name.map { NSNotification.Name(rawValue: $0) }, object: object)

    }

    //MARK: - Check URL validation

    class func validateURL(url:String) -> Bool
    {
        let urlRegex:String = "^(?:(?:https?|ftp)://)(?:\\S+(?::\\S*)?@)?(?:(?!(?:10|127)(?:\\.\\d{1,3}){3})(?!(?:169\\.254|192\\.168)(?:\\.\\d{1,3}){2})(?!172\\.(?:1[6-9]|2\\d|3[0-1])(?:\\.\\d{1,3}){2})(?:[1-9]\\d?|1\\d\\d|2[01]\\d|22[0-3])(?:\\.(?:1?\\d{1,2}|2[0-4]\\d|25[0-5])){2}(?:\\.(?:[1-9]\\d?|1\\d\\d|2[0-4]\\d|25[0-4]))|(?:(?:[a-z\\u00a1-\\uffff0-9]-*)*[a-z\\u00a1-\\uffff0-9]+)(?:\\.(?:[a-z\\u00a1-\\uffff0-9]-*)*[a-z\\u00a1-\\uffff0-9]+)*(?:\\.(?:[a-z\\u00a1-\\uffff]{2,}))\\.?)(?::\\d{2,5})?(?:[/?#]\\S*)?$";

        let predicateForURL:NSPredicate = NSPredicate(format: "SELF MATCHES %@",urlRegex)

        if predicateForURL.evaluate(with: url) {
            return true
        } else if predicateForURL.evaluate(with: "http://\(url)") {
            return true
        } else {
            return false
        }
    }

    //MARK: - Check Number validation

    class func validateNumber(emailStr:String) -> Bool
    {
        let numberRegex:String = "[\\p{N}\\p{Lo}}]+"
        let predicateForNumber:NSPredicate = NSPredicate(format: "SELF MATCHES %@",numberRegex)
        return predicateForNumber.evaluate(with: emailStr);
    }


    //MARK: - Check Email validation

    class func validateEmail(emailStr:String) -> Bool
    {
        let emailRegex:String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        //"^[_\\p{L}\\p{Mark}0-9-]+(\\.[_\\p{L}\\p{Mark}0-9-]+)*@[\\p{L}\\p{Mark}0-9-]+(\\.[\\p{L}\\p{Mark}0-9]+)*(\\.[\\p{L}\\p{Mark}]{2,})$"
        let predicateForEmail:NSPredicate = NSPredicate(format: "SELF MATCHES %@",emailRegex)
        return predicateForEmail.evaluate(with: emailStr);
    }

    //MARK: - Check Email validation



    //MARK: - Check password validation

    class func validatePassword(passwordStr:String) -> Bool
    {
        let passwordRegex:String = "^(?=.*[0-9]).{8,}$"
        let predicateForPassword:NSPredicate = NSPredicate(format: "SELF MATCHES %@",passwordRegex)
        return predicateForPassword.evaluate(with: passwordStr);
    }

    //MARK: - Calculate Password Strength

    /**
     * The strength method implements the Truong3 Password Strength Algorithm, which
     * determines if the password contains:
     * . at least 6 characters
     * . at least one upper and one lower case Latin alphabet character
     * . at least one numerical character
     * . at least one special character
     */



    class func isCapital(letter:UInt32) -> Bool {
        return letter >= 65 && letter < 91
    }

    class func isLatinCharacter(letter:UInt32) -> Bool {
        return letter >= 32 && letter < 127
    }



    // MARK: - Show DebubLogs Methods
    /*
     1.    set value 1 to debubPrintLog to Enable the debuging logs
     2.    set value 0 to debubPrintLog to Disable the debuging logs
     3.    debubPrintLog is a Global variable
     */

    class func DBlog(message:AnyObject) {
        if debubPrintLog == 1{
            print(message)
        }
        else{

        }

    }

    /*
     __FILE__, __FUNCTION__, __LINE__ and __COLUMN__
     “macros” as default function parameter values in Swift the value is set to the file,
     function etc of the caller rather than the details of the called functions location.

     */
    class func DLog(message: String, file: String = #function, function: String = #file, line: Int = #line, column: Int = #column) {

        #if DEBUG
            print("\(file) : \(function) : \(line) : \(column) - \(message)")
        #endif

    }

    // Used to fetch current controller
    class func currentVisibleController() -> UIViewController
    {
        let navigationController:UINavigationController = Constants.appDelegate.window?.rootViewController as! UINavigationController
        return navigationController.visibleViewController!
    }

    // Used to fetch the controller via StoryBoard
    class func fetchViewControllerWithName(vcName:String, storyBoardName:String) -> UIViewController
    {
        let storyboard = UIStoryboard(name: storyBoardName, bundle: nil)
        let controller:UIViewController = storyboard.instantiateViewController(withIdentifier: vcName)
        return controller
    }

    class func randomFloat(min: Double, max:Double) -> Double {
        return min + Double(arc4random_uniform(UInt32(max - min + 1)))
    }

    // Validate the Array of TextFields
    class func validateTextCountWithAlert(arrayOFTextCount:NSArray,arrayOFAlertText:NSArray) -> Bool
    {

        var i:Int = 0
        for element in arrayOFTextCount{
            if let textField:String = element as? String{
                if textField.characters.count == 0{
                    return false
                }
            }
            i += 1
        }
        return true
    }

    // Validate the Array of TextFields
    class func validateTextFieldArray(arrayOFKeys:NSArray,arrayOFFields:NSArray) -> Bool
    {
        if arrayOFFields.count == arrayOFKeys.count
        {
            var i:Int = 0
            for element in arrayOFFields{
                if let textField:UITextField = element as? UITextField{
                    if textField.text?.characters.count == 0{
                        return false
                    }
                }
                i += 1
            }
            return true
        }
        print("validation arrayOfFields is not equal to arrayOfKeys")
        return false
    }

    class func getJsonData(dicParam:NSMutableArray) -> NSString {
        let data = try! JSONSerialization.data(withJSONObject: dicParam, options:JSONSerialization.WritingOptions.prettyPrinted)
        let datad = NSString.init(data: data, encoding: String.Encoding.utf8.rawValue)
        return datad!
    }


    // Validate the Array of TextFields
    class func textFieldValidateWithHighLightPlaceHolder(arrayOFKeys:NSArray,arrayOFFields:NSArray) -> Bool
    {
        if arrayOFFields.count == arrayOFKeys.count
        {
            var status:Bool = true
            var i:Int = 0
            for element in arrayOFFields{
                if let textField:UITextField = element as? UITextField{
                    if textField.text?.characters.count == 0{
                        textField.attributedPlaceholder = NSAttributedString(string:arrayOFKeys.object(at: i) as! String,
                                                                             attributes:[NSForegroundColorAttributeName: UIColor.white])
                        status =  false
                    }
                }
                i += 1
            }
            return status
        }
        print("validation arrayOfFields is not equal to arrayOfKeys")
        return false
    }

    // Show JSON
    class func showJsonData(dicParam:NSDictionary){
        let data = try! JSONSerialization.data(withJSONObject: dicParam, options:JSONSerialization.WritingOptions.prettyPrinted)
        let dataParsed = NSString.init(data: data, encoding: String.Encoding.utf8.rawValue)
        print(dataParsed ?? "")
    }

    // get heught for label
    class func heightForLabel(label1 :UILabel , padding: Int, isAttributed:Bool) -> CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width - CGFloat( padding), height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = label1.lineBreakMode
        label.font = label1.font
        if(isAttributed == true) {
            label.attributedText = label1.attributedText
        } else {
            label.text = label1.text
        }
        label.sizeToFit()

        return label.frame.height

    }

    // get Width for label
    class func widthForLabel(yourLabel :UILabel) -> CGFloat {
        let labelTextWidth = yourLabel.intrinsicContentSize.width
        return labelTextWidth

    }

    class func removeSpecialCharsFromString(text: String) -> String {
        let okayChars : Set<Character> =
            Set("+1234567890".characters)
        return String(text.characters.filter {okayChars.contains($0) })
    }


    class func scaleUIImageToSize( image: UIImage, size: CGSize) -> UIImage {
        let hasAlpha = false
        let scale: CGFloat = 0.0 // Automatically use scale factor of main screen

        UIGraphicsBeginImageContextWithOptions(size, !hasAlpha, scale)
        image.draw(in: CGRect(origin: CGPoint.zero, size: size))

        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return scaledImage!
    }

    //Convert from data to JSON
    class func dataToJSON(data: Data) -> Any? {
        do {
            return try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
        } catch let myJSONError {
            print(myJSONError)
        }
        return nil
    }

    //Convert from JSON to data
    class func jsonToData(json: Any) -> Data? {
        do {
            return try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
        } catch let myJSONError {
            print(myJSONError)
        }
        return nil;
    }

    //Check Error key in Dictionary
    class func checkErrorKey(dictionary:NSDictionary) -> Bool?{
        let keys = Array(dictionary.allKeys)
        // print(keys)

        if keys.contains(obj: "error"){
            return true
        }else{
            return false
        }
    }

    //Check Error key in Array of Dictionary
    class func checkErrorKeyFrom(array:NSArray) -> Bool?{

        let dict  = array[0] as! NSDictionary
        let keys = Array(dict.allKeys)
        // print(keys)

        if keys.contains(obj: "error"){
            return true
        }else{
            return false
        }
    }

    class func decodeTimeStampToTime(timeStamp: String?) -> String {

        guard timeStamp != nil else {
            return ""
        }

        if timeStamp?.characters.count == 0 {
            return ""
        }
        if timeStamp?.compare("<null>") == ComparisonResult.orderedSame {
            return ""
        }

        var timeComponent = ""
        if (timeStamp?.components(separatedBy: "T").count)! > 1 {
            timeComponent = (timeStamp?.components(separatedBy: "T")[1])!
        }
        timeComponent = timeComponent.components(separatedBy: "-")[0]

        let hourComponent = Int((timeComponent.components(separatedBy: ":")[0]))

        var minuteComponent = 0
        if (timeComponent.components(separatedBy: ":").count) > 1 {
            minuteComponent = Int((timeComponent.components(separatedBy: ":")[1]))!
        }

        let hr = "\(Int((hourComponent)! > 12 ? (hourComponent)! - 12 : (hourComponent)!))"
        var min = "\(Int(minuteComponent))"
        let pm = "PM"
        let am = "AM"
        let aa =  "\(hourComponent! > 11 ? pm : am )"

        if min.characters.count > 1{

        }else{

            min = "0\(Int(minuteComponent))"
        }


        timeComponent =  "\(hr):\(min) \(aa) "
        return "\(timeComponent)"

    }

    class func decodeTimeStampToDateTime(timeStamp: String) -> String {
        var dateStampString = Utility.decodeTimeStampToDate(toDate: timeStamp)
        if dateStampString.characters.count > 0 {
            return "\(dateStampString) at \(Utility.decodeTimeStampToTime(timeStamp: timeStamp))"
        }
        else {
            return "-"
        }

    }

    class func decodeTimeStampToDate(timeStamp: String) -> String {
        var dateStampString = Utility.decodeTimeStampToDate(toDate: timeStamp)
        if dateStampString.characters.count > 0 {
            return "\(dateStampString)"
        }
        else {
            return "-"
        }

    }





    class func decodeTimeStampToDate(toDate timeStamp: String?) -> String {

        guard timeStamp != nil else {
            return ""
        }

        if timeStamp?.characters.count == 0 {
            return ""
        }
        if timeStamp?.compare("<null>") == ComparisonResult.orderedSame {
            return ""
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM, YYYY"

        var dateComponent = timeStamp?.components(separatedBy: "T")[0]
        let formatter = dateFormatter
        var dateComps = dateComponent?.components(separatedBy: "-")
        let calendar = NSCalendar.current
        let components = NSDateComponents()
        let day = dateComps?[2]
        let month = dateComps?[1]
        let year = dateComps?[0]
        components.day = Int(day!)!
        components.month = Int(month!)!
        components.year = Int(year!)!

        var componentsToday = calendar.dateComponents([.weekOfYear, .hour,.month,.day,.year], from: Date())
        let dayToday = componentsToday.day
        let monthToday = componentsToday.month
        let yearToday = componentsToday.year

        if Int(day!)! == dayToday! && Int(month!)! == monthToday! && Int(year!)! == yearToday! {
            return "Today"
        }
        let dateDelivery = calendar.date(from: components as DateComponents)
        formatter.dateFormat = "dd MMM, YYYY"
        dateComponent = formatter.string(from: dateDelivery!)

        return dateComponent!
    }


    class func attributedString(text:String, font:UIFont, color:UIColor,initialLength:Int,stringRangeLength:Int ) -> NSAttributedString{
        // create attributed string
        let myAttribute = [ NSFontAttributeName: font ,NSForegroundColorAttributeName: color ]
        let myString:NSMutableAttributedString!
        myString = NSMutableAttributedString(string: text, attributes: myAttribute )

        let myRange = NSRange(location: initialLength, length: stringRangeLength)
        myString.addAttribute(NSForegroundColorAttributeName, value: UIColor.black, range: myRange)
        return myString
    }
    
  


}

