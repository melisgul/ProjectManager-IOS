//
//  AddNewProjectViewController.swift
//  DENEME
//
//  Created by Admin on 20/07/2017.
//  Copyright © 2017 Melis Gülenay. All rights reserved.
//

import UIKit

class AddNewProjectViewController: BaseViewController {
    @IBOutlet weak var projectName: UITextField!
    @IBOutlet weak var projectStartDatePicker: UIDatePicker!
    @IBOutlet weak var ProjectEndDatePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func AddProjectButton(_ sender: Any) {
        if projectName.text != nil ,projectName.text != "" {
            if projectStartDatePicker.date > ProjectEndDatePicker.date{
                let confirmAlertControl = UIAlertController(title: "Start date cannot be chosen later than end date", message: "Please enter appropriate values.", preferredStyle: .alert)
                
                let cancelAction = UIAlertAction(title: NSLocalizedString("OK!",comment: ""), style: .cancel, handler: nil)
                confirmAlertControl.addAction(cancelAction)
                present(confirmAlertControl, animated: true, completion: nil)
            }
            else{
                let newProject = Project(projectName.text!, projectStartDatePicker.date, ProjectEndDatePicker.date)
                DatabaseManager.myObj.ProjectList.append(newProject)
                self.navigationController?.popViewController(animated: true)
            }
        }
        else {
            let confirmAlertControl = UIAlertController(title: "Project name cannot be leaved as a blank", message: "Please enter the project name.", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: NSLocalizedString("OK!",comment: ""), style: .cancel, handler: nil)
            confirmAlertControl.addAction(cancelAction)
            present(confirmAlertControl, animated: true, completion: nil)
        }
    }


}
