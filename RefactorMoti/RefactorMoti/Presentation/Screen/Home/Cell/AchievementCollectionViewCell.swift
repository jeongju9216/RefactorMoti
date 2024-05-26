//
//  AchievementCollectionViewCell.swift
//  RefactorMoti
//
//  Created by 유정주 on 5/5/24.
//

import UIKit
import Jeongfisher
import PinLayout

final class AchievementCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Interface
    
    func configure(with achievement: Achievement) {
        guard let imageURL = achievement.imageURL else {
            return
        }
        imageView.jf.setImage(with: imageURL)
    }
    
    func cancelDownloadImage() {
        imageView.jf.cancelDownloadImage()
    }
    
    // MARK: - UI
    
    private let imageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.jd.cornerRadius(.small)
        return imageView
    }()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.pin.all()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    // MARK: - Setup
    
    private func setUpSubview() {
        addSubview(imageView)
    }
}
