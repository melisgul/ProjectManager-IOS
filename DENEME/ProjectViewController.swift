//
//  ProjectViewController.swift
//  DENEME
//
//  Created by Admin on 19/07/2017.
//  Copyright © 2017 Melis Gülenay. All rights reserved.
//

import UIKit

class ProjectViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Projects"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DatabaseManager.myObj.ProjectList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectTableViewCell") as! ProjectTableViewCell
        cell.ProjectName.text = DatabaseManager.myObj.ProjectList[indexPath.row].projectName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let data = storyBoard.instantiateViewController(withIdentifier: "ProjectInfoViewController") as! ProjectInfoViewController
        data.dataProjectId = DatabaseManager.myObj.ProjectList[indexPath.row].projectID
        self.navigationController?.pushViewController(data, animated: true)
    }
}
