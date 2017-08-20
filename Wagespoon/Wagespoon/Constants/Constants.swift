//
//  Constants.swift
//  Wagespoon
//
//  Created by Ravi on 18/06/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import Foundation
import UIKit

//MARK: Hosting URLs
let liveUrl = "http://52.62.90.111/index.php"
let testingUrl = ""


class Constants: NSObject {

    //WARNING: To run this sample correctly, you must set the following constants.

    
        struct HTTP {
            static let HOST = "http://52.62.90.111/index.php/"
            static let RegisterUrl = "User/findUserSignUp"
            static let SignInUrl = "User/findUserSignIn"
            static let FindUserUrl = "User/findTargetDetail"
            static let UpdateTimeAvailabilityUrl = "User/modEEAvail"
            static let UpdateQualificationUrl = "User/modEEQualifi"
            static let UpdateSkills = "User/modEESkills"
            static let UpdateUserUrl = "User/modUser"
        }
  
    
    
    static let CkCalendarViewTag = 142341
    static let  appDelegate = UIApplication.shared.delegate as! AppDelegate

    static let chartAxisFontSize  = 7

    // s3 amazon static url
    static let amazonPath = "https://s3.amazonaws.com/TeamSportsdevelopment/userImages/"

    // Mark:- String Constants
    static let personDefaultPic = "user_defaultImage"

    // MARK:- Date Formats
    static let DateTime12HoursFormatwithAMPM = "d MMM yyyy hh:mm:ss a"
    static let DateTimeFormatwithAMPM = "d MMM yyyy HH:mm:ss a"
    static let DateFormatwithAMPM = "d MMM yyyy"
    static let TimeFormat = "HH:mm a"
    static let DateTimeHiphenFormat = "yyyy-MM-dd HH:mm:ss a"
    static let DateHiphenFormat = "yyyy-MM-dd"
    static let DateHiphenFormatMMddYYYY = "MM-dd-YYYY"
    static let DateTimeSlashFormat = "MM/dd/yyyy HH:mm:ss a"
    static let DateSlashFormat = "MM/dd/yyyy"

    //MARK:- Color Constants
    static let APP_THEME_COLOR:UIColor = UIColor(red: 29/255.0, green: 179/255.0, blue: 233/255.0, alpha: 1.0)
    static let myProfileButtonBlueColor:UIColor = UIColor(red: 36, green: 156, blue: 190, alpha: 1.0)
    static let APP_CLEAR_COLOR:UIColor = UIColor.clear

    //MARK:- StoryBoard Constants
    static let mainStoryBoard = "Main"
    static let employeeStoryBoard = "Employee"
    static let employerStoryBoard = "Employer"
    static let settingsStoryBoard = "Settings"
    static let messagesStoryBoard = "Messages"
 

    //MARK:- thumbnail added URl
    static let thumbnailAddedUrl = "_100x100"

    //MARK:- thumbnail added URl
    static let refreshUrl = "-+-"

    //MARK:- Device Type Constants
    struct ScreenSize
    {
        static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
        static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
        static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
        static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    }

    struct DeviceType
    {
        static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
        static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
        static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
        static let IS_IPHONE_6P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
        static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
        static let IS_IPAD_PRO              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1366.0
    }

    //MARK:- iOS Versions Constants
    struct Version{
        static let SYS_VERSION_FLOAT = (UIDevice.current.systemVersion as NSString).floatValue
        static let iOS7 = (Version.SYS_VERSION_FLOAT < 8.0 && Version.SYS_VERSION_FLOAT >= 7.0)
        static let iOS8 = (Version.SYS_VERSION_FLOAT >= 8.0 && Version.SYS_VERSION_FLOAT < 9.0)
        static let iOS9 = (Version.SYS_VERSION_FLOAT >= 9.0 && Version.SYS_VERSION_FLOAT < 10.0)
    }

    
    struct UserType {
        static let EMPLOYEE = "0"
        static let EMPLOYER = "1"
    }
   
    struct ProfileFields{
        static let AboutMe = 0
        static let TimeAvailability =  1
        static let Proximity =  2
        static let Skills = 3
        static let Experience = 4
        static let Qualification = 5
        static let PreferedLocation = 6
        static let Appearance = 7
        static let CertificatonsDocuments = 8
        static let Accreditation = 9
    }
    
    static var isEmployee:Bool = false
    static var isEmployer:Bool = false

}
