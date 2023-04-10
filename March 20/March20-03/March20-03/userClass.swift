//
//  userClass.swift
//  March20-03
//
//  Created by Paras  on 20/03/23.
//

import Foundation

class User : ObservableObject {
    
    @Published var name:String = String()
    
}

class Account : ObservableObject {
    
    @Published var balance : Int = Int()
    
}
