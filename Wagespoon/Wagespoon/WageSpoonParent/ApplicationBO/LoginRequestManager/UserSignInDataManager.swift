//
//  AppVersionDataManager.swift

//
//  Created by MOL MacBook on 3/5/17.
//  Copyright © 2017 MOL MacBook. All rights reserved.
//

import UIKit
import ObjectMapper

class UserSignInDataManager: ServicesDataHandler {
    
    var webServices:UserSignInRequest?
    var entity : [String : Any]?
    
    override func getEntity(_ entity: Any?) {
        webServices?.cancel()
        webServices = UserSignInRequest()
        webServices!.delegate = self
        self.entity = entity as? [String : Any]
        webServices!.getSignIn(entity)
    }
    
    override func service(_ service: WebServicesHandler, didGetData data: Any) {
        
        let userType = self.entity?["user_type"] as! String
        if(userType == Constants.UserType.EMPLOYER)
        {
            let weather : EmployerBOWageSpoon! = Mapper<EmployerBOWageSpoon>().map(JSONObject: data)
            self.delegate?.didGetEntity(weather)
        }
        else
        {
            let weather : WageSpoonBO! = Mapper<WageSpoonBO>().map(JSONObject: data)
            self.delegate?.didGetEntity(weather)
        }
        
    }
    
    override func service(_ service: WebServicesHandler, didGetError error: ServicesError) -> Bool {
        
        return (self.delegate?.didGetEnity(service, withError: error))!
    }
    

}
