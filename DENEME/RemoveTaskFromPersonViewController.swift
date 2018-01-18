//
//  RemoveTaskFromPersonViewController.swift
//  DENEME
//
//  Created by Admin on 21/07/2017.
//  Copyright © 2017 Melis Gülenay. All rights reserved.
//

import UIKit

class RemoveTaskFromPersonViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    var comingTaskid = Int()
    var chosenToAdd:Person?
    @IBOutlet weak var currentAssignment: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let comingTask = DatabaseManager.myObj.findTasksAccordingToTaskID(comingTaskid)
        if comingTask.personTakesTheTask != nil {
            let person = DatabaseManager.myObj.findPerson(comingTask.personTakesTheTask!)
            currentAssignment.text = (person.name)! + " " + (person.surname)!

        }
        else{
            currentAssignment.text = "Not assigned."
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func removeTask(_ sender: Any) {
        let comingTask = DatabaseManager.myObj.findTasksAccordingToTaskID(comingTaskid)
        let person = comingTask.personTakesTheTask
        if person != nil {
            var found = DatabaseManager.myObj.findPerson(person!)
            found.removeTaskFromAPerson(comingTaskid)
            comingTask.personTakesTheTask = nil
        }

    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DatabaseManager.myObj.PersonList.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let comingTask = DatabaseManager.myObj.findTasksAccordingToTaskID(comingTaskid)
        let cell = tableView.dequeueReusableCell(withIdentifier: "RemoveTaskFromPersonTableViewCell") as! RemoveTaskFromPersonTableViewCell
        cell.NumberofTasksHas.text = "# of Tasks: " + String(describing: DatabaseManager.myObj.PersonList[indexPath.row].personTasks.count)
        cell.PersonName.text = DatabaseManager.myObj.PersonList[indexPath.row].name + " "  + DatabaseManager.myObj.PersonList[indexPath.row].surname
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenToAdd = DatabaseManager.myObj.PersonList[indexPath.row]
    }
    
    
    @IBAction func assingTask(_ sender: Any) {
        if chosenToAdd != nil {
            let comingTask = DatabaseManager.myObj.findTasksAccordingToTaskID(comingTaskid)
            if comingTask.personTakesTheTask != nil {
                let removedPerson = comingTask.personTakesTheTask
                let found = DatabaseManager.myObj.findPerson(removedPerson!)
                found.removeTaskFromAPerson(comingTaskid)
            }
            
            comingTask.personTakesTheTask = (chosenToAdd?.personID)!
            chosenToAdd?.personTasks.append(comingTask)
            let removedProject = comingTask.whichProjectBelongTo
            let foundproject = DatabaseManager.myObj.findProject(removedProject!)
            foundproject.removeTaskFromProject(comingTask.taskID)
            foundproject.addTaskToProject(comingTask)
        }
        self.navigationController?.popViewController(animated: true)
        
    }
    

}
