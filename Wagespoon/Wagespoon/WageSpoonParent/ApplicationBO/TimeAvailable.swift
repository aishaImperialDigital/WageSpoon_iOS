//
//  TimeAvailable.swift
//  
//
//  Created by gqgnju on 8/08/17.
//
//

class AvailableTime: NSObject {
    // MARK: Properties
    public var fixed_date_from: String?
    public var fixed_date_to: String?
    public var part_time_from: String?
    public var part_time_to: String?
    public var time_availability_id: String?
    public var part_time_thu: Bool?
    public var part_time_wed: Bool?
    public var part_time_tue: Bool?
    public var part_time_sun: Bool?
    public var part_time_sat: Bool?
    public var part_time_mon: Bool?
    public var part_time_fri: Bool?
    
    
    override init() {
        
        
        fixed_date_from = ""
        fixed_date_to = ""
        part_time_from = ""
        time_availability_id = ""
        part_time_to = ""
        part_time_fri = false
        part_time_mon = false
        part_time_sat = false
        part_time_sun = false
        part_time_thu = false
        part_time_tue = false
        part_time_wed = false
        
    }
    
    func setAvailbleTime(availableTime: AvailableTime)  {
        
        fixed_date_from = availableTime.fixed_date_from
        fixed_date_to = availableTime.fixed_date_to
        part_time_from = availableTime.part_time_from
        time_availability_id = availableTime.time_availability_id
        part_time_to = availableTime.part_time_to
        part_time_fri = availableTime.part_time_fri
        part_time_mon = availableTime.part_time_mon
        part_time_sat = availableTime.part_time_sat
        part_time_sun = availableTime.part_time_sun
        part_time_thu = availableTime.part_time_thu
        part_time_tue = availableTime.part_time_tue
        part_time_wed = availableTime.part_time_wed
    }
}
