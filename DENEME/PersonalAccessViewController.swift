//
//  PersonalAccessViewController.swift
//  DENEME
//
//  Created by Admin on 20/07/2017.
//  Copyright © 2017 Melis Gülenay. All rights reserved.
//

import UIKit

class PersonalAccessViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    @IBOutlet weak var PersonIDLabel: UILabel!
    @IBOutlet weak var PersonNameLabel: UILabel!
    @IBOutlet weak var PersonSurnameLabel: UILabel!
    @IBOutlet weak var PersonDepartmentLabel: UILabel!
    var comingPerson = Person("-1", "y", "z",1,"v",false, email: "")

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PersonIDLabel.text = "T" + String(describing: comingPerson.personID!)
        PersonNameLabel.text = comingPerson.name
        PersonSurnameLabel.text = comingPerson.surname
        PersonDepartmentLabel.text = comingPerson.Department
        emailLabel.text = comingPerson.email

         let imageURL = getDocumentsDirectory().appendingPathComponent(String(describing: comingPerson.personID) + ".png")
        print("THE PATH \(getDocumentsDirectory())")
        let fileManager = FileManager.default
        let path = imageURL.path
        if fileManager.fileExists(atPath: path) {
            imageView.image = UIImage(contentsOfFile: imageURL.path)
        }
        else {
            imageView.image = UIImage(named: "images")
        }
        let buttonItem = UIBarButtonItem(title: "Logout", style: .plain, target:self, action:#selector(buttonTapped(_:)))
        self.navigationItem.setLeftBarButton(buttonItem, animated: true)
        // Do any additional setup after loading the view.
    }
    
    
    func buttonTapped(_ sender:UIBarButtonItem){
        self.navigationController?.popViewController(animated: true)
    }
 
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
  
    @IBAction func UploadImage(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true){
        }
    }
    
     func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    


    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            imageView.image = image
            if let data = UIImagePNGRepresentation(image) {
                let name = String(describing: comingPerson.personID)
                let fileManager = FileManager.default
                let filename = getDocumentsDirectory().appendingPathComponent(name + ".png")
                var path = filename.path
                if fileManager.fileExists(atPath: path) {
                    print("FILE AVAILABLE")
                    path.removeAll()
                    try? data.write(to: filename)
                    
                } else {
                    print("FILE NOT AVAILABLE")
                    try? data.write(to: filename)

                }
            }
        }
        else{
            
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if comingPerson.personTasks.count != 0{
            return (comingPerson.personTasks.count)
        }
        else{
            return 0
        }
        
    }
    
  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalAccessTaskTableViewCell") as! PersonalAccessTaskTableViewCell
        if comingPerson.personTasks.count != 0 {
            let project = DatabaseManager.myObj.findProject(comingPerson.personTasks[indexPath.row].whichProjectBelongTo)
            cell.TaskLabel.text = comingPerson.personTasks[indexPath.row].taskName + "(" + project.projectName + ")"
            comingPerson.personTasks[indexPath.row].calculateRemainingCost()
            let temp = Int((comingPerson.personTasks[indexPath.row].remainingCost)!)
            print("here here  \(comingPerson.personTasks[indexPath.row].taskName), \(comingPerson.personTasks[indexPath.row].remainingCost)")
            
            if comingPerson.personTasks[indexPath.row].status == true {
              print("YESIL")
                cell.progressImage.image = UIImage(named: "greenCircle")
            }
            else{
                if temp <= 0 {
                    print("KIRMIZI")

                    cell.progressImage.image = UIImage(named: "redCircle")
                }
                else{
                    print("MAVI")

                    cell.progressImage.image = UIImage(named: "blueCircle")
                }
            }
           
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let data = storyBoard.instantiateViewController(withIdentifier: "PersonalTaskInfoViewController") as! PersonalTaskInfoViewController
        data.comingTaskid = comingPerson.personTasks[indexPath.row].taskID
        self.navigationController?.pushViewController(data, animated: true)
 
    }
    
    @IBAction func ChangePasswordButton(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let data = storyBoard.instantiateViewController(withIdentifier: "PasswordChangeViewController") as! PasswordChangeViewController
        data.comingPerson = comingPerson
        self.navigationController?.pushViewController(data, animated: true)
    }
    

}
