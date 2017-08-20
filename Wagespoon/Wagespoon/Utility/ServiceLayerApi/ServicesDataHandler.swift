//
//  ServicesDataHandler.swift
//  SwiftSerivcesLib
//
//  Created by MOL MacBook on 2/21/17.
//  Copyright © 2017 MOL MacBook. All rights reserved.
//

import UIKit


protocol  ServicesDataHandlerProtocol : class{
    func didGetEntity(_ entity:Any)
    func didGetEnity(_ enity:Any, withError error:ServicesError) -> Bool
    
}

class ServicesDataHandler: NSObject, WebServicesHandlerProtocol  {
     weak var delegate : ServicesDataHandlerProtocol?
    
    func getEntity(_ entity : Any?)  {
    }
    
    func saveEntity(_ entity:Any) {
        
    }
    func service(_ service: WebServicesHandler, didGetError error: ServicesError) -> Bool {
        return true
    }
    func service(_ service: WebServicesHandler, didGetData data: Any) {
        
    }
    

}
