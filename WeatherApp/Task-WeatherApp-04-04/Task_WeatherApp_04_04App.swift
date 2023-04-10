//
//  Task_WeatherApp_04_04App.swift
//  Task-WeatherApp-04-04
//
//  Created by Paras  on 04/04/23.
//

import SwiftUI

@main
struct Task_WeatherApp_04_04App: App {
    
    var contentViewModel = ContentViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(contentViewModel)
        }
    }
}
