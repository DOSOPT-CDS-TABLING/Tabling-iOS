//
//  MenuCollectionHeaderView.swift
//  Tabling-iOS
//
//  Created by 민 on 11/23/23.
//

import UIKit

final class MenuCollectionHeaderView: UICollectionReusableView {
    
    // MARK: - UI Components
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 16))
        label.text = "BURG"
        label.textColor = .Gray800
        return label
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
extension MenuCollectionHeaderView {
    func setUI() {
        self.backgroundColor = .TablingWhite
    }
    
    func setHierarchy() {
        self.addSubviews(headerLabel)
    }
    
    func setLayout() {
        headerLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview().inset(6)
            $0.leading.equalTo(15)
        }
    }
    
    func setDataBind(data: String) {
        headerLabel.text = data
    }
}
