//
//  Appearance.swift
//  Wagespoon
//
//  Created by gqgnju on 9/08/17.
//  Copyright © 2017 Developer. All rights reserved.
//
class Appearance: NSObject {
    // MARK: Properties
    public var apearence_id: String?
    public var apearence_name: String?
    public var apearence_pic: String?
    override init() {
        apearence_id = ""
        apearence_name = ""
        apearence_pic = ""
    }
    func setAppearance(appearance: Appearance) {
        apearence_id = appearance.apearence_id
        apearence_name = appearance.apearence_name
        apearence_pic = appearance.apearence_pic
    }
}

