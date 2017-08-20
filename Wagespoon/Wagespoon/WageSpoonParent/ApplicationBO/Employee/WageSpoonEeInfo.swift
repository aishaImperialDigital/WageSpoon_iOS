//
//	WageSpoonEeInfo.swift
//
//	Create by Renta Mac on 15/8/2017
//	Copyright © 2017 RentaMac Ltd.. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class WageSpoonEeInfo : NSObject,Mappable, NSCoding{

	var descriptionField : String?
	var email : String?
	var fixedDateFrom : String?
	var fixedDateTo : String?
	var name : String?
	var partTimeFri : String?
	var partTimeFrom : String?
	var partTimeMon : String?
	var partTimeSat : String?
	var partTimeSun : String?
	var partTimeThu : String?
	var partTimeTo : String?
	var partTimeTue : String?
	var partTimeWed : String?
	var profilePic : String?
	var proximityFrom : String?
	var proximityId : String?
	var proximityTo : String?
	var timeAvailabilityId : String?
	var title : String?
	var userDislikes : String?
	var userId : String?
	var userLikes : String?
	var userType : String?
	var verifyChk : String?


	class func newInstance(map: Map) -> Mappable?{
		return WageSpoonEeInfo()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		descriptionField <- map["description"]
		email <- map["email"]
		fixedDateFrom <- map["fixed_date_from"]
		fixedDateTo <- map["fixed_date_to"]
		name <- map["name"]
		partTimeFri <- map["part_time_fri"]
		partTimeFrom <- map["part_time_from"]
		partTimeMon <- map["part_time_mon"]
		partTimeSat <- map["part_time_sat"]
		partTimeSun <- map["part_time_sun"]
		partTimeThu <- map["part_time_thu"]
		partTimeTo <- map["part_time_to"]
		partTimeTue <- map["part_time_tue"]
		partTimeWed <- map["part_time_wed"]
		profilePic <- map["profile_pic"]
		proximityFrom <- map["proximity_from"]
		proximityId <- map["proximity_id"]
		proximityTo <- map["proximity_to"]
		timeAvailabilityId <- map["time_availability_id"]
		title <- map["title"]
		userDislikes <- map["user_dislikes"]
		userId <- map["user_id"]
		userLikes <- map["user_likes"]
		userType <- map["user_type"]
		verifyChk <- map["verify_chk"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         descriptionField = aDecoder.decodeObject(forKey: "description") as? String
         email = aDecoder.decodeObject(forKey: "email") as? String
         fixedDateFrom = aDecoder.decodeObject(forKey: "fixed_date_from") as? String
         fixedDateTo = aDecoder.decodeObject(forKey: "fixed_date_to") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         partTimeFri = aDecoder.decodeObject(forKey: "part_time_fri") as? String
         partTimeFrom = aDecoder.decodeObject(forKey: "part_time_from") as? String
         partTimeMon = aDecoder.decodeObject(forKey: "part_time_mon") as? String
         partTimeSat = aDecoder.decodeObject(forKey: "part_time_sat") as? String
         partTimeSun = aDecoder.decodeObject(forKey: "part_time_sun") as? String
         partTimeThu = aDecoder.decodeObject(forKey: "part_time_thu") as? String
         partTimeTo = aDecoder.decodeObject(forKey: "part_time_to") as? String
         partTimeTue = aDecoder.decodeObject(forKey: "part_time_tue") as? String
         partTimeWed = aDecoder.decodeObject(forKey: "part_time_wed") as? String
         profilePic = aDecoder.decodeObject(forKey: "profile_pic") as? String
         proximityFrom = aDecoder.decodeObject(forKey: "proximity_from") as? String
         proximityId = aDecoder.decodeObject(forKey: "proximity_id") as? String
         proximityTo = aDecoder.decodeObject(forKey: "proximity_to") as? String
         timeAvailabilityId = aDecoder.decodeObject(forKey: "time_availability_id") as? String
         title = aDecoder.decodeObject(forKey: "title") as? String
         userDislikes = aDecoder.decodeObject(forKey: "user_dislikes") as? String
         userId = aDecoder.decodeObject(forKey: "user_id") as? String
         userLikes = aDecoder.decodeObject(forKey: "user_likes") as? String
         userType = aDecoder.decodeObject(forKey: "user_type") as? String
         verifyChk = aDecoder.decodeObject(forKey: "verify_chk") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if descriptionField != nil{
			aCoder.encode(descriptionField, forKey: "description")
		}
		if email != nil{
			aCoder.encode(email, forKey: "email")
		}
		if fixedDateFrom != nil{
			aCoder.encode(fixedDateFrom, forKey: "fixed_date_from")
		}
		if fixedDateTo != nil{
			aCoder.encode(fixedDateTo, forKey: "fixed_date_to")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if partTimeFri != nil{
			aCoder.encode(partTimeFri, forKey: "part_time_fri")
		}
		if partTimeFrom != nil{
			aCoder.encode(partTimeFrom, forKey: "part_time_from")
		}
		if partTimeMon != nil{
			aCoder.encode(partTimeMon, forKey: "part_time_mon")
		}
		if partTimeSat != nil{
			aCoder.encode(partTimeSat, forKey: "part_time_sat")
		}
		if partTimeSun != nil{
			aCoder.encode(partTimeSun, forKey: "part_time_sun")
		}
		if partTimeThu != nil{
			aCoder.encode(partTimeThu, forKey: "part_time_thu")
		}
		if partTimeTo != nil{
			aCoder.encode(partTimeTo, forKey: "part_time_to")
		}
		if partTimeTue != nil{
			aCoder.encode(partTimeTue, forKey: "part_time_tue")
		}
		if partTimeWed != nil{
			aCoder.encode(partTimeWed, forKey: "part_time_wed")
		}
		if profilePic != nil{
			aCoder.encode(profilePic, forKey: "profile_pic")
		}
		if proximityFrom != nil{
			aCoder.encode(proximityFrom, forKey: "proximity_from")
		}
		if proximityId != nil{
			aCoder.encode(proximityId, forKey: "proximity_id")
		}
		if proximityTo != nil{
			aCoder.encode(proximityTo, forKey: "proximity_to")
		}
		if timeAvailabilityId != nil{
			aCoder.encode(timeAvailabilityId, forKey: "time_availability_id")
		}
		if title != nil{
			aCoder.encode(title, forKey: "title")
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
		if verifyChk != nil{
			aCoder.encode(verifyChk, forKey: "verify_chk")
		}

	}

}
