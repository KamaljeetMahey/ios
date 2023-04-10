//
//  ViewModel.swift
//  LocalizationTask-29-03
//
//  Created by Paras  on 29/03/23.
//

import Foundation


class ViewModel: ObservableObject{
    
    
    @Published var languages:[Language] = [Language(identifier: "en", language: "English"),Language(identifier: "hi", language: "Hindi"), Language(identifier: "ar", language: "Arabic")]
    
    
    @Published var selectedLang : Language = Language(identifier: "en", language: "English")
    
    
    
    
    
}
