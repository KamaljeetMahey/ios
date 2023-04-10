//
//  ContentView.swift
//  LocalizationTask-29-03
//
//  Created by Paras  on 29/03/23.
//


//Finalized


import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    
    var body: some View {
        NavigationStack{
        
        ScrollView{
            
            
            VStack {
                
                //ChangeLanguage
                HStack{
                    
                    Spacer()
                    
                    Menu{
                        
                        Button {
                            LocalizationService.shared.language = .english
                        } label: {
                            Text("English")
                        }
                        
                        Button {
                            LocalizationService.shared.language = .arabic
                        } label: {
                            Text("Arabic")
                        }
                        Button {
                            LocalizationService.shared.language = .hindi
                        } label: {
                            Text("Hindi")
                        }
                        
                    }label: {
                        Text("Menu-Label".localized(language))
                    }
                    
                }
                
                
                
                ProfileImageView()
                AddDetailView()
                    .padding(.bottom)
                HeightGenderView()
                SyncWithOtherApps()
                    .padding(.vertical)
            }
            .padding()
            }
            .background(Color.cyan.opacity(0.05))
            
        }// Scroll Ends
        
    }
        
    }// View Ends


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
            
    }
}
