//
//  UpdateTaskProgressViewController.swift
//  DENEME
//
//  Created by Admin on 21/07/2017.
//  Copyright © 2017 Melis Gülenay. All rights reserved.
//

import UIKit

class UpdateTaskProgressViewController: UIViewController {
    @IBOutlet weak var EstimatedCost: UILabel!
    @IBOutlet weak var remainingCost: UILabel!

    @IBOutlet weak var remainingCostUpdate: UITextField!
    var comingTaskid = Int()
    @IBOutlet weak var segmentcontrol: UISegmentedControl!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let comingTask = DatabaseManager.myObj.findTasksAccordingToTaskID(comingTaskid)
        EstimatedCost.text = String(describing: comingTask.estimatedCost!)
        comingTask.calculateRemainingCost()
        remainingCost.text = String(describing: comingTask.remainingCost!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func UpdateTaskProgresLevelButton(_ sender: Any) {
    let comingTask = DatabaseManager.myObj.findTasksAccordingToTaskID(comingTaskid)
            if remainingCostUpdate.text != nil , remainingCostUpdate.text != "" {
                comingTask.completedCost = comingTask.completedCost + Float(remainingCostUpdate.text!)!
                comingTask.calculateRemainingCost()
            }
        
            switch segmentcontrol.selectedSegmentIndex {
            case 0:
                comingTask.status = true
                print("GELDI")
               // break
            case 1:
                comingTask.status = false
                print("Ne alaka?")

              //  break
            default: break
                
            }
        
        let removedPerson = comingTask.personTakesTheTask
        let found = DatabaseManager.myObj.findPerson(removedPerson!)
        found.removeTaskFromAPerson(comingTaskid)
        comingTask.personTakesTheTask = (found.personID)!
        found.personTasks.append(comingTask)
        let removedProject = comingTask.whichProjectBelongTo
        let foundproject = DatabaseManager.myObj.findProject(removedProject!)
        foundproject.removeTaskFromProject(comingTask.taskID)
        foundproject.addTaskToProject(comingTask)
            self.navigationController?.popViewController(animated: true)
    }

  

}
