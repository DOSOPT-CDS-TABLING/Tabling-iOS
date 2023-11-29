//
//  StoreListCollectionHeaderView.swift
//  Tabling-iOS
//
//  Created by yeonsu on 11/29/23.
//

import UIKit

final class StoreListCollectionHeaderView: UICollectionReusableView {
    
    static let identifier = "StoreListCollectionHeaderView"
    
    // MARK: - UI Components
    
    private let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .Gray000
        return view
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "일 평균 대기인원을 기준으로 선정한"
        label.textColor = .Gray400
        label.setLineAndCharacterSpacing(font: .pretendardRegular(size: 12))
        label.partFontChange(targetString: "일 평균 대기인원", font: .pretendardSemiBold(size: 12), textColor: .Gray400)
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "서울 남부 인기 매장 BEST"
        label.textColor = .Gray800
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 16))
        label.partColorChange(targetString: "서울 남부", textColor: .TablingSecondary1)
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
extension StoreListCollectionHeaderView {
    func setUI() {
        self.backgroundColor = .TablingWhite
    }
    
    func setHierarchy() {
        self.addSubviews(dividerView, subTitleLabel, titleLabel)
    }
    
    func setLayout() {
        dividerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(dividerView.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(16)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(2)
            $0.leading.equalToSuperview().inset(16)
        }
    }
}
