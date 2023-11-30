//
//  StoreTagCollectionViewCell.swift
//  Tabling-iOS
//
//  Created by yeonsu on 11/29/23.
//

import UIKit

import SnapKit

final class StoreTagCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    // MARK: - UI Components
    
    private let tagLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.StoreDetail.testLabel
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 12))
        label.textColor = .Gray400
        label.textAlignment = .center
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
extension StoreTagCollectionViewCell {
    func setUI() {
        tagLabel.layer.cornerRadius = 15
        tagLabel.layer.borderWidth = 1
        tagLabel.layer.borderColor = UIColor.Gray100.cgColor
    }
    
    func setHierarchy() {
        addSubview(tagLabel)
    }
    
    func setLayout() {
        tagLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setDataBind(model: [String], indexPath: IndexPath) {
        tagLabel.text = model[indexPath.row]
    }
}
