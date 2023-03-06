//
//  AddContactVC.swift
//  ContactsAppTask_Kamaljeet
//
//  Created by Paras  on 02/03/23.
//

import UIKit

class AddContactVC: UIViewController {

    //MARK: Objects
    var contactMod = ContactMod.contactMod
    var addNumberCell = AddNumberCell()
    
    //MARK: Outlets
    
    @IBOutlet weak var addTableView: UITableView!
    
    @IBOutlet weak var contactImage: UIImageView!{
        didSet{
                contactImage.layer.cornerRadius = 75
        }
    }
    
    @IBOutlet weak var addPhotoButton: UIButton!
    
    @IBOutlet weak var firstNameTF: UITextField!
    
    @IBOutlet weak var lastNameTF: UITextField!
    
    @IBOutlet weak var companyNameTF: UITextField!
    
    
    
    //MARK: Properties
    var numOfRows = 1
    var addContactArr:[DeleteCell?] = [nil]
    var dataModel = [TextFieldModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveContact))
        
        addTableView.isEditing = true
        addTableView.allowsSelectionDuringEditing = true
        
        for _ in 0..<10 {
            dataModel.append(TextFieldModel(textData: ""))
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addTableView.reloadData()
    }
    
    
    @objc func saveContact(){
        
        
        var company = companyNameTF.text
        let number = ["1111111111"]
        if company == ""{
            company = "None"
        }
        
        contactMod.addContact(firstName: firstNameTF.text ?? "", lastName: lastNameTF.text ?? "", number: number, company: company!)
        
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }

    }
    
}



