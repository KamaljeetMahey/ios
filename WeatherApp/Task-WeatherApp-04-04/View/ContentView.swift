//
//  ContentView.swift
//  Task-WeatherApp-04-04
//
//  Created by Paras  on 04/04/23.
//

import SwiftUI

//Temp Humidity Wind Speed






struct ContentView: View {
    
    @EnvironmentObject var contentViewModel: ContentViewModel
    
    @State var showSheet = false
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                
                //Main View
                VStack {
                    
                    
                    //if bottom sheet(Todays Forecast View Is disbaled)
                    if !showSheet{
                        
                        SearchBar()
                        
                    }
                    else{
                        Text("Today's Weather Forecast")
                            .foregroundColor(.white)
                            .bold()
                            .fontDesign(.monospaced)
                    }
                    
                    
                    //Weather Animation
                    AnimationView()
                        .padding(.top)
                    
                    
                    Spacer()
                    
                    
                    //Main Weather Status
                    TodayWeather()
                        .background(showSheet ? .clear : .cyan.opacity(0.2))
                        .cornerRadius(10)
                        
                    
                    //Button To toggle sheet
                    Button{
                        
                        showSheet.toggle()
                        
                    } label: {
                        
                        Image(systemName: "chevron.up")
                            .foregroundColor(.white)
                            .fontDesign(.serif)
                        
                        Text("Today's Forecast")
                            .foregroundColor(.white)
                            .fontDesign(.serif)
                        
                    }
                        .padding(.top, 8.0)
                        .buttonStyle(.plain)
                        .sheet(isPresented: $showSheet) {
                        
                        
                    TodaysForecastDetails()
                        
                        .padding(.top, 30)
                        .presentationDetents([.height(550), .large])
                        
                    }
                    
                    
                    
                }
                .padding()
                .onAppear{
                    contentViewModel.getWeatherData()
                }.background(
                    //Background image Change According To weather
                    contentViewModel.getTodayMainBGImage(main: contentViewModel.currentWeatherMain)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                )
                
                
            }//Zstack end
            
        }
    }//View end
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ContentViewModel())
    }
}
