//
//  ViewModelable.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/29/24.
//

import Foundation

protocol ViewModelable {
    
    associatedtype Input
    associatedtype Output
    
    var output: Output { get }
    
    func bind(input: Input)
}
