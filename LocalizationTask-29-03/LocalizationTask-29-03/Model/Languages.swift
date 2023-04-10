//
//  Languages.swift
//  LocalizationTask-29-03
//
//  Created by Paras  on 29/03/23.
//

import Foundation

struct Language: Hashable{
    
    var identifier : String
    
    var language: String
    
}

enum LanguageEnum: String {
    case hindi = "hi"
    case english = "en"
    case arabic = "ar"
}
