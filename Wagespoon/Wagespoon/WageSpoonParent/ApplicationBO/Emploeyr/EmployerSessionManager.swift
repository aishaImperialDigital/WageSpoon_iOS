//
//  EmployerSessionManager.swift
//  Wagespoon
//
//  Created by gqgnju on 16/08/17.
//  Copyright © 2017 Developer. All rights reserved.
//


import Foundation


let employerProfile = "EmployerProfile"

class EmployerSessionManager {
    var employerBOWageSpoon : EmployerBOWageSpoon?
    class var sharedInstance: EmployerSessionManager {
        struct Static {
            static let instance = EmployerSessionManager()
        }
        return Static.instance
    }
    
    private  init(){}
    
    class func getFilePath() -> String {
        //Get the store file path for the profile.
        
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let url = NSURL(fileURLWithPath: (path?.absoluteString)!)
        let filePath = url.appendingPathComponent(employerProfile)?.path
        if filePath != "" {
            return filePath!
        }
        else {
            print("no path")
            return ""
        }
        
    }
    
    func cacheUserProfileLocaliy(param: EmployerBOWageSpoon) {
        NSKeyedArchiver.archiveRootObject(param, toFile: EmployerSessionManager.getFilePath())
    }
    
    func getCacheUserProfile() -> EmployerBOWageSpoon {
        self.employerBOWageSpoon = (NSKeyedUnarchiver.unarchiveObject(withFile: EmployerSessionManager.getFilePath()) as! EmployerBOWageSpoon)
        return EmployerSessionManager.sharedInstance.employerBOWageSpoon!
    }
    
}
