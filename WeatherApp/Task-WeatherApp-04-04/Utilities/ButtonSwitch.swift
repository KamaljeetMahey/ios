//
//  ButtonSwitch.swift
//  Task-WeatherApp-04-04
//
//  Created by Paras  on 05/04/23.
//

import SwiftUI

struct ButtonSwitch: View {
    
    @Binding var isToday : Bool
    
    var body: some View {
        Button(action: {
            isToday.toggle()
        }, label: {
            HStack(spacing: 0){
                Text(" Today      ")
                    .padding(.horizontal)
                    .padding(.vertical, 6)
                    .foregroundColor(isToday ? .white : .orange)
                    .background(isToday ? .orange : .white)
                
                Text("This Week")
                    .padding(.horizontal)
                    .padding(.vertical, 6)
                    .foregroundColor(isToday ? .orange : .white)
                    .background(isToday ? .white : .orange)
            }
            .font(.system(size: 14))
            .fontWeight(.semibold)
            .cornerRadius(6)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.orange, lineWidth: 1)
            )
        })
    }
}

struct ButtonSwitch_Previews: PreviewProvider {
    static var previews: some View {
        ButtonSwitch(isToday: .constant(true))
    }
}
