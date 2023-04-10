//
//  SwiftUIView.swift
//  March20-02
//
//  Created by Paras  on 20/03/23.
//

import SwiftUI

struct SwiftUIView: View {
    
    @Binding var isOn : Bool
    
    var body: some View {
        
        VStack{
            
            Toggle("Toggle Title Color", isOn: $isOn).fixedSize()
                
        }
          
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView(isOn: .constant(false))
    }
}
