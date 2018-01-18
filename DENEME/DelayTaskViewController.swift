//
//  DelayTaskViewController.swift
//  DENEME
//
//  Created by Admin on 21/07/2017.
//  Copyright © 2017 Melis Gülenay. All rights reserved.
//

import UIKit

class DelayTaskViewController: BaseViewController {
    var comingTaskid = Int()
    
    @IBOutlet weak var endDatePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        let comingTask = DatabaseManager.myObj.findTasksAccordingToTaskID(comingTaskid)
        endDatePicker.setDate( comingTask.taskEndDate, animated: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func delayTask(_ sender: Any) {
        let comingTask = DatabaseManager.myObj.findTasksAccordingToTaskID(comingTaskid)
        comingTask.taskEndDate = endDatePicker.date
        comingTask.calculateEstimatedCost()
        print("delayed value \(endDatePicker.date)")
        comingTask.calculateRemainingCost()
        self.navigationController?.popViewController(animated: true)
    }

    

}
