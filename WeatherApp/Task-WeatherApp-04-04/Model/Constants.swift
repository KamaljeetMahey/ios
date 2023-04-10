//
//  Constants.swift
//  Task-WeatherApp-04-04
//
//  Created by Paras  on 04/04/23.
//

import Foundation

class Constants{
    
    static let shared = Constants()
    private init(){}
    
    
    let apiKey = "8212cca9cca403876019502e66fe07bf"
    let apiEndpoint = String(format: "https://api.openweathermap.org/data/2.5/forecast?lat=%@&lon=%@&cnt=7&appid=%@&units=metric")
    
}
