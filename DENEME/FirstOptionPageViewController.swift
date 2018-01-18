//
//  FirstOptionPageViewController.swift
//  DENEME
//
//  Created by Admin on 17/07/2017.
//  Copyright © 2017 Melis Gülenay. All rights reserved.
//

import UIKit




class FirstOptionPageViewController: UIViewController {
    @IBOutlet weak var buttonForProject: UIButton!
    @IBOutlet weak var buttonForPerson: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonForPerson.layer.cornerRadius = 15
        let buttonItem = UIBarButtonItem(title: "Logout", style: .plain, target:self, action:#selector(buttonTapped(_:)))
        self.navigationItem.setLeftBarButton(buttonItem, animated: true)
        // Do any additional setup after loading the view.
    }
    
    func buttonTapped(_ sender:UIBarButtonItem){
        self.navigationController?.popViewController(animated: true)
    }
    /*     let style = UIBarButtonItemStyle(rawValue: 1)
     let buttonItem = UIBarButtonItem(title: "Logout", style: style!, target:self, action: #selector(buttonTapped(_:)))
     self.navigationItem.leftBarButtonItem?.title = "Logout"
     self.navigationItem.setRightBarButton(buttonItem, animated: true) */
 /*   func buttonTapped(_ sender:UIBarButtonItem){
        self.navigationController?.popViewController(animated: true)
    }*/
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
 
    


}
