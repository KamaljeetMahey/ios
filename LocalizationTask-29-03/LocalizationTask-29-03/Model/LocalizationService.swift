//
//  LocalizationService.swift
//  LocalizationTask-29-03
//
//  Created by Paras  on 29/03/23.
//

import Foundation


extension String{
    
    
    func localized(_ language: LanguageEnum) -> String {
           let path = Bundle.main.path(forResource: language.rawValue, ofType: "lproj")
           let bundle: Bundle
           if let path = path {
               bundle = Bundle(path: path) ?? .main
           } else {
               bundle = .main
           }
           return localized(bundle: bundle)
       }
    
    private func localized(bundle: Bundle) -> String {
           return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
       }
    
}


class LocalizationService {

    static let shared = LocalizationService()
    static let changedLanguage = Notification.Name("changedLanguage")
    
    var viewModel = ViewModel()

    private init() {}
    
    var language: LanguageEnum {
        get {
            guard let languageString = UserDefaults.standard.string(forKey: "language") else {
                            return .english
                        }
            return LanguageEnum(rawValue: languageString) ?? .english
            
        }
        set{
            if newValue != language {
                            UserDefaults.standard.setValue(newValue.rawValue, forKey: "language")
                            NotificationCenter.default.post(name: LocalizationService.changedLanguage, object: nil)
                        }
        }
    }
}
