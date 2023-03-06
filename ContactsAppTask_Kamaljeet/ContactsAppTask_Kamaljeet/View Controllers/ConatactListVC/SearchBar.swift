//
//  SearchBar.swift
//  ContactsAppTask_Kamaljeet
//
//  Created by Paras  on 03/03/23.
//

import Foundation
import UIKit

extension ContactListVC: UISearchBarDelegate{
    
    @objc func filterData() {
        guard let text = searchController.searchBar.searchTextField.text else {
            return
        }
        
        resetData()
        
        if text != "" {
            for (key, _) in sortedContactListTemp {
                sortedContactListTemp[key] = sortedContactListTemp[key]?.filter{
                    $0.fullName.lowercased().contains(text.lowercased())
                }
            }
        }
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        resetData()
        tableView.reloadData()
    }
    
    func resetData() {
        sortedContactListTemp = sortContacts.sortedContactList
        sectionTitlesTemp = sortContacts.sectionTitles
    }
}

