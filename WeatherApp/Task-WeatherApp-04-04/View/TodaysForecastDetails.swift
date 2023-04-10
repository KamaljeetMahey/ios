//
//  TodaysForecastDetails.swift
//  Task-WeatherApp-04-04
//
//  Created by Paras  on 05/04/23.
//

import SwiftUI

struct TodaysForecastDetails: View {
    
    @EnvironmentObject var contentViewModel: ContentViewModel
    
    var body: some View {
        
            VStack{
                
                
                //City Name and Temp
                ZStack{
                    
                    HStack{
                        
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundColor(.white)
                            .frame(width: 20)
                        
                        Text("\(contentViewModel.forecastData?.city?.name ?? "Unknown")")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                        
                        
                        Spacer()
                        
                        //Temperatures
                        VStack{
                            Text("\(Int(contentViewModel.forecastData?.list[0].main.temp ?? 10))°C")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .fontDesign(.serif)
                                .padding([.top,.leading,.trailing])
                            
                            
                            HStack{
                                
                                Image(systemName: "arrow.up")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .frame(width: 7, height: 10)
                                    .offset(x:7, y:1)
                                
                                Text("\(Int(contentViewModel.forecastData?.list[0].main.tempMax ?? 10))° /")
                                    .fontWeight(.regular)
                                    .foregroundColor(.white)
                                
                                
                                
                                
                                Image(systemName: "arrow.down")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .frame(width: 7, height: 10)
                                
                                Text("\(Int(contentViewModel.forecastData?.list[0].main.tempMin ?? 10))°")
                                    .fontWeight(.thin)
                                    .foregroundColor(.white)
                                    .offset(x:-7, y:1)
                                
                            }
                            .offset(y:-20)
                            
                        }
                        
                    }
                    .offset(y:5)
                    .padding(.leading)
                    .padding(.vertical,70)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(.white.opacity(2.0), lineWidth: 2))
                    
                }.background(
                        Image("fore-bg")
                            .resizable()
                            .opacity(0.8)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                )
                
                
                //RealFeel, WindSpeed
                HStack(spacing: 30){
                    
                    ForecastDataSetView(labelText: "Real Feel", image: "thermometer.sun", value: "\(Int(contentViewModel.forecastData?.list[0].main.feelsLike ?? 10))")
                        .offset(x:-10)
                    
                    
                    
                    ForecastDataSetView(labelText: "Wind Speed", image: "wind", value: "\(Int(contentViewModel.forecastData?.list[0].wind.speed ?? 10))")
                        .offset(x:20)
                    
                }
                .padding(.vertical)
                .padding(.horizontal, 60)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.white.opacity(2.0), lineWidth: 2))
                

                //Rain1h, CloudCover
                HStack(spacing: 40){
                    
                    
                    
                    ForecastDataSetView(labelText: "Cloud Cover", image: "cloud.fill", value: "\(contentViewModel.forecastData?.list[0].clouds.all ?? 0)%")
                        .offset(x:-10)
                        
                    
                    
                    ForecastDataSetView(labelText: "Rain 1h", image: "cloud.rain.fill", value: "\(Int(contentViewModel.forecastData?.list[0].rain?.the3h ?? 0))mm")
                        .offset(x:-20)
                        
                    
                    
                }
                    .padding(.vertical)
                    .padding(.horizontal, 63)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(.white.opacity(2.0), lineWidth: 2))
                
                
                //Temperature Gauge
                HStack(spacing:10){
                    
                    
                    
                    LottieView(name: "temperature")
                        .frame(width: 60, height: 80)
                        .offset(y:-4)
                    
                    Gauge(value: contentViewModel.forecastData?.list[0].main.temp ?? 0, in: -50...40) {
                        Text("Temp")
                    } currentValueLabel: {
                        Text("\(Int(contentViewModel.forecastData?.list[0].main.temp ?? 25))")
                        
                    } minimumValueLabel: {
                        Text("\(Int(contentViewModel.forecastData?.list[0].main.tempMin ?? 10 ))")
                            .font(.caption)
                    } maximumValueLabel: {
                        Text("\(Int(contentViewModel.forecastData?.list[0].main.tempMax ?? 25))")
                            .font(.caption)
                    }
                    .tint(.blue.opacity(0.5))
                    .gaugeStyle(.accessoryCircular)
                    
                    
                }
                .padding(.top, 15)
                .padding(.bottom, 15)
                
                .padding(.horizontal, 140)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.white, lineWidth: 2))
                
                //Humidity
                HStack(spacing: 50){
                    
                    ForecastDataSetView(labelText: "Humidity", image: "humidity.fill", value: "\(contentViewModel.forecastData?.list[0].main.humidity ?? 10)")
                        .offset(x:-10)
                    
                    
                    ForecastDataSetView(labelText: "Visibilty  ", image: "eye.circle.fill", value: "\((contentViewModel.forecastData?.list[0].visibility ?? 10000)/1000)km")
                    
                }
                .padding(.vertical)
                .padding(.horizontal, 62)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.white.opacity(2.0), lineWidth: 2))
                
                
                //Sunrise sunset
                HStack(spacing: 40){
                    
                    //Sunrise
                    ForecastDataSetView(labelText: "Sunrise", image: "sunrise.fill", value: "\(contentViewModel.currSunrise)")
                        
                        .offset(x:-20)
                    
                    
                    
                    //Sunset
                    ForecastDataSetView(labelText: "Sunset", image: "sunset.fill", value: "\(contentViewModel.currSunset)")
                        
                        
                }
                .padding(.vertical)
                .padding(.horizontal, 75)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.white.opacity(2.0), lineWidth: 2))
            }
            .padding(.top, 170)
            .padding([.bottom],120)
            .padding([.leading,.trailing], 10)
            .background(Color(.black.withAlphaComponent(0.2)))
            
        
        
    }//View End
        
}

struct TodaysForecastDetails_Previews: PreviewProvider {
    static var previews: some View {
        TodaysForecastDetails()
            .environmentObject(ContentViewModel())
    }
}
