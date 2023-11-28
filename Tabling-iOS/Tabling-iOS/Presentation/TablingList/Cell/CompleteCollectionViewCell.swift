//
//  CompleteCollectionViewCell.swift
//  Tabling-iOS
//
//  Created by 고아라 on 2023/11/23.
//

import UIKit

import SnapKit

protocol CompleteDelegate: AnyObject {
    func detailButtonTapped()
    func shopButtonTappd()
    func confirmButtonTapped(index: Int)
}

final class CompleteCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    // MARK: - Properties
    
    weak var completeDelegate: CompleteDelegate?
    var idx: Int = 0
    
    // MARK: - UI Components
    
    private let statusPlanLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.TablingList.statusPlanTitle
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 12))
        label.backgroundColor = .TablingPrimary
        label.textColor = .TablingWhite
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 11
        return label
    }()
    
    private let statusCompleteLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.TablingList.statusCompleteTitle
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 12))
        label.backgroundColor = .Gray200
        label.textColor = .TablingWhite
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 11
        return label
    }()
    
    private let detailButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle(I18N.TablingList.detailButtonTitle, for: .normal)
        button.setTitleColor(.Gray100, for: .normal)
        button.titleLabel?.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 14))
        return button
    }()
    
    private let dayDetailLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.TablingList.testLabel
        label.textColor = .Gray200
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 14))
        return label
    }()
    
    private let shopNameLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.TablingList.testLabel
        label.textColor = .Gray700
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 24))
        return label
    }()
    
    private let shopDetailButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiterals.Common.ic_next, for: .normal)
        return button
    }()
    
    private let waitingNumLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.TablingList.testLabel
        label.textColor = .TablingPrimary
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 24))
        return label
    }()
    
    private let beforeCountTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.TablingList.beforeCountTitle
        label.textColor = .Gray400
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 14))
        return label
    }()
    
    private let beforeCountLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.TablingList.testLabel
        label.textColor = .TablingPrimary
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 14))
        return label
    }()
    
    private let delayButton: UIButton = {
        let button = UIButton()
        button.setTitle(I18N.TablingList.delayButtonTitle, for: .normal)
        button.setTitleColor(.Gray600, for: .normal)
        button.titleLabel?.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 16))
        button.backgroundColor = .TablingWhite
        button.layer.cornerRadius = 8
        button.layer.borderColor = UIColor.Gray100.cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    private let confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle(I18N.TablingList.confirmButtonTitle, for: .normal)
        button.setTitleColor(.Gray600, for: .normal)
        button.titleLabel?.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 16))
        button.backgroundColor = .TablingWhite
        button.layer.cornerRadius = 8
        button.layer.borderColor = UIColor.Gray100.cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    private let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle(I18N.TablingList.cancelButtonTitle, for: .normal)
        button.setTitleColor(.Gray100, for: .normal)
        button.titleLabel?.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 14))
        button.backgroundColor = .clear
        return button
    }()
    
    private let reviewButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiterals.TablingList.ic_review, for: .normal)
        button.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 8)
        button.setTitle(I18N.TablingList.reviewButtonTitle, for: .normal)
        button.setTitleColor(.Gray600, for: .normal)
        button.titleLabel?.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 16))
        button.backgroundColor = .TablingWhite
        button.layer.cornerRadius = 8
        button.layer.borderColor = UIColor.Gray100.cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    private let reviewLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.TablingList.testLabel
        label.textColor = .Gray300
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 12))
        return label
    }()
    
    // MARK: - Life Cycles
 
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setUI()
        setHierarchy()
        setLayout()
        setAddTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
extension CompleteCollectionViewCell {
    func setUI() {
        backgroundColor = .TablingWhite
        
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        self.layer.shadowOpacity = 1
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.1).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 4
    }
    
    func setHierarchy() {
        addSubviews(statusPlanLabel, statusCompleteLabel, detailButton, dayDetailLabel, shopNameLabel, shopDetailButton, waitingNumLabel, beforeCountTitle, beforeCountLabel, delayButton, confirmButton, cancelButton, reviewButton, reviewLabel)
    }
    
    func setLayout() {
        statusPlanLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(21)
            $0.leading.equalToSuperview().inset(22)
            $0.width.equalTo(58)
            $0.height.equalTo(21)
        }
        
        statusCompleteLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(21)
            $0.leading.equalToSuperview().inset(22)
            $0.width.equalTo(61)
            $0.height.equalTo(22)
        }
        
        detailButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(17)
            $0.trailing.equalToSuperview().inset(25)
            $0.width.equalTo(53)
            $0.height.equalTo(28)
        }
        
        dayDetailLabel.snp.makeConstraints {
            $0.top.equalTo(statusPlanLabel.snp.bottom).offset(3)
            $0.leading.equalToSuperview().inset(22)
        }
        
        shopNameLabel.snp.makeConstraints {
            $0.top.equalTo(dayDetailLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(22)
        }
        
        shopDetailButton.snp.makeConstraints {
            $0.top.equalTo(shopNameLabel.snp.top)
            $0.leading.equalTo(shopNameLabel.snp.trailing).offset(1)
            $0.size.equalTo(31)
        }
        
        waitingNumLabel.snp.makeConstraints {
            $0.top.equalTo(shopNameLabel.snp.bottom).offset(5)
            $0.leading.equalTo(shopNameLabel.snp.leading)
        }
        
        beforeCountTitle.snp.makeConstraints {
            $0.top.equalTo(waitingNumLabel.snp.bottom).offset(5)
            $0.leading.equalTo(waitingNumLabel.snp.leading)
        }
        
        beforeCountLabel.snp.makeConstraints {
            $0.top.equalTo(beforeCountTitle.snp.top)
            $0.leading.equalTo(beforeCountTitle.snp.trailing)
        }
        
        delayButton.snp.makeConstraints {
            $0.top.equalTo(beforeCountTitle.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(51)
        }
        
        confirmButton.snp.makeConstraints {
            $0.top.equalTo(delayButton.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(51)
        }
        
        cancelButton.snp.makeConstraints {
            $0.top.equalTo(confirmButton.snp.bottom).offset(11)
            $0.centerX.equalToSuperview().inset(32)
            $0.height.equalTo(33)
        }
        
        reviewButton.snp.makeConstraints {
            $0.top.equalTo(shopNameLabel.snp.bottom).offset(22)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(51)
        }
        
        reviewLabel.snp.makeConstraints {
            $0.top.equalTo(reviewButton.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
    }
    
    func setAddTarget() {
        detailButton.addTarget(self, action: #selector(isTapped), for: .touchUpInside)
        shopDetailButton.addTarget(self, action: #selector(isTapped), for: .touchUpInside)
        confirmButton.addTarget(self, action: #selector(isTapped), for: .touchUpInside)
    }
    
    @objc
    func isTapped(_ sender: UIButton) {
        switch sender {
        case detailButton:
            completeDelegate?.detailButtonTapped()
        case shopDetailButton:
            completeDelegate?.shopButtonTappd()
        case confirmButton:
            completeDelegate?.confirmButtonTapped(index: idx)
        default:
            break
        }
    }
    
    func setCellLayout(status: String) {
        DispatchQueue.main.async {
            self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
        }
        
        switch status {
        case "이용 예정":
            statusPlanLabel.isHidden = false
            statusCompleteLabel.isHidden = true
            waitingNumLabel.isHidden = false
            beforeCountTitle.isHidden = false
            beforeCountLabel.isHidden = false
            delayButton.isHidden = false
            confirmButton.isHidden = false
            cancelButton.isHidden = false
            reviewButton.isHidden = true
            reviewLabel.isHidden = true
        case "이용 완료":
            statusPlanLabel.isHidden = true
            statusCompleteLabel.isHidden = false
            waitingNumLabel.isHidden = true
            beforeCountTitle.isHidden = true
            beforeCountLabel.isHidden = true
            delayButton.isHidden = true
            confirmButton.isHidden = true
            cancelButton.isHidden = true
            reviewButton.isHidden = false
            reviewLabel.isHidden = false
        default:
            break
        }
    }
    
    func setDataBind(model: TablingListEntity) {
        setCellLayout(status: model.orderStatus)
        shopNameLabel.text = model.shopName
        dayDetailLabel.text = "\(model.orderDate)  |  \(model.personCount)명"
        
        switch model.orderStatus {
        case "이용 예정":
            waitingNumLabel.text = "대기번호 #\(model.waitingNumber)"
            beforeCountLabel.text = "\(model.beforeCount)팀"
        case "이용 완료":
            if model.remainingReviewPeriod >= 0 {
                reviewLabel.text = "리뷰 작성 기간이 \(model.remainingReviewPeriod)일 남았어요!"
                reviewLabel.partColorChange(targetString: "\(model.remainingReviewPeriod)일", textColor: .TablingPrimary)
            } else {
                reviewButton.isEnabled = false
                reviewLabel.text = I18N.TablingList.reviewEndTitle
            }
        default:
            break
        }
    }
}
