//
//	WageSpoonExpList.swift
//
//	Create by Renta Mac on 15/8/2017
//	Copyright © 2017 RentaMac Ltd.. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class WageSpoonExpList : NSObject,Mappable, NSCoding{

	var expCompany : String?
	var expTitle : String?
	var experienceFrom : String?
	var experienceId : String?
	var experienceTo : String?
	var isCurrent : String?


	class func newInstance(map: Map) -> Mappable?{
		return WageSpoonExpList()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		expCompany <- map["exp_company"]
		expTitle <- map["exp_title"]
		experienceFrom <- map["experience_from"]
		experienceId <- map["experience_id"]
		experienceTo <- map["experience_to"]
		isCurrent <- map["is_current"]
		
	}

    init(data: String) {
        
    }
    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         expCompany = aDecoder.decodeObject(forKey: "exp_company") as? String
         expTitle = aDecoder.decodeObject(forKey: "exp_title") as? String
         experienceFrom = aDecoder.decodeObject(forKey: "experience_from") as? String
         experienceId = aDecoder.decodeObject(forKey: "experience_id") as? String
         experienceTo = aDecoder.decodeObject(forKey: "experience_to") as? String
         isCurrent = aDecoder.decodeObject(forKey: "is_current") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if expCompany != nil{
			aCoder.encode(expCompany, forKey: "exp_company")
		}
		if expTitle != nil{
			aCoder.encode(expTitle, forKey: "exp_title")
		}
		if experienceFrom != nil{
			aCoder.encode(experienceFrom, forKey: "experience_from")
		}
		if experienceId != nil{
			aCoder.encode(experienceId, forKey: "experience_id")
		}
		if experienceTo != nil{
			aCoder.encode(experienceTo, forKey: "experience_to")
		}
		if isCurrent != nil{
			aCoder.encode(isCurrent, forKey: "is_current")
		}

	}

}
