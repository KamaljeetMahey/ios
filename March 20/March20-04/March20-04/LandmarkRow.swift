//
//  LandmarkRow.swift
//  March20-04
//
//  Created by Paras  on 20/03/23.
//

import SwiftUI

struct LandmarkRow: View {
    
    var landmark: Landmark
    var body: some View {
        
        HStack{
            Image(landmark.photo)
                .resizable()
                .frame(width: 50,height: 40,alignment: .center)
                .shadow(color: .black ,radius: 8)
            
            Text(landmark.name)
            Spacer()
            //hstack end
        }
        
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkRow(landmark: Landmark(landmarkId: 1, name: "test", photo: "goi", description: "test"))
    }
}
