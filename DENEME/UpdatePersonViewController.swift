//
//  UpdatePersonViewController.swift
//  DENEME
//
//  Created by Admin on 26/07/2017.
//  Copyright © 2017 Melis Gülenay. All rights reserved.
//

import UIKit

class UpdatePersonViewController: BaseViewController,UIPickerViewDataSource,UITextFieldDelegate ,UIPickerViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    
    @IBOutlet weak var NameField: UITextField!
    
    @IBOutlet weak var surnameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var uploadButton: CUIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var passWordLabel: UILabel!
    @IBOutlet weak var pickerForDepartments: UIPickerView!
    @IBOutlet weak var Authorization: UISegmentedControl!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var departmentField: UITextField!
    var comingPerson:Person?
    var departments = ["Mobile Development Software Programmer ", "Mobile Development Analyst"]
    override func viewDidLoad() {
    super.viewDidLoad()
        NameField.placeholder = comingPerson?.name
        surnameField.placeholder = comingPerson?.surname
        departmentField.placeholder = comingPerson?.Department
        emailField.placeholder = comingPerson?.email
        if comingPerson?.authorisation == false{
            passwordField.isHidden = true
            passWordLabel.isHidden = true
            imageView.isHidden = true
            uploadButton.isHidden = true
        }
    }
    
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    let titleForRow = departments[row]
    return titleForRow
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    departmentField.text = self.departments[row]
    pickerForDepartments.isHidden = true
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    if textField == self.departmentField{
    self.pickerForDepartments.isHidden = false
    }
    }
    
    @IBAction func UpdatePersonButton(_ sender: Any) {
    
        var autho:Bool = false
    switch Authorization.selectedSegmentIndex {
    case 0:
    autho = true
    break
    case 1:
    autho = false
    break
    default: break
    }
        comingPerson?.authorisation = autho
        if NameField.text != "", NameField.text != nil {
            comingPerson?.name = NameField.text
        }
        if surnameField.text != "", surnameField.text != nil {
            comingPerson?.surname = surnameField.text
        }

        if departmentField.text != "", departmentField.text != nil {
            comingPerson?.Department = departmentField.text
        }
        if emailField.text != "", emailField.text != nil {
             comingPerson?.email = emailField.text
        }
        if passwordField.text != "", passwordField.text != nil {
            comingPerson?.password = passwordField.text
        }
    

    self.navigationController?.popViewController(animated: true)
    
    }
    @IBAction func uploadImage(_ sender: Any) {
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
                let name = String(describing: comingPerson?.personID)
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
    

}
