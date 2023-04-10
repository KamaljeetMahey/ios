//
//  ContentView.swift
//  March20-01
//
//  Created by Paras  on 20/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var playStatus: String = "Not Playing"
    @State private var isPlaying: Bool = false
    
    var body: some View {
        VStack {
            
            Image(systemName: "music.note")
                .resizable()
                .frame(width: 200, height: 200,alignment: .topLeading)
                .background(Color.gray.opacity(0.5))
                .cornerRadius(15.0)
            
            
            Text(self.playStatus)
                .font(.title)
                .frame(maxWidth: 350, alignment: .leading)
                .padding(20)
            
            
            
            
            HStack(alignment: .center, spacing: 70){
                
                Button( action:{
                    print("backward button tapped")
                }){
                    Image(systemName: "backward")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .center)
                }
                
                
                Button(action:{
                    self.isPlaying.toggle()
                    self.playStatus = self.isPlaying ? "Playing" : "Not Playing"
                }){
                    Image(systemName: self.isPlaying ? "pause" : "play")
                        .resizable()
                        .frame(width: 45, height: 50, alignment: .center)
                }
                
                Button(action: {
                    print("forward button tapped")
                }){
                    Image(systemName: "forward")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .center)
                }
                
                //hstack end
            }
            
            
           //vstack end
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
