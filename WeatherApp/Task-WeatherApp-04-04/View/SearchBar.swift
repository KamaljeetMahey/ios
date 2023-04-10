//
//  SearchBar.swift
//  Task-WeatherApp-04-04
//
//  Created by Paras  on 04/04/23.
//

import SwiftUI

struct SearchBar: View {
    
    @EnvironmentObject var contentViewModel: ContentViewModel
    @State var showSearchBar = false
    
    
    var body: some View {
        
        HStack{
            
            //Search Bar TextField
            if showSearchBar{
                
                
                TextField(text: $contentViewModel.inputLocation) {
                    
                    Text("Set lat/long")
                        .bold()
                    
                }
                .foregroundColor(.white)
                .frame(width: 175, height: 20)
                .offset(x:25)
                .multilineTextAlignment(.center)
                
                
            }
            else{
                //City and Country Label
                HStack{
                    
                    //Pin image
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(.red)
                        .offset(x:17)
                    
                    
                    //City Name And Country Label
                    Text("\(contentViewModel.forecastData?.city?.name ?? contentViewModel.inputLocation)  \(contentViewModel.forecastData?.city?.country ?? "") ")
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .fontWeight(.semibold)
                        .frame(width: 175, height: 20)
                        .offset(x:12)
                    
                }
            }
            
            
            //Button to toggle Search bar and City Label
            Button {
                if showSearchBar{
                   
                    contentViewModel.getWeatherData()
                    
                }
                showSearchBar.toggle()
                
                
            } label: {
                Image(systemName: "magnifyingglass.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
            }
            .offset(x:65)
           
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
            .environmentObject(ContentViewModel())
    }
}
