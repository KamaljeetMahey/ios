//
//  ChooseLanguage.swift
//  swiftui01
//
//  Created by Paras  on 29/03/23.
//

import SwiftUI

struct Language{
    
     var id: UUID = UUID()
    
    var Language: String
    
}

struct ChooseLanguage: View {
    
    @State var languages:[Language] = [Language(Language: "English"),Language(Language: "Hindi"), Language(Language: "Arabic")]

    @State var chosenLang = "en"
    
    var body: some View {
        List{
            
            ForEach(languages, id: \.id){ lang in
                
                Text(lang.Language)
                
                
            }
            
            
        }
    }
}

struct ChooseLanguage_Previews: PreviewProvider {
    static var previews: some View {
        ChooseLanguage()
            
    }
}
