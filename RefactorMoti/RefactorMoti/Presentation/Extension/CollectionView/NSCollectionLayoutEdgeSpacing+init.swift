//
//  NSCollectionLayoutEdgeSpacing+init.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/15/24.
//

import UIKit

extension NSCollectionLayoutEdgeSpacing {
    
    convenience init(
        top: NSCollectionLayoutSpacing? = nil,
        leading: NSCollectionLayoutSpacing? = nil,
        bottom: NSCollectionLayoutSpacing? = nil,
        trailing: NSCollectionLayoutSpacing? = nil
    ) {
        self.init(leading: leading, top: top, trailing: trailing, bottom: bottom)
    }
}
