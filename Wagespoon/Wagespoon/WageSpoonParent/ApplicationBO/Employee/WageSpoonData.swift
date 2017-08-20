//
//	WageSpoonData.swift
//
//	Create by Renta Mac on 15/8/2017
//	Copyright © 2017 RentaMac Ltd.. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class WageSpoonData : NSObject,Mappable, NSCoding{

	var apearList : [WageSpoonApearList]?
	var certifiList : [WageSpoonCertifiList]?
	var eeInfo : WageSpoonEeInfo?
	var expList : [WageSpoonExpList]?
	var locList : [WageSpoonLocList]?
	var qualifiList : [WageSpoonQualifiList]?
	var skillsList : [WageSpoonSkillsList]?


	class func newInstance(map: Map) -> Mappable?{
		return WageSpoonData()
	}
	required init?(map: Map){}
	private  override init(){}

	func mapping(map: Map)
	{
		apearList <- map["apear_list"]
		certifiList <- map["certifi_list"]
		eeInfo <- map["ee_info"]
		expList <- map["exp_list"]
		locList <- map["loc_list"]
		qualifiList <- map["qualifi_list"]
		skillsList <- map["skills_list"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         apearList = aDecoder.decodeObject(forKey: "apear_list") as? [WageSpoonApearList]
         certifiList = aDecoder.decodeObject(forKey: "certifi_list") as? [WageSpoonCertifiList]
         eeInfo = aDecoder.decodeObject(forKey: "ee_info") as? WageSpoonEeInfo
         expList = aDecoder.decodeObject(forKey: "exp_list") as? [WageSpoonExpList]
         locList = aDecoder.decodeObject(forKey: "loc_list") as? [WageSpoonLocList]
         qualifiList = aDecoder.decodeObject(forKey: "qualifi_list") as? [WageSpoonQualifiList]
         skillsList = aDecoder.decodeObject(forKey: "skills_list") as? [WageSpoonSkillsList]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if apearList != nil{
			aCoder.encode(apearList, forKey: "apear_list")
		}
		if certifiList != nil{
			aCoder.encode(certifiList, forKey: "certifi_list")
		}
		if eeInfo != nil{
			aCoder.encode(eeInfo, forKey: "ee_info")
		}
		if expList != nil{
			aCoder.encode(expList, forKey: "exp_list")
		}
		if locList != nil{
			aCoder.encode(locList, forKey: "loc_list")
		}
		if qualifiList != nil{
			aCoder.encode(qualifiList, forKey: "qualifi_list")
		}
		if skillsList != nil{
			aCoder.encode(skillsList, forKey: "skills_list")
		}

	}

}
