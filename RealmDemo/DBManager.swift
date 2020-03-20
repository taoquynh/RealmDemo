//
//  DBManager.swift
//  RealmDemo
//
//  Created by Quynh on 3/19/20.
//  Copyright © 2020 Quynh. All rights reserved.
//

import Foundation
import RealmSwift

class DBManager {
    private var database: Realm!
    
    static let sharedInstance = DBManager()
    static var autoID: Int = 0
    
    private init(){
        database = try! Realm()
        print(database.configuration.fileURL!)
        
    }
    
    func addData(person: People){
        try! database.write {
            print("Add new object")
            person.ID = UUID().uuidString
            database.add(person)
        }
    }
    
    func addDog(dogs: [DogJ]){
        try! database.write {
            if dogs.count > 0{
                for item in dogs{
                    database.add(item)
                }
            }
        }
    }
    
    func deleteAll(){
        try! database.write {
            database.deleteAll()
        }
    }
    
    func getDataFromPeople() -> Results<People> {
        let results: Results<People> = database.objects(People.self)
        return results
    }
    
    func updateByID(_ id: String, object: People){
        object.ID = id
        try! database.write {
            database.add(object, update: .modified)
        }
    }
    
    func addDogByPeopleID(_ id: String, object: DogJ){
        let predicate = NSPredicate(format: "ID = %@", id)
        let people = database.objects(People.self).filter(predicate)
        try! database.write {
            people.first?.dogs.append(object)
        }
    }
}
