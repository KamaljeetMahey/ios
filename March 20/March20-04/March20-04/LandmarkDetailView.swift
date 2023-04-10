//
//  LandmarkDetailView.swift
//  March20-04
//
//  Created by Paras  on 20/03/23.
//

import SwiftUI

struct LandmarkDetailView: View {
    
    var landmark : Landmark
    var body: some View {
        
        VStack{
            Image(landmark.photo)
                .resizable()
                .scaledToFit()
            
            Text(landmark.description)
            Spacer()
        }.padding()
            .navigationBarTitle(Text(landmark.name), displayMode: .inline)
        
        
    }
}

struct LandmarkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetailView(landmark: Landmark(landmarkId: 1, name: "test", photo: "goi", description: "test description"))
    }
}
