//
//  AddNewPersonViewController.swift
//  DENEME
//
//  Created by Admin on 20/07/2017.
//  Copyright © 2017 Melis Gülenay. All rights reserved.
//

import UIKit

class AddNewPersonViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    var comingPerson:Person?
    var showTasks:[Task] = []
    var chosenToAdd:Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showTasks = DatabaseManager.myObj.findNilTasks()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    @IBAction func AddNewTask(_ sender: Any) {
        if chosenToAdd == nil{
            let confirmAlertControl = UIAlertController(title: "Warning", message: "Please choose task.", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: NSLocalizedString("OK!",comment: ""), style: .cancel, handler: nil)
            confirmAlertControl.addAction(cancelAction)
            present(confirmAlertControl, animated: true, completion: nil)
        }
        else{
            comingPerson?.addTaskToAPerson(chosenToAdd!)
            chosenToAdd?.addPersonToTask(comingPerson!)
            self.navigationController?.popViewController(animated: true)

        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if showTasks.count != 0{
            return (showTasks.count)
        }
        else{
            return 0
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddNewTaskTableViewCell") as! AddNewTaskTableViewCell
        if showTasks.count != 0 {
            let project = DatabaseManager.myObj.findProject(showTasks[indexPath.row].whichProjectBelongTo)
            cell.TaskLabel.text = showTasks[indexPath.row].taskName + "(" + project.projectName + ")"
            
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenToAdd = showTasks[indexPath.row]
    }


}
