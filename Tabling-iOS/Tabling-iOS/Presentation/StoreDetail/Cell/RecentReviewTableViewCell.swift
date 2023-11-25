//
//  RecentReviewTableViewCell.swift
//  Tabling-iOS
//
//  Created by 고아라 on 2023/11/24.
//

import UIKit

import SnapKit

final class RecentReviewTableViewCell: UITableViewCell, UITableViewRegisterable {
    
    // MARK: - UI Components
    
    private lazy var starStackView: UIStackView = {
        lazy var stackview = UIStackView()
        stackview.axis = .horizontal
        for _ in 0..<5 {
            let starImage = UIImageView()
            starImage.image = ImageLiterals.Common.ic_star_empty
            starImage.snp.makeConstraints {
                $0.size.equalTo(14)
            }
            stackview.addArrangedSubview(starImage)
        }
        return stackview
    }()
    
    private let reviewStarLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.StoreDetail.testLabel
        label.textColor = .Gray800
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 12))
        return label
    }()
    
    private let reviewerName: UILabel = {
        let label = UILabel()
        label.text = I18N.StoreDetail.testLabel
        label.textColor = .Gray200
        label.setLineAndCharacterSpacing(font: .pretendardRegular(size: 12))
        return label
    }()
    
    private let dayBefore: UILabel = {
        let label = UILabel()
        label.text = I18N.StoreDetail.testLabel
        label.textColor = .Gray200
        label.setLineAndCharacterSpacing(font: .pretendardRegular(size: 12))
        return label
    }()
    
    private let reviewText: UILabel = {
        let label = UILabel()
        label.text = I18N.StoreDetail.testLabel
        label.textColor = .Gray800
        label.numberOfLines = 0
        label.setLineAndCharacterSpacing(font: .pretendardRegular(size: 14))
        return label
    }()
    
    // MARK: - Life Cycles
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
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
extension RecentReviewTableViewCell {
    func setUI() {
        backgroundColor = .TablingWhite
    }
    
    func setHierarchy() {
        addSubviews(starStackView, reviewStarLabel, reviewerName, dayBefore, reviewText)
    }
    
    func setLayout() {
        starStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalToSuperview()
            $0.height.equalTo(14)
        }
        
        reviewStarLabel.snp.makeConstraints {
            $0.top.equalTo(starStackView.snp.top)
            $0.leading.equalTo(starStackView.snp.trailing).offset(3)
        }
        
        reviewerName.snp.makeConstraints {
            $0.top.equalTo(starStackView.snp.bottom).offset(7)
            $0.leading.equalToSuperview()
        }
        
        dayBefore.snp.makeConstraints {
            $0.top.equalTo(reviewerName.snp.top)
            $0.leading.equalTo(reviewerName.snp.trailing).offset(8)
        }
        
        reviewText.snp.makeConstraints {
            $0.top.equalTo(reviewerName.snp.bottom).offset(7)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func setDataBind(model: ReviewList) {
        reviewStarLabel.text = String(model.star)
        reviewerName.text = model.reviewerName
        dayBefore.text = "\(model.dayBefore)일 전"
        reviewText.text = model.reviewContent
        
        for (index, starImage) in starStackView.arrangedSubviews.enumerated() {
            if let starImage = starImage as? UIImageView {
                if index < Int(model.star) {
                    starImage.image = ImageLiterals.Common.ic_star_fill
                } else {
                    starImage.image = ImageLiterals.Common.ic_star_empty
                }
            }
        }
    }
}
