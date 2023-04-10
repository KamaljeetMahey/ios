//
//  TodayWeather.swift
//  Task-WeatherApp-04-04
//
//  Created by Paras  on 05/04/23.
//

import SwiftUI

struct TodayWeather: View {
    
    @EnvironmentObject var contentViewModel: ContentViewModel
    
    var body: some View {
        
        
        HStack{
            
            
            //Main temp
            VStack(alignment:.leading){
                
                //Temperature
                Text("\(Int(contentViewModel.forecastData?.list[0].main.temp ?? 10))°C")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .fontDesign(.serif)

                
                if let feelsLike = contentViewModel.forecastData?.list[0].main.feelsLike{
                    Text("feels like \(Int(feelsLike))°")
                        .font(.caption2)
                        .foregroundColor(.white)
                    
                }
            }
            Spacer()
            

            
            //Other info
            VStack(alignment: .trailing){
                
                
                //Current Date
                Text(contentViewModel.currentDate())
                    .padding(.bottom, 10)
                    .foregroundColor(.white)
                    .fontDesign(.serif)
                
                
                //3 hour gap forecast with Animation
                HStack{
                    
                    VStack{
                        
                        Text(contentViewModel.mainLabelForecastDate(listIndex: 0))
                            .fontDesign(.serif)
                            .foregroundColor(.white)
                        
                        LottieView(name: contentViewModel.getAnimationFor(description: contentViewModel.weatherDescription))
                            .frame(width: 30, height: 30)
                            
                        
                        Text("\(Int(contentViewModel.forecastData?.list[1].main.temp ?? 30))°")
                            .fontDesign(.serif)
                            .foregroundColor(.white)
                    }
                    
                    
                    VStack{
                        
                        Text(contentViewModel.mainLabelForecastDate(listIndex: 1))
                            .fontDesign(.serif)
                            .foregroundColor(.white)
                        
                        LottieView(name: contentViewModel.getAnimationFor(description: contentViewModel.weatherDescription))
                            .frame(width: 30, height: 30)
                            
                        
                        Text("\(Int(contentViewModel.forecastData?.list[2].main.temp ?? 30))°")
                            .fontDesign(.serif)
                            .foregroundColor(.white)
                    }
                    
                }
                
            }
            
            
        }
        .padding()
        
    }
}

struct TodayWeather_Previews: PreviewProvider {
    static var previews: some View {
        TodayWeather()
            .environmentObject(ContentViewModel())
    }
}
