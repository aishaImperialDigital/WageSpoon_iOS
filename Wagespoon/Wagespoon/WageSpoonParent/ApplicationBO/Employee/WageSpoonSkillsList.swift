//
//	WageSpoonSkillsList.swift
//
//	Create by Renta Mac on 15/8/2017
//	Copyright © 2017 RentaMac Ltd.. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class WageSpoonSkillsList : NSObject,Mappable, NSCoding{

	var skillsId : String?
	var skillsName : String?


	class func newInstance(map: Map) -> Mappable?{
		return WageSpoonSkillsList()
	}
	required init?(map: Map){}
	private override init(){}
    
    

	func mapping(map: Map)
	{
		skillsId <- map["skills_id"]
		skillsName <- map["skills_name"]
		
	}
    
    init(data: String) {
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         skillsId = aDecoder.decodeObject(forKey: "skills_id") as? String
         skillsName = aDecoder.decodeObject(forKey: "skills_name") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if skillsId != nil{
			aCoder.encode(skillsId, forKey: "skills_id")
		}
		if skillsName != nil{
			aCoder.encode(skillsName, forKey: "skills_name")
		}

	}

}
