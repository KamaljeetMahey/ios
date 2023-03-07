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
    
    
    //MARK: Properties
    
    var data: (Contact, IndexPath)?
    
    
    
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
        detailTableView.reloadData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! AddContactVC
        
        vc.data = self.data
        vc.contactDetailsVC = self
        
    }
    
    // MARK: Functions
    
    func setDataValues() {
        
        contactTF.text = " \(data?.0.fullName ?? "")"
        
        
    }
    

    
    @objc func deleteContact() {
        
        let alertController = alertActions.deleteContactAlert()
        alertController.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: {
            UIAlertAction in
            
            self.contactMod.deleteContact(indexPath: self.data!.1)
            self.sortContacts.sectionTitles.remove(at: self.data!.1.section)
            
            self.navigationController?.popViewController(animated: true)
            
            }
          )
        )
        
        present(alertController, animated: true)
        
    }
    
    
    
    @objc func updateContact(){
        
        performSegue(withIdentifier: "ToEditContact", sender: nil) 
        
            
        
    }
}

