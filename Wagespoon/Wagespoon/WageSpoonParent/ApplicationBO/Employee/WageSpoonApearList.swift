//
//	WageSpoonApearList.swift
//
//	Create by Renta Mac on 15/8/2017
//	Copyright © 2017 RentaMac Ltd.. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class WageSpoonApearList :NSObject,Mappable, NSCoding{

    var apearence_id : String?
    var apearence_name : String?
    var apearence_pic : String?
   
    
    
	class func newInstance(map: Map) -> Mappable?{
		return WageSpoonApearList()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
        apearence_id <- map["apearence_id"]
        apearence_name <- map["apearence_name"]
        apearence_pic <- map["apearence_pic"]
	}
    
    init(data: String) {
        
    }
    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
        apearence_id = aDecoder.decodeObject(forKey: "apearence_id") as? String
        apearence_name = aDecoder.decodeObject(forKey: "apearence_name") as? String
        apearence_pic = aDecoder.decodeObject(forKey: "apearence_pic") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
        if apearence_id != nil{
            aCoder.encode(apearence_id, forKey: "apearence_id")
        }
        if apearence_name != nil{
            aCoder.encode(apearence_name, forKey: "apearence_name")
        }
        if apearence_pic != nil{
            aCoder.encode(apearence_pic, forKey: "apearence_pic")
        }

	}

}
