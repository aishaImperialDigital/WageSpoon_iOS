//
//	WageSpoonCertifiList.swift
//
//	Create by Renta Mac on 15/8/2017
//	Copyright © 2017 RentaMac Ltd.. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class WageSpoonCertifiList : NSObject,Mappable, NSCoding{

	var documentId : String?
	var documentName : String?
	var documentPic : String?


	class func newInstance(map: Map) -> Mappable?{
		return WageSpoonCertifiList()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		documentId <- map["document_id"]
		documentName <- map["document_name"]
		documentPic <- map["document_pic"]
		
	}

    init(data: String) {
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         documentId = aDecoder.decodeObject(forKey: "document_id") as? String
         documentName = aDecoder.decodeObject(forKey: "document_name") as? String
         documentPic = aDecoder.decodeObject(forKey: "document_pic") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if documentId != nil{
			aCoder.encode(documentId, forKey: "document_id")
		}
		if documentName != nil{
			aCoder.encode(documentName, forKey: "document_name")
		}
		if documentPic != nil{
			aCoder.encode(documentPic, forKey: "document_pic")
		}

	}

}
