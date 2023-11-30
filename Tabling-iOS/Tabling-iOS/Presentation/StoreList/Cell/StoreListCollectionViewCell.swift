//
//  StoreListCollectionViewCell.swift
//  Tabling-iOS
//
//  Created by yeonsu on 11/28/23.
//

import UIKit
import SnapKit

final class StoreListCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    // MARK: - UI Components
    private let rankLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = I18N.StoreList.storeTestLabel
        label.textColor = .Gray800
        label.textAlignment = .center
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 14))
        return label
    }()
    
    private let storeImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        return image
    }()
    
    private let waitingTagLabelView: UIView = {
        let view = UIView()
        view.backgroundColor = .TablingPrimary
        view.layer.cornerRadius = 4
        return view
    }()
    
    private let watingTagLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.StoreList.storeTestLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .TablingWhite
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 11))
        return label
    }()
    
    private lazy var storeReviewStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubviews(reviewStarImageView, storeRatingNumLabel, storeReviewNumLabel)
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.spacing = 3
        return stackView
    }()
    
    private let storeNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .Gray400
        label.text = I18N.StoreList.storeTestLabel
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 16))
        return label
    }()
    
    private let reviewStarImageView: UIImageView = {
        let image = UIImageView(image: ImageLiterals.Common.ic_star_fill)
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let storeRatingNumLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.StoreList.storeTestLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .Gray800
        label.setLineAndCharacterSpacing(font: .pretendardRegular(size: 14))
        return label
    }()
    
    private let storeReviewNumLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.StoreList.storeTestLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .Gray800
        label.setLineAndCharacterSpacing(font: .pretendardRegular(size: 14))
        return label
    }()
    
    private let storeSubInfoLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.StoreList.storeTestLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .Gray200
        label.setLineAndCharacterSpacing(font: .pretendardRegular(size: 14))
        return label
    }()
    
    private let personImageView: UIImageView = {
        let image = UIImageView(image: ImageLiterals.StoreList.ic_people)
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let averageWaitingLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.StoreList.storeTestLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .Gray300
        label.setLineAndCharacterSpacing(font: .pretendardRegular(size: 12))
        return label
    }()

    // MARK: - Life Cycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
extension StoreListCollectionViewCell {
    func setHierarchy() {
        addSubviews(rankLabel, storeImageView, storeNameLabel, storeReviewStackView, storeSubInfoLabel, personImageView, averageWaitingLabel)
        storeImageView.addSubviews(waitingTagLabelView)
        waitingTagLabelView.addSubviews(watingTagLabel)
    }
    
    func setLayout() {
        rankLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.equalTo(18)
            $0.leading.equalToSuperview().offset(16)
        }
        
        storeImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.leading.equalTo(rankLabel.snp.trailing).offset(4)
            $0.size.equalTo(100)
        }
        
        waitingTagLabelView.snp.makeConstraints {
            $0.width.equalTo(50)
            $0.height.equalTo(21)
            $0.top.leading.equalToSuperview().offset(5)
        }
        
        watingTagLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        storeNameLabel.snp.makeConstraints {
            $0.top.equalTo(storeImageView).offset(2)
            $0.leading.equalTo(storeImageView.snp.trailing).offset(9)
        }
        
        storeReviewStackView.snp.makeConstraints {
            $0.top.equalTo(storeNameLabel.snp.bottom).offset(6)
            $0.leading.equalTo(storeNameLabel.snp.leading)
        }
        
        reviewStarImageView.snp.makeConstraints {
            $0.size.equalTo(13)
        }
        
        storeSubInfoLabel.snp.makeConstraints {
            $0.leading.equalTo(storeNameLabel)
            $0.top.equalTo(reviewStarImageView.snp.bottom).offset(6)
        }
        
        personImageView.snp.makeConstraints {
            $0.size.equalTo(24)
            $0.leading.equalTo(storeNameLabel)
            $0.top.equalTo(storeSubInfoLabel.snp.bottom).offset(6)
        }
        
        averageWaitingLabel.snp.makeConstraints {
            $0.leading.equalTo(personImageView.snp.trailing)
            $0.centerY.equalTo(personImageView)
        }
    }
    
    func setDataBind(model: StoreListEntity) {
        rankLabel.text = "\(tag + 1)"
        storeImageView.kfSetImage(url: model.profileImage)
        if model.currentWaiting == 0 {
            watingTagLabel.text = "대기 없음"
            watingTagLabel.textColor = .Gray200
            waitingTagLabelView.backgroundColor = .Gray600
        } else {
            watingTagLabel.text = "대기 \(model.currentWaiting)팀"
        }
        storeNameLabel.text = "\(model.name)"
        storeRatingNumLabel.text = "\(model.averageStar)"
        storeReviewNumLabel.text = "(\(model.reviewCount))"
        storeSubInfoLabel.text = "\(model.shopCategory)·\(model.shortAddress)"
        averageWaitingLabel.text = "일 평균 \(model.averageWaiting)명 대기"
        let targetString = "\(model.averageWaiting)"
        averageWaitingLabel.partFontChange(targetString: targetString, font: .pretendardSemiBold(size: 12), textColor: .Gray800)
    }
}
