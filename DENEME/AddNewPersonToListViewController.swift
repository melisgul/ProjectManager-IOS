//
//  AddNewPersonToListViewController.swift
//  DENEME
//
//  Created by Admin on 24/07/2017.
//  Copyright © 2017 Melis Gülenay. All rights reserved.
//

import UIKit

class AddNewPersonToListViewController: BaseViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate    {

    @IBOutlet weak var NameField: UITextField!
    
    @IBOutlet weak var surnameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var personIDField: UITextField!
    
    @IBOutlet weak var pickerForDepartments: UIPickerView!
    @IBOutlet weak var Authorization: UISegmentedControl!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var departmentField: UITextField!
    var departments = ["Mobile Development Software Programmer ", "Mobile Development Analyst"]
    override func viewDidLoad() {
        super.viewDidLoad()
        NameField.layer.cornerRadius = 10
        surnameField.layer.cornerRadius = 10
        personIDField.layer.cornerRadius = 10
        NameField.layer.cornerRadius = 10
        passwordField.layer.cornerRadius = 10
        departmentField.layer.cornerRadius = 10
        print("hellooooooooooo")
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
    
    @IBAction func AddPersonButton(_ sender: Any) {
        
        if NameField.text == "", surnameField.text == "", personIDField.text == "", NameField .text == "",passwordField.text == "", departmentField.text == "" {
            let confirmAlertControl = UIAlertController(title: "All the text fields should be filled", message: "Please try again.", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: NSLocalizedString("OK!",comment: ""), style: .cancel, handler: nil)
            confirmAlertControl.addAction(cancelAction)
            present(confirmAlertControl, animated: true, completion: nil)
        }
        else{
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
            
            let newPerson = Person(NameField.text!, surnameField.text!, departmentField.text!, Int(personIDField.text!)!, passwordField.text!, autho, email: emailField.text!)
            DatabaseManager.myObj.PersonList.append(newPerson)
        }
        
       self.navigationController?.popViewController(animated: true)
        
    }


}
