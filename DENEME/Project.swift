//
//  Project.swift
//  DENEME
//
//  Created by Admin on 17/07/2017.
//  Copyright © 2017 Melis Gülenay. All rights reserved.
//



import Foundation
import ObjectMapper

class Project:Mappable{


    var projectName:String!
    var projectStartDate:Date!
    var projectEndDate:Date!
    var tasks:[Task] = []
    var projectDonePercent:Float!
    static var IDCounter:Int = 1
    var projectID:Int = IDCounter
    
    
   
    
    init(_ name:String, _ startDate:Date, _ endDate:Date){
        projectName = name
        projectStartDate = startDate
        projectEndDate = endDate
        projectDonePercent = 0
        projectID = Project.IDCounter
        Project.IDCounter += 1
        
    }
 
    func mapping(map: Map) {
        projectName <- map["projectName"]
        projectStartDate <- (map["projectStartDate"], DateTransform())
        projectEndDate <- (map["projectEndDate"], DateTransform())
        tasks <- map["tasks"]
        projectDonePercent <- map["projectDonePercent"]
        projectID <- map["projectID"]
        Project.IDCounter <- map["IDCounter"]
    }
    
     /// This function can be used to validate JSON prior to mapping. Return nil to cancel mapping at this point
    required init?(map: Map) {
        
    }
    
    func addTaskToProject(_ task:Task){
        tasks.append(task)
    }
    
    func removeTaskFromProject(_ taskID:Int){
        if tasks.count != 0 {
            var removeIndex:Int?
            for index in 0..<tasks.count{
                if tasks[index].taskID == taskID{
                    removeIndex = index
                    break
                }
            }
            tasks.remove(at: removeIndex!)
        }
    }
    
    func calculateProcessDonePercent()->Float{
        let numOfTasks = tasks.count
        var numOfFinishedTasks:Int = 0
        for index in tasks{
            if index.status == true{
                numOfFinishedTasks += 1
            }
        }
        if numOfTasks != 0{
            self.projectDonePercent = (100 * Float(numOfFinishedTasks)) / Float(numOfTasks)

        }
        else {
            self.projectDonePercent = 0
        }
        return self.projectDonePercent
    }
 
    
    func QueryPercent()->Float{
        return self.projectDonePercent!
    }
    func setPercent(_ percent:Float){
        return self.projectDonePercent = percent
    }
    
}
