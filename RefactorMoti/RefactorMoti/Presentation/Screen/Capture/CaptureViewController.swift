//
//  CaptureViewController.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/25/24.
//

import UIKit
import Combine

final class CaptureViewController: LayoutViewController<CaptureView> {
    
    // MARK: - Attribute
    
    private var cancellables: Set<AnyCancellable> = []
    
    
    // MARK: - Setup
    
    override func setUpBinding() {
        super.setUpBinding()
        setUpUIControlBinding()
    }
    
    private func setUpUIControlBinding() {
        layoutView.closeButtonDidTap
            .receive(on: RunLoop.main)
            .sink { [weak self] in
                guard let self else { return }
                dismiss(animated: true)
            }
            .store(in: &cancellables)
    }
}
