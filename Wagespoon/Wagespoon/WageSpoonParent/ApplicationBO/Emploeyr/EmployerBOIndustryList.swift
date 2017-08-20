//
//	EmployerBOIndustryList.swift
//
//	Create by Renta Mac on 16/8/2017
//	Copyright © 2017 RentaMac Ltd.. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class EmployerBOIndustryList : NSObject,Mappable, NSCoding{

	var industryId : String?
	var industryName : String?


	class func newInstance(map: Map) -> Mappable?{
		return EmployerBOIndustryList()
	}
	required init?(map: Map){}
	private  override init(){}

	func mapping(map: Map)
	{
		industryId <- map["industry_id"]
		industryName <- map["industry_name"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         industryId = aDecoder.decodeObject(forKey: "industry_id") as? String
         industryName = aDecoder.decodeObject(forKey: "industry_name") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if industryId != nil{
			aCoder.encode(industryId, forKey: "industry_id")
		}
		if industryName != nil{
			aCoder.encode(industryName, forKey: "industry_name")
		}

	}

}
