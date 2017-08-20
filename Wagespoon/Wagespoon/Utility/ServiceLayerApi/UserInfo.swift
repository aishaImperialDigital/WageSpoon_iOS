//
//  UserInfo.swift
//  SwiftSerivcesLib
//
//  Created by MOL MacBook on 2/20/17.
//  Copyright © 2017 MOL MacBook. All rights reserved.
//

import Foundation

class UserInfo {

    static func getPersonInfo() -> String{
        let parameter = ["Password" : "Password","sdds": "sd" ] as Dictionary <String, String>
        var jsonString : String = ""
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: parameter, options: .init(rawValue: 0))
            jsonString = String(data: jsonData, encoding: String.Encoding.utf8)! as String
        } catch {
            print(error.localizedDescription)
        }
        return jsonString
    }
}
