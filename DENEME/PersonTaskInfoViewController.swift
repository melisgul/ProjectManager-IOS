//
//  PersonTaskInfoViewController.swift
//  DENEME
//
//  Created by Admin on 20/07/2017.
//  Copyright © 2017 Melis Gülenay. All rights reserved.
//

import UIKit

class PersonTaskInfoViewController: BaseViewController {
    @IBOutlet weak var TaskID: UILabel!
    @IBOutlet weak var TaskName: UILabel!
    @IBOutlet weak var ProjectTaskBelongTo: UILabel!
    @IBOutlet weak var StartDate: UILabel!
    @IBOutlet weak var EndDate: UILabel!
    @IBOutlet weak var EstimatedCost: UILabel!
    @IBOutlet weak var RemainingCost: UILabel!
    
    @IBOutlet weak var progressBar: CUIProgressBarView!
    @IBOutlet weak var StatusLabel: UILabel!
    @IBOutlet weak var calculatedCost: UILabel!
    @IBAction func RemoveTaskButton(_ sender: Any) {
        DatabaseManager.myObj.removeTaskFromUser(comingTaskId, comingPerson!.personID)
        comingPerson?.removeTaskFromAPerson(comingTaskId)
        self.navigationController?.popViewController(animated: true)

    }
    var comingTaskId = Int()
    var comingPerson:Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.none
        dateFormatter.dateStyle = DateFormatter.Style.short
        let found = DatabaseManager.myObj.findTasksAccordingToTaskID(comingTaskId)
        TaskID.text = String(found.taskID!)
        TaskName.text = found.taskName
        let project = DatabaseManager.myObj.findProject(found.whichProjectBelongTo)
        ProjectTaskBelongTo.text = project.projectName
        StartDate.text = String(describing:dateFormatter.string(from:found.taskStartDate!))
        EndDate.text = String(describing:dateFormatter.string(from: found.taskEndDate!))
        EstimatedCost.text = String(found.estimatedCost!) + " hour"
        RemainingCost.text = String(found.remainingCost!) + " hour"
        calculatedCost.text = String(found.completedCost!) + " hour"
        if found.status == true {
            StatusLabel.text = "Done"
            let style = CUIProgressBarViewStyle.init(leftBackgroundColor: .green, rightBackgroundColor: .blue, textStyle: .init(font:.systemFont(ofSize: 15), textColor: .black))
            progressBar.progress = 1
            progressBar.applyStyle(style)
            progressBar.rightText = "100%"
        }
        else {
            StatusLabel.text = "In progress"
            found.calculateTaskPercent()
            let percent = found.taskPercent
            
            
            if  percent! < Float(50){
                let style = CUIProgressBarViewStyle.init(leftBackgroundColor: .orange, rightBackgroundColor: .blue, textStyle: .init(font:.systemFont(ofSize: 15), textColor: .black))
                print("<50 \(percent!/100)")
                progressBar.progress = CGFloat(percent!/100)
                progressBar.applyStyle(style)
                progressBar.rightText = String(describing: percent!) + "%"
            }
            else if percent! >= Float(100) {
                print(">=100 \(percent!/100)")
                
                let style = CUIProgressBarViewStyle.init(leftBackgroundColor: .red, rightBackgroundColor: .blue, textStyle: .init(font:.systemFont(ofSize: 15), textColor: .black))
                progressBar.progress = 1
                progressBar.applyStyle(style)
            }
            else{
                print("else \(percent!/100)")
                
                let style = CUIProgressBarViewStyle.init(leftBackgroundColor: .green, rightBackgroundColor: .blue, textStyle: .init(font:.systemFont(ofSize: 15), textColor: .black))
                progressBar.progress = CGFloat(percent!/100)
                progressBar.applyStyle(style)
                progressBar.rightText = String(describing: percent!) + "%"
            }
            

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
