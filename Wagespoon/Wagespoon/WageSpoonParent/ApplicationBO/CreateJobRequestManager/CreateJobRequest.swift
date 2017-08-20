//
//  AppVersionRequest.swift
//  MOHRE Salama
//
//  Created by MOL MacBook on 3/5/17.
//  Copyright © 2017 MOL MacBook. All rights reserved.
//

import UIKit


class CreateJobRequest: WebServicesHandler {
    let kServiceURL = "/User/addJob"
    
    override init() {
        super.init()
        self.initWith(rootUrl: "\(liveUrl)\(kServiceURL)", andServiceUrl: nil)
    }
    
    func createAJob(_ entity: Any?)  {
        self.doServiceRequest(parameters: entity as! [String : Any], andRequestType: nil, andMethod: .post)
    }

}
