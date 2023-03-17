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
    var sortContacts = SortContacts.sortContacts
    var contactDetailsVC = ContactDetailsVC()
    var contactListVC = ContactListVC()
    var contactDataRepo = ContactDataRepository()
    
    
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
    var data : (Contact,IndexPath)?
    var Change = UIButton()
    var ChangeLabel = UILabel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Keyboard Handling
        initializeHideKeyboard()
        
        firstNameTF.delegate = self
        lastNameTF.delegate = self
        companyNameTF.delegate = self
        
        firstNameTF.tag = 1
        lastNameTF.tag = 2
        companyNameTF.tag = 3
        
        
        //Navigation Bar Save Button
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveContact))
        
        
        //Table View Editing
        addTableView.isEditing = true
        addTableView.allowsSelectionDuringEditing = true
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        addTableView.reloadData()
    }
    
    
    
    
    
}



// KEYBOARD HANDLING
extension AddContactVC: UITextFieldDelegate {
    
    func initializeHideKeyboard(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissMyKeyboard))
        
        //to set the tap gesture recognizer in view
        view.addGestureRecognizer(tap)
        
        //to make the table view touch respond
        tap.cancelsTouchesInView = false
    }
    
    @objc func dismissMyKeyboard(){
        view.endEditing(true)
    }
    
    //return key in keyboard
    //check for next text fields and move to them
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let nextField = self.view.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return false
    }
    
    
}


