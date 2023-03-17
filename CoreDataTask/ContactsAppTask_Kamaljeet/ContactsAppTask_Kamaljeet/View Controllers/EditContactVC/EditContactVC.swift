//
//  EditContactVC.swift
//  ContactsAppTask_Kamaljeet
//
//  Created by Paras  on 16/03/23.
//

import UIKit

class EditContactVC: UIViewController {

    //MARK: Reference
    var contactDataRepo = ContactDataRepository()
    
    
    //MARK: Outlets
    
    @IBOutlet weak var firstNameTF: UITextField!
    
    @IBOutlet weak var lastNameTF: UITextField!
    
    @IBOutlet weak var companyTF: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    //MARK: Properties
    var numOfRows = 1
    var editCellArr:[EditCell2?] = [nil]
    var currID = UUID()
    var cdContact: CDContact?
    var numToEdit = [String?] ()
    
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(editDone))
        
        
        tableView.isEditing = true
        tableView.allowsSelectionDuringEditing = true
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        setEditingData()
        
        numOfRows += cdContact!.number!.count
        numToEdit = (cdContact?.number)!
        tableView.reloadData()
        
    }

    
    
    //MARK: Functions
    
    @objc func editDone(){
        
        let numbers = generateNumberArray()!
        
        let contact = Contact(firstName: firstNameTF.text!, lastName: lastNameTF.text!, number: numbers, company: companyTF.text!, id: (cdContact?.id)!)
        
        if contactDataRepo.update(contact: contact){
            print("contact updated")
        }else{
            print("couldnt update contact")
        }
        
        
        
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
        
        
    }
    

    func setEditingData(){
        
        cdContact = contactDataRepo.getCDContact(byIdentifier: currID)!
        
        guard let fname = cdContact?.firstName,let lname = cdContact?.lastName,let cname = cdContact?.company else{
            print("data not found")
            return
            
        }
        
        
        firstNameTF.text = fname
        lastNameTF.text = lname
        companyTF.text = cname
        
        
    }
    
    
    //Get Numbers From text field
    func generateNumberArray() -> [String]?{
         
        var numbers = [String]()
        
        for cell in editCellArr{
            if let editedNumber = cell?.numberTF.text{
                if editedNumber != ""{
                    numbers.append(editedNumber)
                }
            }
        }
        return numbers
    }
    
    
}
