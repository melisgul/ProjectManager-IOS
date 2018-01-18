//
//  PersonInfoViewController.swift
//  DENEME
//
//  Created by Admin on 19/07/2017.
//  Copyright © 2017 Melis Gülenay. All rights reserved.
//

import UIKit

class PersonInfoViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var PersonID: UILabel!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Surname: UILabel!
    @IBOutlet weak var Department: UILabel!
    var personIDequal = Int()
    var found:Person?
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initialize()
        tableView.reloadData()
   //     self.reloadInputViews()
    }
    
    func initialize(){
        let foundPerson = DatabaseManager.myObj.findPerson(personIDequal)
        PersonID.text = "T0" + String(describing: foundPerson.personID!)
        Name.text = foundPerson.name
        Surname.text = foundPerson.surname
        Department.text = foundPerson.Department
        emailLabel.text = foundPerson.email
        found = foundPerson
        let imageURL = getDocumentsDirectory().appendingPathComponent(String(describing: found?.personID) + ".png")
        let fileManager = FileManager.default
        let path = imageURL.path
        if fileManager.fileExists(atPath: path) {
            imageView.image = UIImage(contentsOfFile: imageURL.path)
        }
        else {
            imageView.image = UIImage(named: "images")
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if found?.personTasks.count != 0{
            return (found?.personTasks.count)!
        }
        else{
            return 0
        }

    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalTasklnfoTableViewCell") as! PersonalTasklnfoTableViewCell
        if found?.personTasks.count != 0 {
            let project = DatabaseManager.myObj.findProject((found?.personTasks[indexPath.row].whichProjectBelongTo)!)
            cell.PersonalTaskName.text = (found?.personTasks[indexPath.row].taskName)! + "(" + project.projectName + ")"
            let temp = Int((found?.personTasks[indexPath.row].remainingCost)!)
            if found?.personTasks[indexPath.row].status == true {
                cell.CircleImage.image = UIImage(named: "greenCircle")
                print("green")
            }
            else{
                if temp <= 0 {
                    cell.CircleImage.image = UIImage(named: "redCircle")
                }
                else{
                    cell.CircleImage.image = UIImage(named: "blueCircle")
                }
            }
        }

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let data = storyBoard.instantiateViewController(withIdentifier: "PersonTaskInfoViewController") as! PersonTaskInfoViewController
        data.comingTaskId = (found?.personTasks[indexPath.row].taskID)!
        data.comingPerson = found!
        self.navigationController?.pushViewController(data, animated: true)
        
    }
    
    @IBAction func UpdatePerson(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let data = storyBoard.instantiateViewController(withIdentifier: "UpdatePersonViewController") as! UpdatePersonViewController
        data.comingPerson = found
        self.navigationController?.pushViewController(data, animated: true)
    }

    @IBAction func AddTaskNewTask(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let data = storyBoard.instantiateViewController(withIdentifier: "AddNewPersonViewController") as! AddNewPersonViewController
        data.comingPerson = found
        self.navigationController?.pushViewController(data, animated: true)
    }
   
    
    @IBAction func RemovePersonButton(_ sender: Any) {
        DatabaseManager.myObj.removePerson(found!)
        self.navigationController?.popViewController(animated: true)
    }


}
