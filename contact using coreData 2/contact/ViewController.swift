import UIKit


class ViewController: UIViewController {
    
    //MARK: PROPERTIES
    
    @IBOutlet var searchBarText: UISearchBar!
    var filteredData = [Contacts]()
    var alphabets = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    @IBOutlet var myTable: UITableView!
    
    @IBOutlet weak var searchBar: NSLayoutConstraint!
    
    
    private let allContacts: ContactData = ContactData()
    var contactArray = [Contacts]()
    
    var staticData = Data()
    var sectionTitle = [String]()
    var contactDict = [String:[Contacts]]()
    
    override func viewWillAppear(_ animated: Bool) {
        staticData.makeArray()
        contactArray = staticData.contactsArray
        makeDict(in: contactArray)
        
        self.myTable.reloadData()
    }
    
    //MARK: METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contacts"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        
        self.navigationItem.rightBarButtonItem =
        UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addCountry))
    }
    
    func makeDict(in contact: [Contacts]){
        
        var section = [String]()
        for i in contact{
            if i.getFullName() != ""{
                section.append(String(i.getFullName().prefix(1)))
            }
        }
        
        sectionTitle = Array(Set(section))
        sectionTitle.sort()
        sectionTitle.append("#")
        
        
        for stitle in sectionTitle{
            contactDict[stitle] = [Contacts]()
        }
        
        for cont in contact{
            if cont.getFullName() != ""{
                contactDict[String(cont.getFullName().prefix(1))]?.append(cont)
            }
            else{
                contactDict["#"]?.append(cont)
            }
            
        }
        for (key, _) in contactDict {
            contactDict[key] = contactDict[key]?.sorted(by: {
                $0.getFullName().uppercased() < $1.getFullName().uppercased()
            })
        }
        
    }
    
    
    
    //MARK: for + button
    @objc func addCountry(){
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    @IBAction func unwindToFirst(_ sender: UIStoryboardSegue){}
}
    
         
         
         
//MARK: Extension of Viewcontroller class

extension ViewController:UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
         
         //MARK: for number of rows in sections in table
         func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return contactDict[sectionTitle[section]]?.count ?? 0
         }
         
    
        //MARK: To display cell in tableview
         func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = myTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
             cell.textLabel?.text = contactDict[sectionTitle[indexPath.section]]?[indexPath.row].getFullName()
         return cell
         }
    
         //MARK: for number of sections in table
         func numberOfSections(in tableView: UITableView) -> Int {
         return sectionTitle.count
         }
         
         //MARK: to display all the sections on the right side
         func sectionIndexTitles(for tableView: UITableView) -> [String]? {
         return alphabets
         }
    
         func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
             guard let mainTitle = sectionTitle.firstIndex(where: { $0 == title}) else{
                 guard let secondTitle = sectionTitle.firstIndex(where: {$0 == title}) else{
                     return 0
                 }
                 return secondTitle - 1
             }
             return mainTitle
         }
    
         //MARK: to display section name on header
         func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
         return sectionTitle[section]
         }
         
         //MARK: Method to perform action when selecting row
         func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "secondViewController") as! secondViewController
             secondVC.coName = (contactDict[sectionTitle[indexPath.section]]?[indexPath.row].getFullName(),contactDict[sectionTitle[indexPath.section]]![indexPath.row].mobile)
             secondVC.fName = contactDict[sectionTitle[indexPath.section]]?[indexPath.row].firstName
            secondVC.sName = contactDict[sectionTitle[indexPath.section]]?[indexPath.row].secondName
             secondVC.indexp = (indexPath,self)
             secondVC.identity = contactDict[sectionTitle[indexPath.section]]![indexPath.row].id
         self.navigationController?.pushViewController(secondVC, animated: true)
         
         
         }
         
         //MARK: Trailing actions
         func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {


         let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {
             (deleteAction,view,completion) in
             _ = self.contactDict[self.sectionTitle[indexPath.section]]?[indexPath.row]
             let alert1 = UIAlertController(title: "Delete Operation", message: "delete name of country", preferredStyle: .alert)

             let remove = UIAlertAction(title: "Remove", style: .default){ (deleteAction) in

             self.contactDict[self.sectionTitle[indexPath.section]]?.remove(at: indexPath.row)
             self.myTable.deleteRows(at: [indexPath], with: .fade)
             self.myTable.deleteRows(at: [indexPath], with: .fade)

             completion(true)
             
             self.myTable.reloadData()
             
             }

             let cancel = UIAlertAction(title: "cancel", style: .cancel){(deleteAction) in
             print("ended")
             }
             alert1.addAction(remove)
             alert1.addAction(cancel)

             self.present(alert1, animated: true, completion: nil)



            }
        return UISwipeActionsConfiguration(actions: [deleteAction])
        }
         
         
         //MARK: Method to implement search bar
         func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
             if searchText != ""{
                 filteredData = contactArray.filter{$0.getFullName().contains(searchText)}
                 makeDict(in: filteredData)
                 myTable.reloadData()
             }
             else{
                filteredData = contactArray
                makeDict(in: filteredData)
             myTable.reloadData()
         }
    }
         
         
}
      
extension UIViewController{
    func hideKeyboard(){
        let tapping = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tapping.cancelsTouchesInView = false
        view.addGestureRecognizer(tapping)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}
