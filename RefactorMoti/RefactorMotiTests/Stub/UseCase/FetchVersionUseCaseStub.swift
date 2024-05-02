//
//  FetchVersionUseCaseStub.swift
//  RefactorMotiTests
//
//  Created by 유정주 on 4/24/24.
//

import Foundation
@testable import RefactorMoti

struct FetchVersionUseCaseStub: FetchVersionUseCaseProtocol {
    
    // MARK: - Interface
    
    func execute() async -> Version {
        Version(current: current, latest: latest, forced: forced)
    }
    
    
    // MARK: - Attribute
    
    private let current: String
    private let latest: String
    private let forced: String
    
    
    // MARK: - Initializer
    
    init(
        current: String,
        latest: String = "1.0.0",
        forced: String = "1.0.0"
    ) {
        self.current = current
        self.latest = latest
        self.forced = forced
    }
}
