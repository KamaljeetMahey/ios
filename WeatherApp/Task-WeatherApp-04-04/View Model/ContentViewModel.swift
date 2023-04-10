//
//  ContentViewModel.swift
//  Task-WeatherApp-04-04
//
//  Created by Paras  on 04/04/23.
//

import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {
    
    
    //MARK: Instances
    let constants = Constants.shared
    var apiService = APIService()
    
    
    //MARK: Properties
    
    
    //Main Data Object
    @Published var forecastData : ForecastData?
    
    
    //User Coordinate Inputs
    @Published var inputLocation: String =  "48.8566/2.3522"
    
    
    //Spliting lat and long
    var inputLocationArray: [String] {
        if !inputLocation.isEmpty{
            return inputLocation.components(separatedBy: "/")
        }
        return ["48.8566","2.3522"]
    }
    
    
    //Latitude
    var lat : String{
        inputLocationArray[0]
    }

    
    //Longitude
    var long : String {
        if inputLocationArray.count < 2{
            return inputLocationArray[0]
        }
        return inputLocationArray[1]
    }
    
    
    //Set Url for data fetching according to user input
    var callUrl: String {
        get{
            
            "https://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(long)&cnt=7&appid=\(constants.apiKey)&units=metric"
        }
        
    }
  
    
    //Get Current Weather Description
    var weatherDescription: String{
        if let description = forecastData?.list[0].weather[0].description{
            return description
        }
        return "clearSky"
    }
    
    
    //Get Current Main Weather For background
    var currentWeatherMain : String{
        if let main = forecastData?.list[0].weather[0].main{
            return main
        }
        return "Clear"
    }
    
    
    //Sunrise
    var currSunset: String{
        return  unixToDate(unix: forecastData?.city?.sunset)
    }
    
    
    //Sunset
    var currSunrise: String{
        
        return  unixToDate(unix: forecastData?.city?.sunrise)
           
    }
    
    
    //Main weather data fetch function from network class
    func getWeatherData(){
        
        apiService.getRawData(callUrl) { data in
            self.forecastData = data
            
            print("----View Model Data---")
            print(self.forecastData as Any)
            print("/---View Model Data--/")
        }
        
    }
    
    
    //Set Up Current Date
    func currentDate() -> String{
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, MMM d, HH:mm"
         
        return dateFormatter.string(from: date)
    }
    
    
    //3hours forecast Date Set
    func mainLabelForecastDate(listIndex: Int) -> String{
            
        if let time = forecastData?.list[listIndex].dtTxt{
            
            let timeArray = time.components(separatedBy: " ")
            
            return timeArray[1].substring(toIndex: 5)
        }
        return "09:00"
        
    }
    
    
    
    //Main Weather Icon/Animation on Screen
    func getAnimationFor(description: String) -> String{
        
        switch description{
            
        case "broken clouds":
            return "brokenClouds"
        case "clear sky":
            return "clearSky"
        case "few clouds":
            return "fewClouds"
        case "light snow":
            return "lightSnow"
        case "light rain":
            return "lightRain"
        case "scattered clouds":
            return "scatteredClouds"
        case "overcast clouds":
            return "overcastClouds"
        case "moderate rain":
            return "moderateRain"
        case "moderate snow":
            return "moderateSnow"
        case "rain":
            return "rain"
        case "snow":
            return "snow"
        case "heavy rain":
            return "heavyRain"
        case "heavy snow":
            return "heavySnow"
        default:
            return "clearSky"
        }
        
    }
    
    
    
    //Set Main View background
    func getTodayMainBGImage(main: String) -> Image{
        
        switch main {
        case "Clear":
            return Image("clear-bg")
        case "Clouds":
            return Image("clouds-bg")
        case "Snow" :
            return Image("snow-2")
        case "Rain" :
            return Image("rain-bg")
        default :
            return Image("clear-bg")
        }
        
        
    }
    
    
    
    func unixToDate(unix: Int?) -> String{
        
        if let timeResult = unix{
            
            let date = Date(timeIntervalSince1970: Double(timeResult))
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            dateFormatter.timeZone = .current
            let localDate = dateFormatter.string(from: date)
            return localDate
        }
        
        return "NA"
    }
    
    
}
