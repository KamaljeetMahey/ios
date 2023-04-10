//
//  AnimationView.swift
//  Task-WeatherApp-04-04
//
//  Created by Paras  on 06/04/23.
//

import SwiftUI

struct AnimationView: View {
    
    @EnvironmentObject var contentViewModel: ContentViewModel
    
    var body: some View {
        
        //Weather Description and Animation
        HStack(spacing: 50){
            Text("\(contentViewModel.forecastData?.list[0].weather[0].description?.capitalized ?? "Clear Sky")")
                .font(.largeTitle)
                .foregroundColor(.white)
                .fontDesign(.serif)
            
            //Animation
            LottieView(name: contentViewModel.getAnimationFor(description: contentViewModel.weatherDescription))
                .frame(width: 100, height: 100)
            
        }
        
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
            .environmentObject(ContentViewModel())
    }
}
