//
//  ViewController.swift
//  RealmDemo
//
//  Created by Quynh on 3/19/20.
//  Copyright © 2020 Quynh. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        createData()
    }

    func createData(){
        let dog1 = DogJ()
        dog1.name = "Toky"
        dog1.color = "Black"
        
        let dog2 = DogJ()
        dog2.name = "Will"
        dog2.color = "Bronw"
        
        let people = People()
        people.name = "Potter"
        people.address = "Anh"
        people.dogs.append(objectsIn: [dog1, dog2])
        
        DBManager.sharedInstance.addDog(dogs: [dog1, dog2])
        DBManager.sharedInstance.addData(person: people)
    }
    
    func printPeople(){
        let results = DBManager.sharedInstance.getDataFromPeople()
        for item in results {
            print("Bos: \(item.name), \(item.address)")
            for jtem in item.dogs {
                print(jtem.name, jtem.color ?? "no color")
                jtem.me
            }
        }
    }
    
    func updatePeople(){
        let people = People()
        people.name = "Big Boss"
        people.address = "Canada"
        DBManager.sharedInstance.updateByID("20BACF48-7529-4025-B8A7-A4DD6A3E878A", object: people)
    }
    
    func addDogToList(){
        let dog = DogJ()
        dog.name = "Blur"
        dog.color = "Orange"
        DBManager.sharedInstance.addDogByPeopleID("20BACF48-7529-4025-B8A7-A4DD6A3E878A", object: dog)
    }
}

