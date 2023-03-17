//
//  ViewController.swift
//  ContactsAppTask_Kamaljeet
//
//  Created by Paras  on 02/03/23.
//

import UIKit

class ContactListVC: UIViewController {
    
    
    //MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: Reference
    var alertActions = AlertAction()
    var contactMod = ContactMod.contactMod
    var staticData = ContactStaticData()
    var sortContacts = SortContacts.sortContacts
    let searchController = UISearchController()
    let cdFunctions = CDFunctions()
    
    
    //MARK: Properties
    
    var sortedContactListTemp: [String: [Contact]] = [:]
    var sectionTitlesTemp: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Generate Core Data For 1st Time running the app then comment it out
        //cdFunctions.generateCD()
        
        
        
        // Navigation Items
            //Add Button
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButton))
        
            //Search Bar
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = false
            searchController.searchBar.searchTextField.addTarget(self, action: #selector(filterData), for: .editingChanged)
            searchController.searchBar.delegate = self
        
        
        
        
        // setting height of cell
        self.tableView.rowHeight = 55.0
        
        
        resetData()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        
        sortContacts.createSectionTitles(contactMod: contactMod)
        resetData()
        tableView.reloadData()
        
    }
    
    
    
    
    //MARK: Prepare Segue

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        guard let vc = segue.destination as? ContactDetailsVC else {
            return
        }
        vc.data = sender as? (Contact, IndexPath)
        
        
    }
    
}




    
extension ContactListVC{
    
    
    // Navigation Add Button
    @objc func addButton(){
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddContactVC") as! AddContactVC
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
