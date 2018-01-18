//
//  DatabaseManager.swift
//  DENEME
//
//  Created by Admin on 19/07/2017.
//  Copyright © 2017 Melis Gülenay. All rights reserved.
//

import UIKit
import Foundation
import ObjectMapper



class DatabaseManager: NSObject,Mappable {
    
    static var myObj = DatabaseManager()
    
    var PersonList:[Person] = []
    var ProjectList:[Project] = []
    var TaskList:[Task] = []
    let dateFormatter = DateFormatter()
    var fileURL:URL?
    var fileURLForTasks:URL?
    var fileURLForProjects:URL?
    var fileURLForPhotos:URL?
    
     override init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        PersonList <- map["PersonList"]
        ProjectList <- map["ProjectList"]
        TaskList <- map["ProjectList"]
    }
    

    
    
    func findProject(_ id:Int)->Project{
        var element:Project
        for index in ProjectList{
            if index.projectID == id{
                element = index
                return element
            }
        }
        element = Project("", Date.init(), Date.init() )
        return element
    }
    
    func findTasksAccordingToProjectID(_ id:Int)->[Task]{
        var temp:[Task] = []
        for value in TaskList{
            if value.whichProjectBelongTo == id {
                temp.append(value)
            }
        }
        return temp
    }
    
    
    
    func findTasksAccordingToTaskID(_ id:Int)->Task{
        var temp:Task?
        for value in TaskList{
            if value.taskID == id{
                temp = value
            }
        }
        return temp!
    }
    
    
    func findPerson(_ id:Int)->Person{
        var element:Person
        for index in PersonList{
            if index.personID == id{
                element = index
                return element
                
            }
        }
        element = Person("-1", "y", "z",1,"v",false, email: "")
        return element
    }
    

    
    
    func isIDtrue(_ id:Int)->Bool{
        for index in PersonList{
            if index.personID == id{
                return true
            }
        }
        return false
    }
    
    func findNilTasks()->[Task]{
        var temp:[Task] = []
        for index in TaskList{
            if index.personTakesTheTask == nil {
                temp.append(index)
            }
        }
        return temp
    }
    
    func removeTaskFromUser(_ id:Int,_ personid:Int){
        let found = findPerson(personid)
        found.removeTaskFromAPerson(id)
        var temp:Task?
        for index in TaskList{
            if index.taskID == id{
                temp = index
            }
        }
        temp?.personTakesTheTask = nil
    }
    
    func removeTaskFormTaskList(_ taskid:Int){
        var removeIndex:Int = 0
        for (index,value) in TaskList.enumerated() {
            if value.taskID == taskid{
                removeIndex = index
            }
        }
        TaskList.remove(at: removeIndex)
        
    }
    
    
    
    func removeTaskFromProject(_ taskid:Int){ //remove task both person and project and task
        var removeTask:Task?
        for value in TaskList{
            if value.taskID == taskid{
                removeTask = value
            }
        }
        if removeTask?.personTakesTheTask != nil{
            removeTaskFromUser(taskid,(removeTask?.personTakesTheTask)!) //task removed from person

        }
        let found = findProject((removeTask?.whichProjectBelongTo)!)
        found.removeTaskFromProject(taskid) //task is removed from project
        removeTaskFormTaskList(taskid) //task is remove from list
    }
    
    func removeProject(_ removeProject:Project){
        for value in removeProject.tasks{
            removeTaskFromProject(value.taskID)
        }
        var removeIndex:Int! = -1
        for (index,value) in ProjectList.enumerated(){
            if value.projectID == removeProject.projectID{
                removeIndex = index
            }
        }
        ProjectList.remove(at: removeIndex)
    }
    
    func passwordValidation(_ id:Int,_ password:String)->Bool{
        if findPerson(id).name == "-1" {
            return false
        }
        else {
            let found = findPerson(id)
            if found.password != password {
                return false
            }
            else{
                return true
            }
        }
    }
    
    func removePerson(_ person:Person){
        for value in person.personTasks{
            value.personTakesTheTask = nil
        }
        
        var removeIndex:Int! = -1
        for (index,value) in PersonList.enumerated(){
            if value.personID == person.personID {
                removeIndex = index
            }
        }
        PersonList.remove(at: removeIndex)
    }
    
    func initURLS(){
    let personFileName = "PersonJSON"
    let DocumentDirUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    fileURL = DocumentDirUrl.appendingPathComponent(personFileName).appendingPathExtension("json")
    let taskFileName = "TaskJSON"
    let DocumentDirUrlForTask = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    fileURLForTasks = DocumentDirUrlForTask.appendingPathComponent(taskFileName).appendingPathExtension("json")
    let projectFileName = "ProjectJSON"
    let DocumentDirUrlForProject = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    fileURLForProjects = DocumentDirUrlForProject.appendingPathComponent(projectFileName).appendingPathExtension("json")
        print(DocumentDirUrl)
        var photoFileName = "PhotoJSON"
        var DocumentDirUrlForPhotos = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        fileURLForPhotos = DocumentDirUrlForPhotos.appendingPathComponent(photoFileName).appendingPathExtension("json")
    }
    
    
    func convertJsonAndWriteToJsonFile(){
        //creating json objects
        
        let personJSON = PersonList.toJSONString(prettyPrint: true)
        let taskJSON = TaskList.toJSONString(prettyPrint: true)
        let projectJSON = ProjectList.toJSONString(prettyPrint: true)
        
        
        //write to file..

        do{
            try personJSON!.write(to: fileURL!, atomically: true, encoding: .utf8)
        }catch let error as NSError{
            print("failed to write file")
            print(error)
        }
 

        do{
            try taskJSON!.write(to: fileURLForTasks!, atomically: true, encoding: .utf8)
        }catch let error as NSError{
            print("failed to write file")
            print(error)
        }
        
        do{
            try projectJSON!.write(to: fileURLForProjects!, atomically: true, encoding: .utf8)
        }catch let error as NSError{
            print("failed to write file")
            print(error)
        }
        

        
    }
    
    func readFromFileAndCreateLists(){
         var readPerson = ""
         
         do {
         readPerson = try String(contentsOf: fileURL!)
         }catch let error as NSError{
         print("failed to read file")
         print(error)
         }
       
        PersonList = Mapper<Person>().mapArray(JSONString: readPerson)!
        
        
        var readTask = ""
        
        do {
            readTask = try String(contentsOf: fileURLForTasks!)
        }catch let error as NSError{
            print("failed to read file")
            print(error)
        }
        
        TaskList = Mapper<Task>().mapArray(JSONString: readTask)!
       
        
        var readProject = ""
        
        do {
            readProject = try String(contentsOf: fileURLForProjects!)
        }catch let error as NSError{
            print("failed to read file")
            print(error)
        }
     
        
        ProjectList = Mapper<Project>().mapArray(JSONString: readProject)!
        
    var readPhotos = ""
        
        do{
            readPhotos = try String(contentsOf: fileURLForPhotos!)
        }catch let error as NSError{
            print("failed to read file")
            print(error)
        }
        print ("read PHOTOS \(readPhotos)")
        
      //  photoList = Mapper<photoPerson>().mapArray(JSONArray: readPhotos)
    }
    
    
}

