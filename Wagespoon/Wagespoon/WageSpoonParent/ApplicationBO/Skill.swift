//
//  Skill.swift
//  Wagespoon
//
//  Created by gqgnju on 9/08/17.
//  Copyright © 2017 Developer. All rights reserved.
//
import ObjectMapper
class Skill: Mappable {
    // MARK: Properties
    public var skills_id: String?
    public var skills_name: String?
     init() {
        skills_id = ""
        skills_name = ""
    }
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        self.skills_id <- map["skills_id"]
        self.skills_name <- map["skills_name"]
    }
    
    func setSkill(skill: Skill) {
        skills_id = skill.skills_id
        skills_name = skill.skills_name
    }
}
   
