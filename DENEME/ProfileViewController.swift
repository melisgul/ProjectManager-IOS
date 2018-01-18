//
//  ProfileViewController.swift
//  DENEME
//
//  Created by Admin on 19/07/2017.
//  Copyright © 2017 Melis Gülenay. All rights reserved.
//

import UIKit

class ProfileViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource, UISearchResultsUpdating  {

    @IBOutlet weak var searchBar: UISearchBar!
    var filteredData:[String] = []
    var isSearched = false
    var personNames:[String] = []
    let searchController = UISearchController(searchResultsController: nil)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        takePersonNames()
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        // If we haven't typed anything into the search bar then do not filter the results
        if searchController.searchBar.text! == "" {
            isSearched = false
            filteredData = personNames
        } else {
            isSearched = true
            // Filter the results
            filteredData = personNames.filter { $0.lowercased().contains(searchController.searchBar.text!.lowercased()) }
        }
        self.tableView.reloadData()
    }
    
    
    func takePersonNames(){
        for index in DatabaseManager.myObj.PersonList{
            personNames.append(index.name)
        }
    }

    @IBOutlet weak var tableView: UITableView!
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
        if isSearched == true{
            return filteredData.count
        }
        else {
            return DatabaseManager.myObj.PersonList.count

        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell") as! ProfileTableViewCell
        if isSearched == true {
            var person:[Person] = []
            for value in DatabaseManager.myObj.PersonList{
                for element in filteredData{
                    if value.name == element{
                        person.append(value)
                    }
                }
            }
            cell.Name.text = person[indexPath.row].name + " " + person[indexPath.row].surname
        }
        else {
            cell.Name.text = DatabaseManager.myObj.PersonList[indexPath.row].name + " " + DatabaseManager.myObj.PersonList[indexPath.row].surname
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let data = storyBoard.instantiateViewController(withIdentifier: "PersonInfoViewController") as! PersonInfoViewController
        if isSearched == true {
            var person:[Person] = []
            for value in DatabaseManager.myObj.PersonList{
                for element in filteredData{
                    if value.name == element{
                        person.append(value)
                    }
                }
            }
            data.personIDequal = person[indexPath.row].personID
        }
        else{
            data.personIDequal = DatabaseManager.myObj.PersonList[indexPath.row].personID!

        }
        self.navigationController?.pushViewController(data, animated: true)
        
    }
    @IBAction func addNewPerson(_ sender: Any) {
        performSegue(withIdentifier: "addpersonsegue", sender: nil)
    }

}
    


   

