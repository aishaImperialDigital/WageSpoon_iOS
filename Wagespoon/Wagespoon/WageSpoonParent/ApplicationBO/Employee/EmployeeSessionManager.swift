//
//  EmployeeSessionManager.swift
//  Wagespoon
//
//  Created by gqgnju on 16/08/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import Foundation

let employeeProfile = "EmployeeProfile"

class EmployeeSessionManager {
    var wageSpoon : WageSpoonBO?
    class var sharedInstance: EmployeeSessionManager {
        struct Static {
            static let instance = EmployeeSessionManager()
        }
        return Static.instance
    }
    
  private  init(){}
    
    class func getFilePath() -> String {
        //Get the store file path for the profile.

        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let url = NSURL(fileURLWithPath: (path?.absoluteString)!)
        let filePath = url.appendingPathComponent(employeeProfile)?.path
        if filePath != "" {
            return filePath!
        }
        else {
            print("no path")
            return ""
        }

    }
    
    func cacheUserProfileLocaliy(param: WageSpoonBO) {
        NSKeyedArchiver.archiveRootObject(param, toFile: EmployeeSessionManager.getFilePath())
    }

    func getCacheUserProfile() -> WageSpoonBO {
            self.wageSpoon = (NSKeyedUnarchiver.unarchiveObject(withFile: EmployeeSessionManager.getFilePath()) as! WageSpoonBO)
            return EmployeeSessionManager.sharedInstance.wageSpoon!
      }

}
