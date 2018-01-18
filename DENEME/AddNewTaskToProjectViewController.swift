//
//  AddNewTaskToProjectViewController.swift
//  DENEME
//
//  Created by Admin on 20/07/2017.
//  Copyright © 2017 Melis Gülenay. All rights reserved.
//

import UIKit

class AddNewTaskToProjectViewController: BaseViewController {
    @IBOutlet weak var TaskNameTextBox: UITextField!
    @IBOutlet weak var StartDatePicker: UIDatePicker!
    @IBOutlet weak var EndDatePicker: UIDatePicker!
    var comingProject:Project?
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

    @IBAction func AddTaskToProjectButton(_ sender: Any) {
       
        if TaskNameTextBox.text != nil , TaskNameTextBox.text != ""{
            if StartDatePicker.date > EndDatePicker.date, EndDatePicker.date >= (comingProject?.projectEndDate)! {
                let confirmAlertControl = UIAlertController(title: "Start date cannot be chosen later than end date", message: "Please enter appropriate values.", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: NSLocalizedString("OK!",comment: ""), style: .cancel, handler: nil)
                confirmAlertControl.addAction(cancelAction)
                present(confirmAlertControl, animated: true, completion: nil)
            }
            else if EndDatePicker.date >= (comingProject?.projectEndDate)! {
                let confirmAlertControl = UIAlertController(title: "End date cannot be chosen later than project end date", message: "Please enter appropriate values.", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: NSLocalizedString("OK!",comment: ""), style: .cancel, handler: nil)
                confirmAlertControl.addAction(cancelAction)
                present(confirmAlertControl, animated: true, completion: nil)
            }
            else{
                let newTask = Task(TaskNameTextBox.text!, comingProject!, StartDatePicker.date, EndDatePicker.date )
                DatabaseManager.myObj.TaskList.append(newTask)
                comingProject?.addTaskToProject(newTask)
                self.navigationController?.popViewController(animated: true)
            }
        
        }
        else {
            let confirmAlertControl = UIAlertController(title: "Task name cannot be leaved as a blank", message: "Please enter the task name.", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: NSLocalizedString("OK!",comment: ""), style: .cancel, handler: nil)
            confirmAlertControl.addAction(cancelAction)
            present(confirmAlertControl, animated: true, completion: nil)
        }


    }
 

}
