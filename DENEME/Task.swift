
//
//  Task.swift
//
//  Created by Admin on 14/07/2017.
//  Copyright © 2017 Melis Gülenay. All rights reserved.
//

import Foundation
import  ObjectMapper

class Task:Mappable{
    var taskName:String!
    var whichProjectBelongTo:Int!
    var taskStartDate:Date!
    var taskEndDate:Date!
    var taskPercent:Float!
    var taskID:Int!
    var completedCost:Float!
    var estimatedCost:Float!
    var remainingCost:Float!
    static var IDCount:Int = 1
    var status:Bool!
    var personTakesTheTask:Int?



   
    
    init(_ name:String, _ projectName:Project, _ startDate:Date, _ endDate:Date){
        taskName = name
        whichProjectBelongTo = projectName.projectID
        taskStartDate = startDate
        taskEndDate = endDate
        self.taskID = Task.IDCount
        let temp = Calendar.current.dateComponents([.day], from: startDate, to: endDate)
        estimatedCost = Float(temp.day!) * 8
        print("estimated cost\(estimatedCost)")
        completedCost = 0
        Task.IDCount += 1
        remainingCost = estimatedCost - completedCost
        status = false
    }

    required init?(map: Map) {
    }
    
    
    func mapping(map: Map) {
        taskName <- map["taskName"]
        whichProjectBelongTo <- map["whichProjectBelongTo"]
        taskStartDate <- (map["taskStartDate"], DateTransform())
        taskEndDate <- (map["taskEndDate"], DateTransform())
        personTakesTheTask <- map["personTakesTheTask"]
        taskPercent <- map["taskPercent"]
        taskID <- map["taskID"]
        completedCost <- map["completedCost"]
        estimatedCost <- map["estimatedCost"]
        remainingCost <- map["remainingCost"]
        Task.IDCount <- map["IDCount"]
        status <- map["status"]

    }
    
    
    func addPersonToTask(_ person:Person){
        personTakesTheTask = person.personID
    }
    
    func removePersonFromTask(_ personID:Int){
        personTakesTheTask = nil
    }
    func calculateEstimatedCost(){
        let temp = Calendar.current.dateComponents([.day], from: taskStartDate, to: taskEndDate)
        if (Float(temp.day!) < 1) {
            estimatedCost = 8

        }
        else{
            estimatedCost = Float(temp.day!) * 8

        }
        print("ESTIMATED COST \(estimatedCost)")
        calculateRemainingCost()
    }
    func QueryPercent()->Float{
        return self.taskPercent!
    }
    
    func setPercent(_ percent:Float){
        self.taskPercent = percent
    }
    
    func calculateTaskPercent(){
        if estimatedCost != 0{
            self.taskPercent = ((100*completedCost)/estimatedCost)
        }
        else{
            self.taskPercent = 0
        }
    }
    
    func calculateRemainingCost(){
        remainingCost = estimatedCost - completedCost
    }

    
    

    
}
