//
//  ProjectTaskInfoViewController.swift
//  DENEME
//
//  Created by Admin on 20/07/2017.
//  Copyright © 2017 Melis Gülenay. All rights reserved.
//

import UIKit

class ProjectTaskInfoViewController: BaseViewController {
    @IBOutlet weak var TaskID: UILabel!
    @IBOutlet weak var TasksName: UILabel!
    @IBOutlet weak var WhichProjectBelongTo: UILabel!
    @IBOutlet weak var StartDate: UILabel!
    @IBOutlet weak var EndDate: UILabel!
    @IBOutlet weak var EstimatedCost: UILabel!
    @IBOutlet weak var RemainingCost: UILabel!
    var comingTaskID = Int()
    @IBOutlet weak var StatusLabel: UILabel!
  
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var CalculatedCost: UILabel!
    @IBOutlet weak var PersonAssignedLabel: UILabel!
    @IBOutlet weak var progressBar: CUIProgressBarView!
    

    
    func initView(){
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.none
        dateFormatter.dateStyle = DateFormatter.Style.short
        
        let found = DatabaseManager.myObj.findTasksAccordingToTaskID(comingTaskID)
        TaskID.text = String(describing: found.taskID!)
        TasksName.text = found.taskName
        let project = DatabaseManager.myObj.findProject(found.whichProjectBelongTo)
        WhichProjectBelongTo.text = project.projectName
        StartDate.text =  String(describing: dateFormatter.string(from:found.taskStartDate!) )
        EndDate.text = String(describing: dateFormatter.string(from:found.taskEndDate!))
        EstimatedCost.text = String(describing:found.estimatedCost!) + " hours"
        RemainingCost.text = String(describing:found.remainingCost!) + " hours"
        CalculatedCost.text = String(describing:found.completedCost!) + " hours"
        if found.status == true {
            StatusLabel.text = "Done"
            let style = CUIProgressBarViewStyle.init(leftBackgroundColor: .green, rightBackgroundColor: .blue, textStyle: .init(font:.systemFont(ofSize: 15), textColor: .black))
            progressBar.progress = 1
            progressBar.applyStyle(style)
            progressBar.rightText = "100%"
        }
        else{
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
        if found.personTakesTheTask != nil{
            let person = DatabaseManager.myObj.findPerson(found.personTakesTheTask!)
            PersonAssignedLabel.text = person.name + " " + person.surname
        }
        else{
            PersonAssignedLabel.text = "Not assigned"
        }
        let today = Date.init()
        if today > found.taskEndDate {
            infoLabel.text = "End date of the task was missed."
        }
        else if  found.remainingCost < 0 {
            infoLabel.text = "End date of the task was missed."
        }
        else{
            infoLabel.text = ""
   
        }


    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()

            }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func EndTaskButton(_ sender: Any) { //remove task from the project
        DatabaseManager.myObj.removeTaskFromProject(comingTaskID)
        self.navigationController?.popViewController(animated: true)

    }
    
    @IBAction func removeTaskFromPerson(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let data = storyBoard.instantiateViewController(withIdentifier: "RemoveTaskFromPersonViewController") as! RemoveTaskFromPersonViewController
        data.comingTaskid = comingTaskID
        self.navigationController?.pushViewController(data, animated: true)
    }
    
    @IBAction func delayTaskButton(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let data = storyBoard.instantiateViewController(withIdentifier: "DelayTaskViewController") as! DelayTaskViewController
        data.comingTaskid = comingTaskID
        self.navigationController?.pushViewController(data, animated: true)
    }
    

}
