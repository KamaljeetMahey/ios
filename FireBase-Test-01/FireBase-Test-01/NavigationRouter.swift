//
//  NavigationRouter.swift
//  FireBase-Test-01
//
//  Created by Paras  on 10/04/23.
//

import Foundation

final class Router<T: Hashable>: ObservableObject {
    
    @Published var paths: [T] = []
    
    func push(_ path: T) {
        paths.append(path)
    }
    
    func popCurrent(){
        paths.removeLast(1)
    }
    
    func pop(to: T) {
            guard let found = paths.firstIndex(where: { $0 == to }) else {
                return
            }

            let numToPop = (found..<paths.endIndex).count - 1
            paths.removeLast(numToPop)
        }
    
    func popToRoot(){
        paths.removeAll()
    }
}

enum Path {
    case A
    case B
    case C
}
