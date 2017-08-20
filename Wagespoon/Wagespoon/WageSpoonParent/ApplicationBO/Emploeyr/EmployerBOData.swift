//
//	EmployerBOData.swift
//
//	Create by Renta Mac on 16/8/2017
//	Copyright © 2017 RentaMac Ltd.. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class EmployerBOData : NSObject,Mappable, NSCoding{

	var erInfo : EmployerBOErInfo?
	var industryList : [EmployerBOIndustryList]?


	class func newInstance(map: Map) -> Mappable?{
		return EmployerBOData()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		erInfo <- map["er_info"]
		industryList <- map["industry_list"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         erInfo = aDecoder.decodeObject(forKey: "er_info") as? EmployerBOErInfo
         industryList = aDecoder.decodeObject(forKey: "industry_list") as? [EmployerBOIndustryList]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if erInfo != nil{
			aCoder.encode(erInfo, forKey: "er_info")
		}
		if industryList != nil{
			aCoder.encode(industryList, forKey: "industry_list")
		}

	}

}
