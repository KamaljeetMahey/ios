//
//  ContactDetailsVC.swift
//  ContactsAppTask_Kamaljeet
//
//  Created by Paras  on 02/03/23.
//

import UIKit

class ContactDetailsVC: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var contactImage: UIImageView!{
        didSet{
                contactImage.layer.cornerRadius = 75
        }
    }
    
    @IBOutlet weak var contactTF: UITextField!
    
    
    @IBOutlet weak var msgButton: UIButton! {
        didSet{
            msgButton.backgroundColor = .white
            msgButton.layer.cornerRadius = 15
            msgButton.layer.borderWidth = 0.5
        }
    }
    
    @IBOutlet weak var emailButton: UIButton!{
        didSet{
            emailButton.backgroundColor = .white
            emailButton.layer.cornerRadius = 15
            emailButton.layer.borderWidth = 0.5
        }
    }
    
    @IBOutlet weak var callButton: UIButton!{
        didSet{
            callButton.backgroundColor = .white
            callButton.layer.cornerRadius = 15
            callButton.layer.borderWidth = 0.5
        }
    }
    
    @IBOutlet weak var detailTableView: UITableView!
    
    
    
    //MARK: Objects
    var contactMod = ContactMod.contactMod
    var sortContacts = SortContacts.sortContacts
    var alertActions = AlertAction()
    var CLVC = ContactListVC()
    var contactDataRepo = ContactDataRepository()
    
    
    //MARK: Properties
    
    var data: (Contact, IndexPath)?
    var currID = UUID()
    var updatedContact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Navigation Bar Items
        navigationItem
            .rightBarButtonItems =
        [
            UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteContact)),
            UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(updateContact))
        ]
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {

        setDataValues()
        
        currID = data!.0.id
        print(currID)
        detailTableView.reloadData()
        
    }
    
    
    // MARK: Prepare Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let vc = segue.destination as? EditContactVC else{return}
            
        vc.currID = currID
        
        }
        
        
    
    
    
    
    // MARK: Functions
    
    func setDataValues() {
        
        contactTF.text = " \(data?.0.fullName ?? "")"
        
    }
    

    // Delete Contact
    @objc func deleteContact() {
        
        let alertController = alertActions.deleteContactAlert()
        alertController.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: {
            UIAlertAction in
            

            if self.contactDataRepo.delete(id: self.data!.0.id){
                print("Contact Deleted")
            }else{
                print("Failed To Delete Contact")
            }
            self.navigationController?.popViewController(animated: true)
            
            }
          )
        )
        
        present(alertController, animated: true)
        
    }
    
    
    
    // Update Contact
    @objc func updateContact(){
        
        performSegue(withIdentifier: "ToEditContact", sender: nil)
        
    }
    
    
    //Displaying Updated Contcat
    func updatedContact(id: UUID){
        
        let contact = contactDataRepo.getCDContact(byIdentifier: id)
        contactTF.text = contact!.fullName
        
        
        
    }
    
}

