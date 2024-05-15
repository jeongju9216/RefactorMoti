//
//  NSDirectionalEdgeInsets+init.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/15/24.
//

import UIKit

extension NSDirectionalEdgeInsets {
    
    init(inset: CGFloat) {
        self.init(top: inset, leading: inset, bottom: inset, trailing: inset)
    }
}
