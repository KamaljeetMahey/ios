//
//  LottieView.swift
//  Task-WeatherApp-04-04
//
//  Created by Paras  on 06/04/23.
//

import Foundation
import SwiftUI
import Lottie


struct LottieView: UIViewRepresentable{
    
    var name: String?
    var loopMode: LottieLoopMode = .loop
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> some UIView {
        
        let view = UIView()
        
        return view
    }
    
    
    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<LottieView>) {
        uiView.subviews.forEach({$0.removeFromSuperview()})
        
        let animationView = LottieAnimationView()
        animationView.animation = LottieAnimation.named(name ?? "clearSky")
        animationView.translatesAutoresizingMaskIntoConstraints = false
        uiView.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: uiView.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: uiView.heightAnchor)
        ])
        
        
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()
    }
}
