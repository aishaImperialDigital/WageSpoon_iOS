//
//	WageSpoonBO.swift
//
//	Create by Renta Mac on 15/8/2017
//	Copyright © 2017 RentaMac Ltd.. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class WageSpoonBO : NSObject,Mappable, NSCoding{

	var data : WageSpoonData?
	var errorcode : Int?
	var errormsg : String?


	class func newInstance(map: Map) -> Mappable?{
		return WageSpoonBO()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		data <- map["data"]
		errorcode <- map["errorcode"]
		errormsg <- map["errormsg"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         data = aDecoder.decodeObject(forKey: "data") as? WageSpoonData
         errorcode = aDecoder.decodeObject(forKey: "errorcode") as? Int
         errormsg = aDecoder.decodeObject(forKey: "errormsg") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if data != nil{
			aCoder.encode(data, forKey: "data")
		}
		if errorcode != nil{
			aCoder.encode(errorcode, forKey: "errorcode")
		}
		if errormsg != nil{
			aCoder.encode(errormsg, forKey: "errormsg")
		}

	}

}
