//
//  VersionRepositoryProtocol.swift
//  RefactorMoti
//
//  Created by 유정주 on 4/23/24.
//

import Foundation

protocol VersionRepositoryProtocol {
    
    func fetchVersion() async -> Version
}
