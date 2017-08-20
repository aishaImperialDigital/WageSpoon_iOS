//
//  Proximity.swift
//  Wagespoon
//
//  Created by gqgnju on 16/08/17.
//  Copyright © 2017 Developer. All rights reserved.
//


class Proximity: NSObject {
    // MARK: Properties

    public var proximity_from: String?
    public var proximity_to: String?
    public var proximity_id: String?

    
    
    override init() {
        
        
        proximity_from = ""
        proximity_to = ""
        proximity_id = ""

        
    }
    
    func setProximity(proximity: Proximity)  {
        
        proximity_from = proximity.proximity_from
        proximity_to = proximity.proximity_to
        proximity_id = proximity.proximity_id
    }
}

