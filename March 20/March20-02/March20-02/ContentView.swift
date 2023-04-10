//
//  ContentView.swift
//  March20-02
//
//  Created by Paras  on 20/03/23.
//

import SwiftUI



struct ContentView: View {
    
    @State private var isOn: Bool = false
    
    var body: some View {
        
        VStack {
            
            Text("Binding Demo").foregroundColor(isOn ? .blue : .red)
            
            SwiftUIView(isOn: $isOn)
            
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
