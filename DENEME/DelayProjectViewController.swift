//
//  DelayProjectViewController.swift
//  DENEME
//
//  Created by Admin on 26/07/2017.
//  Copyright © 2017 Melis Gülenay. All rights reserved.
//

import UIKit

class DelayProjectViewController: BaseViewController {
    var comingProject:Project?
    override func viewDidLoad() {
        super.viewDidLoad()
        EndDatePicker.setDate((comingProject?.projectEndDate)!, animated: true)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var EndDatePicker: UIDatePicker!
    
    @IBAction func DelayProjectButton(_ sender: Any) {
        comingProject?.projectEndDate = EndDatePicker.date
        self.navigationController?.popViewController(animated: true)
        
    }
    

}
