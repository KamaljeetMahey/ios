//
//  ChangeLanguage.swift
//  LocalizationTask-29-03
//
//  Created by Paras  on 29/03/23.
//

import SwiftUI


struct ChangeLanguage: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
//    let sysLang= Locale(identifier: Locale.current.identifier)
    
    var body: some View {
        
        
        NavigationStack{
            
            List{
                
                ForEach(viewModel.languages, id: \.identifier){
                    
                    lang in
                    
                    Text(lang.language)
                    
                }
                
                
            }
            .navigationTitle("Language Selection")
            .toolbar{
                EditButton()
            }
            
        }
        
    }//View End
    
}


struct ChangeLanguage_Previews: PreviewProvider {
    static var previews: some View {
        ChangeLanguage()
            .environmentObject(ViewModel())
    }
}
