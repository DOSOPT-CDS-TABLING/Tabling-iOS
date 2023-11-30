//
//  HomeView.swift
//  Tabling-iOS
//
//  Created by 민 on 11/21/23.
//

import UIKit

import SnapKit

final class HomeView: UIView {
    
    // MARK: - UI Components
    
    lazy var storeTagCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 6
        flowLayout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.clipsToBounds = true
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.isUserInteractionEnabled = true
        collectionView.allowsSelection = true
        
        return collectionView
    }()
    
    private let salesInfoTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.StoreDetail.salesInfoTitle
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 16))
        label.textColor = .Gray800
        return label
    }()
    
    private lazy var salesInfoTitleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubviews(salesTimeInfoTitle, salesWaitTimeInfoTitle, salesRestTimeInfoTitle, salesDayoffInfoTitle, salesPhoneInfoTitle)
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.spacing = 9
        return stackView
    }()
    
    private let salesTimeInfoTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.StoreDetail.salesTimeInfoTitle
        label.setLineAndCharacterSpacing(font: .pretendardRegular(size: 14))
        label.textColor = .Gray800
        return label
    }()
    
    private let salesWaitTimeInfoTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.StoreDetail.salesWaitTimeInfoTitle
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 14))
        label.textColor = .TablingSecondary1
        return label
    }()
    
    private let salesRestTimeInfoTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.StoreDetail.salesRestTimeInfoTitle
        label.setLineAndCharacterSpacing(font: .pretendardRegular(size: 14))
        label.textColor = .Gray800
        return label
    }()
    
    private let salesDayoffInfoTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.StoreDetail.salesDayoffInfoTitle
        label.setLineAndCharacterSpacing(font: .pretendardRegular(size: 14))
        label.textColor = .Gray800
        return label
    }()
    
    private let salesPhoneInfoTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.StoreDetail.salesPhoneInfoTitle
        label.setLineAndCharacterSpacing(font: .pretendardRegular(size: 14))
        label.textColor = .Gray800
        return label
    }()
    
    private lazy var salesInfoContentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubviews(salesTimeInfoLabel, salesWaitTimeInfoLabel, salesRestTimeInfoLabel, salesDayoffInfoLabel, salesPhoneInfoLabel)
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.spacing = 9
        return stackView
    }()
    
    private let salesTimeInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "오늘 · 10:30 ~ 20:00"
        label.setLineAndCharacterSpacing(font: .pretendardRegular(size: 14))
        label.textColor = .Gray800
        return label
    }()
    
    private let salesWaitTimeInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "오늘 · 10:30 ~ 20:00"
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 14))
        label.textColor = .Gray800
        return label
    }()
    
    private let salesRestTimeInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "-"
        label.setLineAndCharacterSpacing(font: .pretendardRegular(size: 14))
        label.textColor = .Gray800
        return label
    }()
    
    private let salesDayoffInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "매주 화요일"
        label.setLineAndCharacterSpacing(font: .pretendardRegular(size: 14))
        label.textColor = .Gray800
        return label
    }()
    
    private let salesPhoneInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "02000000000"
        label.setLineAndCharacterSpacing(font: .pretendardRegular(size: 14))
        label.textColor = .Gray800
        return label
    }()
    
    private let storePickTagTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.StoreDetail.storePickTagTitle
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 16))
        label.textColor = .Gray800
        return label
    }()
    
    private let amenityTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.StoreDetail.amenityTitle
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 16))
        label.textColor = .Gray800
        return label
    }()
    
    private lazy var amenityIconStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubviews(wifiIcon, parkIcon, toiletIcon)
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.spacing = 12
        return stackView
    }()
    
    private lazy var amenityLabelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubviews(wifiLabel, parkLabel, toiletLabel)
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.spacing = 18
        return stackView
    }()
    
    private let wifiLabel: UILabel = {
        let label = UILabel()
        label.text = "무선인터넷"
        label.setLineAndCharacterSpacing(font: .pretendardRegular(size: 14))
        label.textColor = .Gray800
        return label
    }()
    
    private let parkLabel: UILabel = {
        let label = UILabel()
        label.text = "주차 이용 가능"
        label.setLineAndCharacterSpacing(font: .pretendardRegular(size: 14))
        label.textColor = .Gray800
        return label
    }()
    
    private let toiletLabel: UILabel = {
        let label = UILabel()
        label.text = "남녀 화장실 구분"
        label.setLineAndCharacterSpacing(font: .pretendardRegular(size: 14))
        label.textColor = .Gray800
        return label
    }()
    
    private let wifiIcon: UIImageView = UIImageView(image: ImageLiterals.StoreDetail.ic_wifi)
    
    private let parkIcon: UIImageView = UIImageView(image: ImageLiterals.StoreDetail.ic_parking)
    
    private let toiletIcon: UIImageView = UIImageView(image: ImageLiterals.StoreDetail.ic_toilet)
    
    private let introduceStoreTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.StoreDetail.introduceStoreTitle
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 16))
        label.textColor = .Gray800
        return label
    }()
    
    private let introduceStoreLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "파이브 가이즈 한국상륙!!!\nhttps://www.instagram.com/fiveguys.korea"
        label.setLineAndCharacterSpacing(font: .pretendardRegular(size: 14))
        label.textColor = .Gray800
        return label
    }()
    
    // MARK: - Life Cycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
        setRegisterCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
extension HomeView {
    func setHierarchy() {
        addSubviews(salesInfoTitle, salesInfoTitleStackView, salesInfoContentStackView, storePickTagTitle, storeTagCollectionView, amenityTitle, amenityIconStackView, amenityLabelStackView, introduceStoreTitle, introduceStoreLabel)
    }
    
    func setLayout() {
        salesInfoTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(22)
            $0.left.equalToSuperview().offset(15)
        }
        
        salesInfoTitleStackView.snp.makeConstraints {
            $0.top.equalTo(salesInfoTitle.snp.bottom).offset(16)
            $0.left.equalTo(salesInfoTitle)
            $0.width.equalTo(74)
        }
        salesInfoContentStackView.snp.makeConstraints {
            $0.top.equalTo(salesInfoTitleStackView)
            $0.left.equalTo(salesInfoTitleStackView.snp.right).offset(14)
        }
        storePickTagTitle.snp.makeConstraints {
            $0.top.equalTo(salesInfoContentStackView.snp.bottom).offset(48)
            $0.left.equalTo(salesInfoTitle)
        }
        storeTagCollectionView.snp.removeConstraints()
        storeTagCollectionView.snp.makeConstraints {
            $0.top.equalTo(storePickTagTitle.snp.bottom).offset(12)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-16)
            $0.height.equalTo(74)
        }
        amenityTitle.snp.makeConstraints {
            $0.left.equalTo(storePickTagTitle)
            $0.top.equalTo(storeTagCollectionView.snp.bottom).offset(48)
        }
        amenityIconStackView.snp.makeConstraints {
            $0.left.equalTo(amenityTitle)
            $0.top.equalTo(amenityTitle.snp.bottom).offset(12)
        }
        amenityLabelStackView.snp.makeConstraints {
            $0.left.equalTo(amenityIconStackView.snp.right).offset(5)
            $0.top.equalTo(amenityTitle.snp.bottom).offset(16)
        }
        introduceStoreTitle.snp.makeConstraints {
            $0.left.equalTo(amenityTitle)
            $0.top.equalTo(amenityLabelStackView.snp.bottom).offset(48)
        }
        introduceStoreLabel.snp.makeConstraints {
            $0.left.equalTo(introduceStoreTitle)
            $0.top.equalTo(introduceStoreTitle.snp.bottom).offset(12)
        }
    }
    
    func setRegisterCell() {
        StoreTagCollectionViewCell.register(collectionView: storeTagCollectionView)
    }
    
    func setDataBind(model: StoreDetailEntity) {
        salesTimeInfoLabel.text = model.salesTime
        salesWaitTimeInfoLabel.text = model.waitingTime
        salesRestTimeInfoLabel.text = model.restTime
        salesDayoffInfoLabel.text = model.restDay
        salesPhoneInfoLabel.text = model.phoneNumber
        introduceStoreLabel.text = model.introduceContent
    }
}

extension HomeView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel()
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 12))
        label.font = .pretendardRegular(size: 12)
        label.sizeToFit()
        
        let labelWidth = label.frame.width + 32
        let labelHeight: CGFloat = 32
        
        return CGSize(width: labelWidth, height: labelHeight)
    }
}
