//
//  PasswordChangeViewController.swift
//  DENEME
//
//  Created by Admin on 24/07/2017.
//  Copyright © 2017 Melis Gülenay. All rights reserved.
//

import UIKit

class PasswordChangeViewController: UIViewController {
    @IBOutlet weak var oldPasswordTextBox: UITextField!
    
    @IBOutlet weak var newPasswodTextBox: UITextField!
    
    @IBOutlet weak var confirmPasswordTextBox: UITextField!
    var comingPerson:Person?
    override func viewDidLoad() {
        super.viewDidLoad()
        oldPasswordTextBox.isSecureTextEntry = true
        newPasswodTextBox.isSecureTextEntry = true
        confirmPasswordTextBox.isSecureTextEntry = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func cancelChangePassword(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func changePassword(_ sender: Any) {
        oldPasswordTextBox.layer.cornerRadius = 10
        newPasswodTextBox.layer.cornerRadius = 10
        confirmPasswordTextBox.layer.cornerRadius = 10
        
        if newPasswodTextBox.text != "", confirmPasswordTextBox.text != "", oldPasswordTextBox.text != "" {
            if newPasswodTextBox.text == confirmPasswordTextBox.text && oldPasswordTextBox.text == comingPerson?.password {
                if (newPasswodTextBox.text?.characters.count)! < 6 {
                    let confirmAlertControl = UIAlertController(title: "Pasword shoul be at least 6 characters long", message: "Please try again.", preferredStyle: .alert)
                    
                    let cancelAction = UIAlertAction(title: NSLocalizedString("OK!",comment: ""), style: .cancel, handler: nil)
                    confirmAlertControl.addAction(cancelAction)
                    present(confirmAlertControl, animated: true, completion: nil)
                }
                else{
                    comingPerson?.password = newPasswodTextBox.text

                }
            }
            else if oldPasswordTextBox.text != comingPerson?.password{
                let confirmAlertControl = UIAlertController(title: "Wrong passwod validation", message: "Please try again.", preferredStyle: .alert)
                
                let cancelAction = UIAlertAction(title: NSLocalizedString("OK!",comment: ""), style: .cancel, handler: nil)
                confirmAlertControl.addAction(cancelAction)
                present(confirmAlertControl, animated: true, completion: nil)
            }
            else{
                let confirmAlertControl = UIAlertController(title: "New entered passwords were not matched.", message: "Please try again.", preferredStyle: .alert)
                
                let cancelAction = UIAlertAction(title: NSLocalizedString("OK!",comment: ""), style: .cancel, handler: nil)
                confirmAlertControl.addAction(cancelAction)
                present(confirmAlertControl, animated: true, completion: nil)
            }
            
        }
        else{
            let confirmAlertControl = UIAlertController(title: "All the blanks should be filled.", message: "Please try again.", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: NSLocalizedString("OK!",comment: ""), style: .cancel, handler: nil)
            confirmAlertControl.addAction(cancelAction)
            present(confirmAlertControl, animated: true, completion: nil)
        }
        self.navigationController?.popViewController(animated: true)
    }
 

}
