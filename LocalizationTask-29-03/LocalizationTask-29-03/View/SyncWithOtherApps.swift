//
//  SyncWithOtherApps.swift
//  LocalizationTask-29-03
//
//  Created by Paras  on 29/03/23.
//

import SwiftUI

struct SyncWithOtherApps: View {
    
    @State var isAppleHalthEnabled = false
    
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    
    var body: some View {
        
        HStack{
            
            
            VStack(alignment: .leading){
                
                
                //Divider Text
                HStack{
                    VStack{
                        Divider()}
                    
                    Text("Sync-Better-Label".localized(language))
                        .layoutPriority(1)
                        
                    VStack{
                        Divider()
                    }
                }
                .padding(.vertical)
                
                
                //Apple Health
                HStack{
                    
                    Image( "apple-icon")
                        .resizable()
                        .frame(width: 40, height: 38)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .overlay(RoundedRectangle(cornerRadius: 8 ).stroke(.white, lineWidth: 1))
                        .padding(.leading)
                    
                    VStack(alignment: .leading){
                        Text("Apple-Health-Label".localized(language))
                            .bold()
                        
                        Text("Step-Floor-Glasses".localized(language))
                            .lineLimit(1)
                            .font(.caption)
                    }
                    
                    Toggle(isOn: $isAppleHalthEnabled) {
                        Text("")
                    }
                    .padding(.trailing)
                    
                }
                .padding(.top, 20)
                .padding(.bottom, 20)
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(.black, lineWidth: 0.5))
                .padding(.bottom, 20)
                
                //Fibit
                HStack{
                    
                    Image("fitbit-icon".localized(language))
                        .resizable()
                        .frame(width: 40, height: 38)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .overlay(RoundedRectangle(cornerRadius: 5 ).stroke(.white, lineWidth: 1))
                        .padding(.leading)
                    
                    VStack(alignment: .leading){
                        Text("Fitbit-Label".localized(language))
                            .bold()
                        
                        Text("Step-Floor-Glasses".localized(language))
                            .lineLimit(1)
                            .font(.caption)
                    }
                    
                    Toggle(isOn: $isAppleHalthEnabled) {
                        Text("")
                    }
                    .padding(.trailing)
                    
                }.padding(.vertical)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(.black, lineWidth: 0.5))
                
                //Sync Text
                HStack{
                    
                    Text("*")
                        .padding(.horizontal, 5.0)
                    
                    Text("Sync-Info-Label".localized(language))
                    
                }
                .padding(.top, 10)
                
                //Divider Text
                HStack{
                    VStack{
                        Divider()}
                    
                    Text("Pop-Settings-Label".localized(language))
                    VStack{
                        Divider()
                    }
                }
                .padding(.vertical)
                
                //Daily Tips
                HStack{
                    
                    Image("lotus")
                        .resizable()
                        .frame(width: 40, height: 38)
                        .overlay(RoundedRectangle(cornerRadius: 5 ).stroke(.white, lineWidth: 1))
                        .padding(.leading)
                    
                    VStack(alignment: .leading){
                        Text("Daily-Tips-Label".localized(language))
                            .bold()
                        
                        Text("Wellness-Tips".localized(language))
                            .lineLimit(1)
                            .font(.caption)
                    }
                    
                    Toggle(isOn: $isAppleHalthEnabled) {
                        Text("")
                    }
                    .padding(.trailing)
                    
                }.padding(.vertical)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(.black, lineWidth: 0.5))
                    .padding(.bottom,40)
                
                //Save Button
                Button {
                } label: {
                    Text("Save-Button-Label".localized(language))
                        .bold()
                }
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(.orange)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .padding(.top)
                

            }
            
        }
        
    }//View End
}

struct SyncWithOtherApps_Previews: PreviewProvider {
    static var previews: some View {
        SyncWithOtherApps()
    }
}
