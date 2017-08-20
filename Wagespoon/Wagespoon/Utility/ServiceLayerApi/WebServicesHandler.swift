//
//  CoreWebServices.swift
//  SwiftSerivcesLib
//
//  Created by MOL MacBook on 2/20/17.
//  Copyright © 2017 MOL MacBook. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper


let kCharsetUTF8Value = "application/x-www-form-urlencoded"
let kContentTypeHeader  = "Content-Type"
let kContentLengthHeader = "Content-Length"
let kRequestParamInfo = "X-RequestParamInfo"
let kAcceptLanguage = "Accept-Language"
let kRequestTimeOut = "30"

extension String {
    
    /// Percent escapes values to be added to a URL query as specified in RFC 3986
    ///
    /// This percent-escapes all characters besides the alphanumeric character set and "-", ".", "_", and "~".
    ///
    /// http://www.ietf.org/rfc/rfc3986.txt
    ///
    /// :returns: Returns percent-escaped string.
    
    func addingPercentEncodingForURLQueryValue() -> String? {
        let allowedCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~")
        
        return self.addingPercentEncoding(withAllowedCharacters: allowedCharacters)
    }
    
}

extension Dictionary {
    
    /// Build string representation of HTTP parameter dictionary of keys and objects
    ///
    /// This percent escapes in compliance with RFC 3986
    ///
    /// http://www.ietf.org/rfc/rfc3986.txt
    ///
    /// :returns: String representation in the form of key1=value1&key2=value2 where the keys and values are percent escaped
    
    func stringFromHttpParameters() -> String {
        let parameterArray = self.map { (key, value) -> String in
            let percentEscapedKey = (key as! String).addingPercentEncodingForURLQueryValue()!
            let percentEscapedValue = (value as! String).addingPercentEncodingForURLQueryValue()!
            return "\(percentEscapedKey)=\(percentEscapedValue)"
        }
        
        return parameterArray.joined(separator: "&")
    }
}


class ServicesError: NSObject {
    var statusCode : Int?
    var errorMessage: NSString?
    
}

protocol  WebServicesHandlerProtocol : class{
    func service(_ service : WebServicesHandler, didGetData data: Any)
    func service(_ service: WebServicesHandler, didGetError error:ServicesError) -> Bool
}


public class WebServicesHandler: NSObject  {
    public var url : URL?
    private var request : URLRequest?
    private var currentAlamofireRequest : Request?
    weak var delegate : WebServicesHandlerProtocol?
    
    
    func initWith(rootUrl urlString:String , andServiceUrl serviceUrl:String?) {
        self.url = URL (string: urlString, relativeTo: nil)
    }
    
    func setServiceUrl(_ urlString : String)  {
         self.url = URL (string: urlString, relativeTo: nil)
    }
    
    
    
    
    public func doServiceRequest(parameters param : [String : Any],
                                 andRequestType requestType: String? ,
                                 andMethod method:HTTPMethod) {
        
        self.request = URLRequest(url: self.url!)
        self.request!.httpMethod = method.rawValue
        // self.setHttpHeader(withRequest: self.request!)
        self.request!.timeoutInterval = 30
        
       //let postString = "id=13&name=Jack"
       //request.httpBody = postString.data(using: .utf8)
       //let postString = (try? JSONSerialization.data(withJSONObject: param, options: [])) //"email=queen&password=1&user_type=0"
        
        let parameterString = param.stringFromHttpParameters()
        request?.httpBody =  parameterString.data(using: String.Encoding.utf8)
        currentAlamofireRequest =   Alamofire.request(request!)
            .validate().responseJSON { response in
                
                let errors  = response.result.error
                let statusCode = response.response?.statusCode
                if (errors != nil) {
                    let serviceError = ServicesError()
                    serviceError.statusCode = statusCode
                    let errorhandler : Bool = (self.delegate?.service(self, didGetError: serviceError))!
                    if errorhandler == false {
                        NotificationCenter.default.post(name :Notification.Name("kCommonUnableToAccessServices"), object:nil)
                    }
                    
                }else {
                    let responseDatas = response.result.value
                    print("Response-- > \(responseDatas)")
                    self.delegate?.service(self, didGetData: responseDatas as Any)
                }
        }
    }
    
    private func setHttpHeader(withRequest requestParam: URLRequest){
        var requestParam = requestParam
        requestParam.addValue("application/json", forHTTPHeaderField: "Content-Type")
        requestParam.addValue("application/json", forHTTPHeaderField: "Accept")
        requestParam.addValue("\(UserInfo.getPersonInfo())", forHTTPHeaderField: kRequestParamInfo)
        
    }
    
    public func cancel()  {
        self.currentAlamofireRequest!.cancel()
    }
    
}






