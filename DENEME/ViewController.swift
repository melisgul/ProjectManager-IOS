//
//  ViewController.swift
//  DENEME
//
//  Created by Admin on 17/07/2017.
//  Copyright © 2017 Melis Gülenay. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController,UNUserNotificationCenterDelegate {
    @IBOutlet weak var LoginTextBox: UITextField!
    @IBOutlet weak var RememberMe: UISwitch!
    @IBOutlet weak var imageView: UIImageView!
    var remember:Bool = false
    @IBOutlet weak var PasswordTextBox: UITextField!
    @IBOutlet weak var remindMe: UISwitch!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoginTextBox.text = ""
        PasswordTextBox.text = ""
        RememberMe.setOn(false, animated: false)
        self.navigationItem.leftBarButtonItem?.title = "Logout"
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge], completionHandler: {didAllow, error in})
        UNUserNotificationCenter.current().delegate = self
        UIApplication.shared.registerForRemoteNotifications()
        if remindMe.isOn == true{
            makeReminder()
            self.loadView()
        }
        else{
            deleteNotifications()
            self.loadView()

        }
    }
    

    func makeReminder(){
        print("makereminder")
        let date = Date()
        let calendar = Calendar.current

        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        
        var dateComponents = DateComponents()
        dateComponents.hour = 15
        dateComponents.minute = 06
        let content = UNMutableNotificationContent()
        content.title = "Don't forget to enter your daily task hours"
        content.subtitle = "If you have already entered, take no notice!"
        content.badge = 1
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
       // let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: {
            error in
            if error != nil {
                NSLog(error.debugDescription)
            }else{
                NSLog("success")
            }
        })
        
    }
    
    func deleteNotifications(){
        print("delete me")
      //  UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["ViewController"])
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UIApplication.shared.applicationIconBadgeNumber = 0
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        deleteNotifications()

        let id:Int? = UserDefaults.standard.integer(forKey: "rememberMe")
        if  id != nil {
            let person = DatabaseManager.myObj.findPerson(id!)
            if person.name != "-1" {
                LoginTextBox.text = String(describing: person.personID!)
                PasswordTextBox.text = person.password
                let imageURL = getDocumentsDirectory().appendingPathComponent(String(describing: id) + ".png")
                let fileManager = FileManager.default
                let path = imageURL.path
                if fileManager.fileExists(atPath: path) {
                    imageView.image = UIImage(contentsOfFile: imageURL.path)
                }
                else {
                    imageView.image = UIImage(named: "images")
                }
                RememberMe.setOn(true, animated: true)
            }
        }
        else{
            LoginTextBox.text = " "
            PasswordTextBox.text = " "
            RememberMe.setOn(false, animated: false)
            RememberMe.isOn = false
        }

    }
    
    
    
   
    @IBAction func LoginButton(_ sender: Any) {
        makeReminder()
        let id = Int(LoginTextBox.text!)
        let password = PasswordTextBox.text
        if (LoginTextBox.text != nil) && (PasswordTextBox.text != nil),(LoginTextBox.text != "") && (PasswordTextBox.text != "") {
            let validation = DatabaseManager.myObj.passwordValidation(id!, password!)
        if validation == true {
            let found = DatabaseManager.myObj.findPerson(id!)
            if found.authorisation == false {
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let data = storyBoard.instantiateViewController(withIdentifier: "PersonalAccessViewController") as! PersonalAccessViewController
                data.comingPerson = found
                if RememberMe.isOn == true{
                    let defaults = UserDefaults.standard
                    defaults.set(Int(id!), forKey: "rememberMe")
                }
                else{
                    UserDefaults.standard.removeObject(forKey: "rememberMe")
                    LoginTextBox.text = ""
                    PasswordTextBox.text = ""
                    imageView.image = UIImage(named: "images")

                }

                self.navigationController?.pushViewController(data, animated: true)
                }
            else {
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let data = storyBoard.instantiateViewController(withIdentifier: "FirstOptionPageViewController") as! FirstOptionPageViewController
                if RememberMe.isOn == true{
                    let defaults = UserDefaults.standard
                    defaults.set(Int(id!), forKey: "rememberMe")                }
                else{
                    UserDefaults.standard.removeObject(forKey: "rememberMe")
                    LoginTextBox.text = ""
                    PasswordTextBox.text = ""
                    imageView.image = UIImage(named: "images")

                }


                self.navigationController?.pushViewController(data, animated: true)
            }
            
        }
     else{
                    let confirmAlertControl = UIAlertController(title: "Wrong personID or password", message: "Please try again.", preferredStyle: .alert)
            
                    let cancelAction = UIAlertAction(title: NSLocalizedString("OK!",comment: ""), style: .cancel, handler: nil)
                    confirmAlertControl.addAction(cancelAction)
                    present(confirmAlertControl, animated: true, completion: nil)
        }
        }
        else{
            let confirmAlertControl = UIAlertController(title: "Both Text Fields should be filled.", message: "Please try again.", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: NSLocalizedString("OK!",comment: ""), style: .cancel, handler: nil)
            confirmAlertControl.addAction(cancelAction)
            present(confirmAlertControl, animated: true, completion: nil)
        }
    }
 
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        NSLog("Local notification received.")
    }

}

