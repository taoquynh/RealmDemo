//
//  Model.swift
//  RealmDemo
//
//  Created by Quynh on 3/19/20.
//  Copyright © 2020 Quynh. All rights reserved.
//

import Foundation
import RealmSwift

class People: Object {
    @objc dynamic var ID = ""
    @objc dynamic var name = ""
    @objc dynamic var address = ""
    let dogs = List<DogJ>()
    
    override class func primaryKey() -> String? {
        return "ID"
    }
}

class DogJ: Object {
    @objc dynamic var name = ""
    @objc dynamic var color: String? = nil
    
    var me: String {
        return "Dog's name is \(name), color is a \(color!)"
    }
    
    @objc dynamic var dogId = 0
    @objc dynamic var species = ""
    
    override class func ignoredProperties() -> [String] {
        return ["dogId", "species"]
    }
}
