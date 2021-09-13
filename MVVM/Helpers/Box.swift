//
//  Box.swift
//  MVVM
//
//  Created by Sergey on 13.09.2021.
//

import Foundation


class Box<T> {
    typealias Listener = ((T) -> Void)
    
    var value: T {
        didSet {
            
            listener?(value)
            
        }
    }
    var listener: Listener?
    
    init(value: T) {
        self.value = value
    }
    
    func bind(listener: @escaping Listener) {
        self.listener = listener
        listener(value)
    }
}
