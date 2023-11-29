//
//  MenuCollectionViewCell.swift
//  Tabling-iOS
//
//  Created by 민 on 11/23/23.
//

import UIKit
import Kingfisher

final class MenuCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {

    // MARK: - UI Components
    
    private let menuImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        return imageView
    }()
    
    private let menuLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.StoreList.storeTestLabel
        label.setLineAndCharacterSpacing(font: .pretendardRegular(size: 14))
        label.textColor = .Gray800
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.StoreList.storeTestLabel
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 14))
        label.textColor = .TablingPrimary
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
extension MenuCollectionViewCell {
    func setUI() {
        self.backgroundColor = .TablingWhite
    }
    
    func setHierarchy() {
        self.addSubviews(menuImage, menuLabel, priceLabel)
    }
    
    func setLayout() {
        
        menuImage.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(80)
        }
        
        menuLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(menuImage.snp.bottom).offset(6)
            $0.height.equalTo(21)
        }
        
        priceLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(menuLabel.snp.bottom)
        }
    }
    
    func setDataBind(model: MenuInfoList) {
        menuImage.kf.setImage(with: URL(string: model.menuPhotoURL))
        menuLabel.text = model.menuName
        priceLabel.text = String(model.price) + "원"
    }
}
