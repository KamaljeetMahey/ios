//
//  Api decoding.swift
//  Task-WeatherApp-04-04
//
//  Created by Paras  on 04/04/23.
//

import Foundation

class APIService: ObservableObject{
    
    
    //Fetch Data From Api
    func getRawData(  _ setUrl:String, completion: @escaping (ForecastData?) -> ()  ) {
        
        
        print(setUrl)
        
        
        guard let url = URL(string: setUrl ) else {
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error{
                
                print(error)
                
                return
            }
            
            guard let response = response as? HTTPURLResponse else{
                return
            }
            
            if response.statusCode == 200{
                
                guard let data = data else {
                    return
                }
                
                DispatchQueue.main.async {
                    
                    do {
                        
                        let decodedRawData = try JSONDecoder().decode(ForecastData.self, from: data)
            
                        completion(decodedRawData)
                        
                        
                    } catch let error {
                        
                        print(error)
                        
                    }
                    
                }
            }
            
        }
        task.resume()
        
    }
    
    
    
}
