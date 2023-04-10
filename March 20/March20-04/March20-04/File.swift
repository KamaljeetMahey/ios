//
//  File.swift
//  March20-04
//
//  Created by Paras  on 20/03/23.
//

import Foundation


struct Landmark {
    
    let landmarkId: Int
    let name, photo, description : String
    
}


struct City {
    
    let cityId: Int
    let name: String
    let landmarks: [Landmark]
    
}
