//
//  StaticTaskInfoViewController.swift
//  DENEME
//
//  Created by Admin on 27/07/2017.
//  Copyright © 2017 Melis. All rights reserved.
//

import UIKit

class StaticTaskInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var staticTableView: UITableView!

    @IBOutlet weak var cellTaskID: UITableViewCell!
    @IBOutlet weak var cellTaskName: UITableViewCell!
    @IBOutlet weak var cellProjectName: UITableViewCell!
    @IBOutlet weak var cellStartDate: UITableViewCell!
    @IBOutlet weak var cellEndDate: UITableViewCell!
    @IBOutlet weak var cellEstimatedCost: UITableViewCell!
    @IBOutlet weak var cellRemainingCost: UITableViewCell!
    @IBOutlet weak var cellPersonAssigned: UITableViewCell!
    @IBOutlet weak var cellStatusInfo: UITableViewCell!
    
    

}
