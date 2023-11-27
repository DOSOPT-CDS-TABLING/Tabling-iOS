//
//  StoreDetailImageCollectionViewCell.swift
//  Tabling-iOS
//
//  Created by 민 on 11/27/23.
//

import UIKit

final class StoreDetailImageCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    private let storeImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let waitingTeamLabel: UILabel = {
        let label = UILabel()
        label.text = "대기 2팀"
        label.backgroundColor = .TablingPrimary
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 16))
        label.textColor = .TablingWhite
        label.textAlignment = .center
        label.layer.cornerRadius = 4
        label.clipsToBounds = true
        return label
    }()
    
    private let photoCountLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setUI()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
extension StoreDetailImageCollectionViewCell {
    func setUI() {
        
    }
    
    func setHierarchy() {
        self.addSubview(storeImage)
        storeImage.addSubviews(waitingTeamLabel, photoCountLabel)
    }
    
    func setLayout() {
        storeImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        waitingTeamLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(195)
            $0.leading.equalToSuperview().inset(16)
            $0.width.equalTo(74)
            $0.height.equalTo(32)
        }
        
        photoCountLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(208)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(37)
            $0.height.equalTo(21)
        }
    }
    
    func setDataBind(model: String) {
        storeImage.image = UIImage(named: model)
    }
}
