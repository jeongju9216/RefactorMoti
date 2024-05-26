//
//  EditAchievementViewController.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/26/24.
//

import UIKit
import Combine

final class EditAchievementViewController: LayoutViewController<EditAchievementView> {
    
    // MARK: - Attribute
    
    private var cancellables: Set<AnyCancellable> = []
    
    
    // MARK: - Setup
    
    override func setUpBinding() {
        super.setUpBinding()
        setUpUIControlBinding()
    }
    
    private func setUpUIControlBinding() {
        layoutView.cancelButtonDidTap
            .receive(on: RunLoop.main)
            .sink { [weak self] in
                guard let self else { return }
                dismiss(animated: false)
            }
            .store(in: &cancellables)
        
        layoutView.doneButtonDidTap
            .receive(on: RunLoop.main)
            .sink { [weak self] in
                guard let self else { return }
                dismiss(animated: true)
            }
            .store(in: &cancellables)
    }
}
