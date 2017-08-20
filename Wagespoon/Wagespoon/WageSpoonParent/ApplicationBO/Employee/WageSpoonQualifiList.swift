//
//	WageSpoonQualifiList.swift
//
//	Create by Renta Mac on 15/8/2017
//	Copyright © 2017 RentaMac Ltd.. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class WageSpoonQualifiList : NSObject,Mappable, NSCoding{

	var qualificationFrom : String?
	var qualificationId : String?
	var qualificationName : String?
	var qualificationTo : String?


	class func newInstance(map: Map) -> Mappable?{
		return WageSpoonQualifiList()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		qualificationFrom <- map["qualification_from"]
		qualificationId <- map["qualification_id"]
		qualificationName <- map["qualification_name"]
		qualificationTo <- map["qualification_to"]
		
	}
    
    init(data: String) {
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         qualificationFrom = aDecoder.decodeObject(forKey: "qualification_from") as? String
         qualificationId = aDecoder.decodeObject(forKey: "qualification_id") as? String
         qualificationName = aDecoder.decodeObject(forKey: "qualification_name") as? String
         qualificationTo = aDecoder.decodeObject(forKey: "qualification_to") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if qualificationFrom != nil{
			aCoder.encode(qualificationFrom, forKey: "qualification_from")
		}
		if qualificationId != nil{
			aCoder.encode(qualificationId, forKey: "qualification_id")
		}
		if qualificationName != nil{
			aCoder.encode(qualificationName, forKey: "qualification_name")
		}
		if qualificationTo != nil{
			aCoder.encode(qualificationTo, forKey: "qualification_to")
		}

	}

}
