//
//	WageSpoonLocList.swift
//
//	Create by Renta Mac on 15/8/2017
//	Copyright © 2017 RentaMac Ltd.. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class WageSpoonLocList : NSObject,Mappable, NSCoding{

	var prefLocationId : String?
	var prefLocationName : String?


	class func newInstance(map: Map) -> Mappable?{
		return WageSpoonLocList()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		prefLocationId <- map["pref_location_id"]
		prefLocationName <- map["pref_location_name"]
		
	}

    init(data: String) {
        
    }
    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         prefLocationId = aDecoder.decodeObject(forKey: "pref_location_id") as? String
         prefLocationName = aDecoder.decodeObject(forKey: "pref_location_name") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if prefLocationId != nil{
			aCoder.encode(prefLocationId, forKey: "pref_location_id")
		}
		if prefLocationName != nil{
			aCoder.encode(prefLocationName, forKey: "pref_location_name")
		}

	}

}
