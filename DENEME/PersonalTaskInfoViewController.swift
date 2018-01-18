//
//  PersonalTaskInfoViewController.swift
//  DENEME
//
//  Created by Admin on 20/07/2017.
//  Copyright © 2017 Melis Gülenay. All rights reserved.
//

import UIKit

class PersonalTaskInfoViewController: BaseViewController {
    @IBOutlet weak var TaskID: UILabel!
    @IBOutlet weak var TaskName: UILabel!
    @IBOutlet weak var ProjectTaskBelongTO: UILabel!
    @IBOutlet weak var StartDate: UILabel!
    @IBOutlet weak var EndDate: UILabel!
    @IBOutlet weak var EstimatedCost: UILabel!
    @IBOutlet weak var RemainingCost: UILabel!
    @IBOutlet weak var TaskProgress: UIProgressView!
    var comingTaskid = Int()
    @IBOutlet weak var completedCost: UILabel!
    
    @IBOutlet weak var progressBar: CUIProgressBarView!
    @IBOutlet weak var WarningLabel: UILabel!
    
    @IBOutlet weak var TaskStatusLabel: UILabel!
    @IBAction func UpdateButton(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let data = storyBoard.instantiateViewController(withIdentifier: "UpdateTaskProgressViewController") as! UpdateTaskProgressViewController
        let comingTask = DatabaseManager.myObj.findTasksAccordingToTaskID(comingTaskid)
        data.comingTaskid = comingTask.taskID
        self.navigationController?.pushViewController(data, animated: true)
    }
    
    func initializeView(){
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.none
        dateFormatter.dateStyle = DateFormatter.Style.short

        let comingTask = DatabaseManager.myObj.findTasksAccordingToTaskID(comingTaskid)
        TaskID.text = String(describing:comingTask.taskID!)
        TaskName.text = comingTask.taskName
        let project = DatabaseManager.myObj.findProject(comingTask.whichProjectBelongTo)
        ProjectTaskBelongTO.text = project.projectName
        StartDate.text = String(describing:  dateFormatter.string(from: comingTask.taskStartDate!))
        EndDate.text = String(describing: dateFormatter.string(from:comingTask.taskEndDate!))
        EstimatedCost.text = String(describing: comingTask.estimatedCost!) + " hours"
        RemainingCost.text = String(describing: comingTask.remainingCost!) + " hours"
        comingTask.calculateTaskPercent()
        completedCost.text = String(describing: comingTask.completedCost!) + " hours"
        if comingTask.status == true {
            TaskStatusLabel.text = "Done"
            let style = CUIProgressBarViewStyle.init(leftBackgroundColor: .green, rightBackgroundColor: .blue, textStyle: .init(font:.systemFont(ofSize: 15), textColor: .black))
            progressBar.progress = 1
            progressBar.applyStyle(style)
            progressBar.rightText = "100%"
        }
        else{
            TaskStatusLabel.text = "In progress"
            comingTask.calculateTaskPercent()
            let percent = comingTask.taskPercent
            
            
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
        if comingTask.remainingCost <= 0 {
            WarningLabel.text = "You have exceed the estimated cost!"
        }
        else{
            WarningLabel.text = ""
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

         let buttonItem = UIBarButtonItem(title: "Logout", style: .plain, target:self, action: #selector(buttonTapped(_:)))
         self.navigationItem.setRightBarButton(buttonItem, animated: true)
            initializeView()

    }
    
    /*
    let buttonItem = UIBarButtonItem(title: "Logout", style: .plain, target:self, action: #selector(buttonTapped(_:)))
    self.navigationItem.setRightBarButton(buttonItem, animated: true)
        func buttonTapped(_ sender:UIBarButtonItem){
        navigationController?.popToRootViewController(animated: true)
        }*/
    
    override func buttonTapped(_ sender:UIBarButtonItem){
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initializeView()
    }

}
