//
//  BaseViewController.swift
//  DENEME
//
//  Created by Admin on 28/07/2017.
//  Copyright © 2017 Melis Gülenay. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let buttonItem = UIBarButtonItem(title: "Logout", style: .plain, target:self, action: #selector(buttonTapped(_:)))
        self.navigationItem.setRightBarButton(buttonItem, animated: true)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func buttonTapped(_ sender:UIBarButtonItem){
        navigationController?.popToRootViewController(animated: true)
}
}
