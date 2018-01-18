
//  Person.swift
//
//  Created by Admin on 14/07/2017.
//  Copyright © 2017 Melis Gülenay. All rights reserved.
//

import UIKit
import Foundation
import ObjectMapper

class Person:Mappable{
    var name:String!
    var surname:String!
    var personID:Int!
    var personTasks:[Task] = []
    var Department:String!
    var password:String!
    var authorisation:Bool!
    var email:String!
    
  
    
    init(_ name:String, _ surname:String, _ Department:String, _ id:Int,_ password:String,_ autho:Bool, email : String){
        self.name = name
        self.surname = surname
        self.personID = id
        self.Department = Department
        self.authorisation = autho
        self.password = password
        self.email = email
    }
    
    func addTaskToAPerson(_ newTask:Task){
        personTasks.append(newTask)
    }
 
    func mapping(map: Map) {
        name <- map["name"]
        surname <- map["surname"]
        personID <- map["personID"]
        Department <- map["Department"]
        authorisation <- map["authorisation"]
        password <- map["password"]
        email <- map["email"]
        personTasks <- map["personTasks"]
    }
    
    required init?(map: Map) {
        
    }
    
    func removeTaskFromAPerson(_ taskID:Int){
        if personTasks.count != 0 {
            var removeIndex:Int?
            for index in 0..<personTasks.count{
                if personTasks[index].taskID == taskID{
                    removeIndex = index
                    break
                }
            }
            if removeIndex != nil {
                personTasks.remove(at: removeIndex!)
            }
        }
    }
    
    func numberOfTasksThatBelongToPerson()->Int{
        return (self.personTasks.count)
    }
    
}

