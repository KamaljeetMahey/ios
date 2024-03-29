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
    
    
    //MARK: Objects
    var alertActions = AlertAction()
    var contactMod = ContactMod.contactMod
    var staticData = ContactStaticData()
    var sortContacts = SortContacts.sortContacts
    let searchController = UISearchController()
    
    //MARK: Properties
    
    var sortedContactListTemp: [String: [Contact]] = [:]
    var sectionTitlesTemp: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Navigation Items
            //Add Button
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButton))
        
            //Search Bar
            navigationItem.searchController = searchController
//            navigationItem.hidesSearchBarWhenScrolling = false
            searchController.searchBar.searchTextField.addTarget(self, action: #selector(filterData), for: .editingChanged)
            searchController.searchBar.delegate = self
        
        
        
        
        // setting height of cell
        self.tableView.rowHeight = 55.0
        
        contactMod.generateDataArray()
        
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




//MARK: Methods
    
extension ContactListVC:AddContactDelegate{
    
    
    // Navigation Add Button
    @objc func addButton(){
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddContactVC") as! AddContactVC
        
        vc.addContactDelegate = self
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    // Saving Contact using Delegate Pattern
    func addContact(firstName first: String, lastName last: String, company: String, number: [String]) {
        
        
        let contact = Contact(firstName: first, lastName: last, number: number, company: company)
        contactMod.contactDataArray.insert(contact, at: 0)
        
    }
}
