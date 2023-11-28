//
//  StoreListCollectionViewCell.swift
//  Tabling-iOS
//
//  Created by yeonsu on 11/28/23.
//

import UIKit
import SnapKit

final class StoreListCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    // MARK: - Properties
    private let rankLabel: UILabel = {
        let label = UILabel()
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 12))
        label.font = .pretendardSemiBold(size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .Gray800
        
        return label
    }()
    
    private let storeImageView: UIImageView = UIImageView(image: UIImage(named: "examplePhoto"))
    
    private let waitingTagLabelView: UIView = {
        let view = UIView()
        view.backgroundColor = .TablingPrimary
        
        return view
    }()
    
    private let watingTagLabel: UILabel = {
        let label = UILabel()
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 12))
        label.font = .pretendardSemiBold(size: 11)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .TablingWhite
        
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
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 12))
        label.font = .pretendardSemiBold(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .Gray400
        
        return label
    }()
    
    private let reviewStarImageView: UIImageView = UIImageView(image: ImageLiterals.Common.ic_star_fill)
    
    private let storeRatingNumLabel: UILabel = {
        let label = UILabel()
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 12))
        label.font = .pretendardSemiBold(size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .Gray800
        
        return label
    }()
    
    private let storeReviewNumLabel: UILabel = {
        let label = UILabel()
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 12))
        label.font = .pretendardSemiBold(size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .Gray800
        
        return label
    }()
    
    private let storeSubInfoLabel: UILabel = {
        let label = UILabel()
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 12))
        label.font = .pretendardSemiBold(size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .Gray200
        
        return label
    }()
    
    private let personImageView: UIImageView = UIImageView(image: ImageLiterals.StoreList.ic_people)
    
    private let averageWaitingLabel: UILabel = {
        let label = UILabel()
        label.setLineAndCharacterSpacing(font: .pretendardRegular(size: 12))
        label.font = .pretendardSemiBold(size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .Gray300
        
        return label
    }()
    
//    private let averageWaitingNumLabel: UILabel = {
//        let label = UILabel()
//        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 12))
//        label.font = .pretendardSemiBold(size: 12)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textColor = .Gray600
//        
//        return label
//    }()
    
    // MARK: - UI Components
    
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
extension StoreListCollectionViewCell {
    func setUI() {
        storeImageView.contentMode = .scaleAspectFill
        storeImageView.clipsToBounds = true
        storeImageView.layer.cornerRadius = 6
        
        rankLabel.textAlignment = .center
        
        waitingTagLabelView.layer.cornerRadius = 4
        
        reviewStarImageView.contentMode = .scaleAspectFill
        reviewStarImageView.clipsToBounds = true
        
        personImageView.contentMode = .scaleAspectFill
        personImageView.clipsToBounds = true
    }
    
    func setHierarchy() {
        addSubviews(rankLabel, storeImageView, storeNameLabel, storeReviewStackView, storeSubInfoLabel, personImageView, averageWaitingLabel)
        storeImageView.addSubviews(waitingTagLabelView)
        waitingTagLabelView.addSubviews(watingTagLabel)
    }
    
    func setLayout() {
        rankLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.equalTo(18)
            $0.left.equalToSuperview().offset(16)
        }
        storeImageView.snp.makeConstraints {
            $0.width.height.equalTo(100)
            $0.left.equalTo(rankLabel.snp.right).offset(16)
            $0.centerY.equalToSuperview()
        }
        waitingTagLabelView.snp.makeConstraints {
            $0.width.equalTo(50)
            $0.height.equalTo(21)
            $0.top.left.equalToSuperview().offset(5)
        }
        watingTagLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        storeNameLabel.snp.makeConstraints {
            $0.top.equalTo(storeImageView).offset(2)
            $0.left.equalTo(storeImageView.snp.right).offset(9)
        }
        storeReviewStackView.snp.makeConstraints {
            $0.left.equalTo(storeNameLabel)
            $0.top.equalTo(storeNameLabel.snp.bottom).offset(6)
        }
        reviewStarImageView.snp.makeConstraints {
            $0.width.height.equalTo(13)
        }
        storeSubInfoLabel.snp.makeConstraints {
            $0.left.equalTo(storeNameLabel)
            $0.top.equalTo(reviewStarImageView.snp.bottom).offset(6)
        }
        personImageView.snp.makeConstraints {
            $0.width.height.equalTo(24)
            $0.left.equalTo(storeNameLabel)
            $0.top.equalTo(storeSubInfoLabel.snp.bottom).offset(6)
        }
        averageWaitingLabel.snp.makeConstraints {
            $0.left.equalTo(personImageView.snp.right)
            $0.centerY.equalTo(personImageView)
        }
    }
    
    func setDataBind(model: StoreListEntity) {
        rankLabel.text = "\(model.shopID)"
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
