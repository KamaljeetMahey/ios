//
//  ProfileImageView.swift
//  LocalizationTask-29-03
//
//  Created by Paras  on 29/03/23.
//


//Finalized

import SwiftUI

struct ProfileImageView: View {
    
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    
    var body: some View {
        
        Image( "profile-image")
            .resizable()
            .aspectRatio(contentMode: .fill)
            
            .frame(width: 90, height: 80)
            .clipShape(Circle())
        
        Image(systemName: "camera.circle.fill")
            .resizable()
            .frame(width: 25, height: 25)
            .foregroundColor(.green)
            .background(.white)
            .clipShape(Circle())
            .overlay(Circle().stroke(.white,lineWidth: 2 ))
            .offset(x: 25, y: -30)
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageView()
    }
}
