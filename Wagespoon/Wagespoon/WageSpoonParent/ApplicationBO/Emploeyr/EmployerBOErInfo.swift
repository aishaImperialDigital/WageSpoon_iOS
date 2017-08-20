//
//	EmployerBOErInfo.swift
//
//	Create by Renta Mac on 16/8/2017
//	Copyright © 2017 RentaMac Ltd.. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class EmployerBOErInfo : NSObject,Mappable, NSCoding{

	var companyId : Int?
	var descriptionField : String?
	var establish : String?
	var gst : String?
	var name : String?
	var profilePic : String?
	var userDislikes : String?
	var userId : String?
	var userLikes : String?
	var userType : Int?


	class func newInstance(map: Map) -> Mappable?{
		return EmployerBOErInfo()
	}
	required init?(map: Map){}
	private  override init(){}

	func mapping(map: Map)
	{
		companyId <- map["company_id"]
		descriptionField <- map["description"]
		establish <- map["establish"]
		gst <- map["gst"]
		name <- map["name"]
		profilePic <- map["profile_pic"]
		userDislikes <- map["user_dislikes"]
		userId <- map["user_id"]
		userLikes <- map["user_likes"]
		userType <- map["user_type"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         companyId = aDecoder.decodeObject(forKey: "company_id") as? Int
         descriptionField = aDecoder.decodeObject(forKey: "description") as? String
         establish = aDecoder.decodeObject(forKey: "establish") as? String
         gst = aDecoder.decodeObject(forKey: "gst") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         profilePic = aDecoder.decodeObject(forKey: "profile_pic") as? String
         userDislikes = aDecoder.decodeObject(forKey: "user_dislikes") as? String
         userId = aDecoder.decodeObject(forKey: "user_id") as? String
         userLikes = aDecoder.decodeObject(forKey: "user_likes") as? String
         userType = aDecoder.decodeObject(forKey: "user_type") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if companyId != nil{
			aCoder.encode(companyId, forKey: "company_id")
		}
		if descriptionField != nil{
			aCoder.encode(descriptionField, forKey: "description")
		}
		if establish != nil{
			aCoder.encode(establish, forKey: "establish")
		}
		if gst != nil{
			aCoder.encode(gst, forKey: "gst")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if profilePic != nil{
			aCoder.encode(profilePic, forKey: "profile_pic")
		}
		if userDislikes != nil{
			aCoder.encode(userDislikes, forKey: "user_dislikes")
		}
		if userId != nil{
			aCoder.encode(userId, forKey: "user_id")
		}
		if userLikes != nil{
			aCoder.encode(userLikes, forKey: "user_likes")
		}
		if userType != nil{
			aCoder.encode(userType, forKey: "user_type")
		}

	}

}
