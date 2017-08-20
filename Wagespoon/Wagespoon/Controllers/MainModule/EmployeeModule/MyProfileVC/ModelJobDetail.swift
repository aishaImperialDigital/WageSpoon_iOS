//
//  ModelJobDetail.swift
//  Entisy
//
//  Created by gqgnju on 29/03/17.
//  Copyright © 2017 co.nz.imperialdigital. All rights reserved.
//

import Foundation


public final class ModelJobDetail: NSObject {
    
    private struct SerializationKeys {
        static let budget = "budget"
        static let startTime = "start_time"
        static let publishTime = "publish_time"
        static let image1 = "image1"
        static let categoryType = "category_type"
        static let descriptionValue = "description"
        static let image2 = "image2"
        static let latitude = "latitude"
        static let status = "status"
        static let location = "location"
        static let image3 = "image3"
        static let isDeleted = "is_deleted"
        static let currency = "currency"
        static let endTime = "end_time"
        static let jobid = "jobid"
        static let finalPrice = "final_price"
        static let title = "title"
        static let userid = "userid"
        static let categoryName = "category_name"
        static let longitude = "longitude"
    }
    
    // MARK: Properties
    public var budget: String?
    public var startTime: String?
    public var publishTime: String?
    public var image1: String?
    public var categoryType: String?
    public var descriptionValue: String?
    public var image2: String?
    public var latitude: String?
    public var status: String?
    public var location: String?
    public var image3: String?
    public var isDeleted: String?
    public var currency: String?
    public var endTime: String?
    public var jobid: String?
    public var finalPrice: String?
    public var title: String?
    public var userid: String?
    public var categoryName: String?
    public var longitude: String?
    
    
    func setInfo(item: Any) {
        if let JSON = (item as AnyObject) as? Dictionary<String, AnyObject> {
            
            budget = (JSON[SerializationKeys.budget] as! String)
            startTime = (JSON[SerializationKeys.startTime] as! String)
            publishTime = (JSON[SerializationKeys.publishTime] as! String)
            categoryType = (JSON[SerializationKeys.categoryType] as! String)
            descriptionValue = (JSON[SerializationKeys.descriptionValue] as! String)
            latitude = (JSON[SerializationKeys.latitude] as! String)
            status = (JSON[SerializationKeys.status] as! String)
            location = (JSON[SerializationKeys.location] as! String)
            
            image3 = (JSON[SerializationKeys.image3] as! String)
            image1 = (JSON[SerializationKeys.image1] as! String)
            image2 = (JSON[SerializationKeys.image2] as! String)
            isDeleted = (JSON[SerializationKeys.isDeleted] as! String)
            
            currency = (JSON[SerializationKeys.currency] as! String)
            endTime = (JSON[SerializationKeys.endTime] as! String)
            jobid = (JSON[SerializationKeys.jobid] as! String)
            finalPrice = (JSON[SerializationKeys.finalPrice] as! String)
            title = (JSON[SerializationKeys.title] as! String)
            userid = (JSON[SerializationKeys.userid] as! String)
            categoryName = (JSON[SerializationKeys.categoryName] as! String)
            longitude = (JSON[SerializationKeys.longitude] as! String)
        }
    }
}
