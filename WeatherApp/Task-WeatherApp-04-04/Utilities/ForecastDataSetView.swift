//
//  ForecastDataSetView.swift
//  Task-WeatherApp-04-04
//
//  Created by Paras  on 06/04/23.
//

import SwiftUI



struct ForecastDataSetView: View {
    
     var labelText: String
     var image: String
     var value: String
    
    var body: some View {
        
        HStack{
            
            Image(systemName: image)
                .foregroundColor(.blue)
            
            VStack(alignment: .leading){
                Text(labelText)
                    .fontWeight(.light)
                Text(value)
                    .bold()
            }
            
            
        }
        
    }
}

struct ForecastDataSetView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastDataSetView(labelText: "Real Feel", image: "cloud", value: "10")
    }
}
