//
//  BaseClassViewController.swift
//  DENEME
//
//  Created by Admin on 28/07/2017.
//  Copyright © 2017 Melis. All rights reserved.
//

import UIKit

class BaseClassViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
             let style = UIBarButtonItemStyle(rawValue: 1)
         let buttonItem = UIBarButtonItem(title: "Logout", style: style!, target:self, action: #selector(buttonTapped(_:)))
         self.navigationItem.leftBarButtonItem?.title = "Logout"
         self.navigationItem.setRightBarButton(buttonItem, animated: true)

    }
       func buttonTapped(_ sender:UIBarButtonItem){
     self.navigationController?.popViewController(animated: true)
     }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    



}
