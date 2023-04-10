//
//  DataModel.swift
//  Task-WeatherApp-04-04
//
//  Created by Paras  on 05/04/23.
//

import Foundation


// MARK: - Welcome
struct ForecastData: Codable {
    let cod: String
    let message, cnt: Int
    //cnt = num of timestamps
    let list: [List]
    let city: City?
}


// MARK: - City
struct City: Codable {
    let id: Int?
    let name: String?
    let coord: Coord
    let country: String?
    let population, timezone, sunrise, sunset: Int
}


// MARK: - Coord
struct Coord: Codable {
    let lat, lon: Double
}


// MARK: - List
struct List: Codable {
    
    let dt: Int
    let main: MainClass
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let visibility: Int?
    let pop: Double
    let rain: Rain?
    let snow: Snow?
    let sys: Sys
    
    //dttxt = time
    let dtTxt: String
    

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, sys
        case dtTxt = "dt_txt"
        case snow
        case rain
    }
}


//MARK: - Rain
struct Rain: Codable{
    let the3h: Double?
    enum CodingKeys: String, CodingKey {
        case the3h = "3h"
    }
}


// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}


// MARK: - MainClass
struct MainClass: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel, humidity: Int
    let tempKf: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}


// MARK: - Snow
struct Snow: Codable {
    let the3H: Double

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}


// MARK: - Sys
struct Sys: Codable {
    let pod: String?
}


// MARK: - Weather
struct Weather: Codable {
    let id: Int?
    let main: String?
    let description: String?
    let icon: String
}


// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}





