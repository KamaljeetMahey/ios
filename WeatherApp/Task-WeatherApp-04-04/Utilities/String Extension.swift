//
//  String Extension.swift
//  Task-WeatherApp-04-04
//
//  Created by Paras  on 05/04/23.
//

import Foundation

extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

extension String.StringInterpolation{
    
    mutating func appendInetpolation(lat: String, long: String, key: String){
        appendLiteral("https://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(long)&cnt=7&appid=\(key)&units=metric")
    }
    
}
