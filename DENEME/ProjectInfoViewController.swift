//
//  ProjectInfoViewController.swift
//  DENEME
//
//  Created by Admin on 19/07/2017.
//  Copyright © 2017 Melis Gülenay. All rights reserved.
//

import UIKit

class ProjectInfoViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate  {
    @IBOutlet weak var ProjectID: UILabel!
    @IBOutlet weak var ProjectStartDate: UILabel!
    @IBOutlet weak var ProjectEndDate: UILabel!
    var dataProjectId = Int()
    var found = Project("", Date.init(), Date.init())
    @IBOutlet weak var progressBar: CUIProgressBarView!

    @IBOutlet weak var ProjectName: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.none
        dateFormatter.dateStyle = DateFormatter.Style.short
        
        found = DatabaseManager.myObj.findProject(dataProjectId)
        ProjectID.text = String(describing: found.projectID)
        ProjectStartDate.text = String(describing: dateFormatter.string(from: found.projectStartDate!))
        ProjectEndDate.text = String(describing: dateFormatter.string(from:found.projectEndDate!))
        ProjectName.text = found.projectName
    
        let percent = found.calculateProcessDonePercent()
        if  percent < Float(50){
            let style = CUIProgressBarViewStyle.init(leftBackgroundColor: .orange, rightBackgroundColor: .blue, textStyle: .init(font:.systemFont(ofSize: 15), textColor: .black))
            print("<50 \(percent/100)")
            progressBar.progress = CGFloat(percent/100)
            progressBar.applyStyle(style)
        }
        else{
            let style = CUIProgressBarViewStyle.init(leftBackgroundColor: .green, rightBackgroundColor: .blue, textStyle: .init(font:.systemFont(ofSize: 15), textColor: .black))
            progressBar.progress = CGFloat(percent/100)
            progressBar.applyStyle(style)
        }
        progressBar.rightText = String(describing: percent) + "%"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if found.tasks.count != 0 {
            return (found.tasks.count)
        }
        else {
                return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectInfoTableViewCell") as! ProjectInfoTableViewCell
        if found.tasks.count != 0 {
                let project = DatabaseManager.myObj.findProject(found.tasks[indexPath.row].whichProjectBelongTo)
                cell.TaskLabelForProject.text = found.tasks[indexPath.row].taskName + "(" + project.projectName + ")"
                 let temp = Int((found.tasks[indexPath.row].remainingCost)!)
            if found.tasks[indexPath.row].status == true {
                print("yesil")
                cell.progressImage.image = UIImage(named: "greenCircle")
            }
            else{
                if temp <= 0 {
                    cell.progressImage.image = UIImage(named: "redCircle")
                }
                else{
                    cell.progressImage.image = UIImage(named: "blueCircle")
                }
            }
            }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let data = storyBoard.instantiateViewController(withIdentifier: "ProjectTaskInfoViewController") as! ProjectTaskInfoViewController
        data.comingTaskID = found.tasks[indexPath.row].taskID
        self.navigationController?.pushViewController(data, animated: true)
    }
    @IBAction func AddNewTask(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let data = storyBoard.instantiateViewController(withIdentifier: "AddNewTaskToProjectViewController") as! AddNewTaskToProjectViewController
        data.comingProject = found
        self.navigationController?.pushViewController(data, animated: true)
    }
    
    @IBAction func RemoveProjectButton(_ sender: Any) {
        DatabaseManager.myObj.removeProject(found)
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func delayProjectButton(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let data = storyBoard.instantiateViewController(withIdentifier: "DelayProjectViewController") as! DelayProjectViewController
        data.comingProject = found
        self.navigationController?.pushViewController(data, animated: true)
    }
    
    
}
