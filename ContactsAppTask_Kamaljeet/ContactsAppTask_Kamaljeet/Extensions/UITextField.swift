//
//  UITextField.swift
//  ContactsAppTask_Kamaljeet
//
//  Created by Paras  on 02/03/23.
//

import Foundation
import UIKit

extension UITextField{

    enum Direction {
        case Left
        case Right
    }
    
    
    func withImage(direction: Direction, image: UIImage){
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 40))
        mainView.layer.cornerRadius = 5
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 40))
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        view.layer.borderWidth = CGFloat(0.5)
        
        mainView.addSubview(view)
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 10.0, y: 8.0, width: 26.0, height: 26.0)
        view.addSubview(imageView)
        
        let seperatorView = UIView()
        
        mainView.addSubview(seperatorView)
        
        if(Direction.Left == direction){
            
            self.leftViewMode = .always
            self.leftView = mainView
        } else {
            
            self.rightViewMode = .always
            self.rightView = mainView
        }
        
        
        self.layer.borderWidth = CGFloat(0.5)
        self.layer.cornerRadius = 5
    }

}
