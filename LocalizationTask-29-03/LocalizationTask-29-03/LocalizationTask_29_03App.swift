//
//  LocalizationTask_29_03App.swift
//  LocalizationTask-29-03
//
//  Created by Paras  on 29/03/23.
//

import SwiftUI

@main
struct LocalizationTask_29_03App: App {
    
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    
    var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            if language.rawValue == "ar"{
                ContentView()
                    .environment(\.layoutDirection, .rightToLeft)
                    .environment(\.locale, .init(identifier: language.rawValue))
                    .environmentObject(viewModel)
            }else{
                ContentView()
                    .environment(\.locale, .init(identifier: language.rawValue))
                    .environmentObject(viewModel)
                
            }
        }
    }
}
