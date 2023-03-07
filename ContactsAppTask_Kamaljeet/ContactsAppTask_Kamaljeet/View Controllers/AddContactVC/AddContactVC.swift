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
    var addContactDelegate:AddContactDelegate!
    var contactDetailsVC = ContactDetailsVC()
    var contactListVC = ContactListVC()
    
    
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
    var data : (Contact,IndexPath)?
    var Change = UIButton()
    var ChangeLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        checkForData()
        
        
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
    
    //Check For Data (For Editing Mode)
    func checkForData(){
        if data != nil{
            numOfRows += data?.0.number.count ?? 1
   
        }
    }
    
    
    
    func getNumberArray() -> [String]{
        var numbers: [String] = []
        for cell in addContactArr{
            if let number = cell?.addMobile.text{
                if number != ""{
                    numbers.append(number)
                }
            }
        }
        return numbers
    }
    
    
    
}



