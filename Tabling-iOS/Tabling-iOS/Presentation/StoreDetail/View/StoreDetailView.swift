//
//  StoreDetailView.swift
//  Tabling-iOS
//
//  Created by 고아라 on 2023/11/17.
//

import UIKit

import SnapKit

final class StoreDetailView: UIView {
    
    // MARK: - UI Components
    
    private let storeNameLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.StoreDetail.testLabel
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 24))
        return label
    }()
    
    private let storeAddressLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.StoreDetail.testLabel
        label.setLineAndCharacterSpacing(font: .pretendardRegular(size: 14))
        label.textColor = .Gray200
        label.numberOfLines = 2
        return label
    }()
    
    private let lookMapTitleButton: UIButton = {
        let button = UIButton()
        button.setTitle(I18N.StoreDetail.lookMapButtonTitle, for: .normal)
        button.setTitleColor(.Gray200, for: .normal)
        button.titleLabel?.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 12))
        return button
    }()
    
    private let lookMapButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiterals.Common.ic_next, for: .normal)
        return button
    }()
    
    private lazy var starStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubviews(firstStarIamge, secondStarIamge, thirdStarIamge, fourthStarIamge, fifthStarIamge)
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let firstStarIamge: UIImageView = UIImageView(image: ImageLiterals.Common.ic_star_fill)
    
    private let secondStarIamge: UIImageView = UIImageView(image: ImageLiterals.Common.ic_star_fill)
    
    private let thirdStarIamge: UIImageView = UIImageView(image: ImageLiterals.Common.ic_star_fill)
    
    private let fourthStarIamge: UIImageView = UIImageView(image: ImageLiterals.Common.ic_star_fill)
    
    private let fifthStarIamge: UIImageView = UIImageView(image: ImageLiterals.Common.ic_star_empty)
    
    private let starScoreLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.StoreDetail.testLabel
        label.font = .pretendardRegular(size: 12)
        label.textColor = .Gray800
        
        let targetString = label.text?.components(separatedBy: " ").first ?? ""
        label.partFontChange(targetString: targetString, font: .pretendardSemiBold(size: 12), textColor: .Gray800)
        return label
    }()
    
    private let segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.selectedSegmentTintColor = .clear
        segment.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        segment.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        
        let titles = [
            I18N.StoreDetail.homeSegmentControlTitle,
            I18N.StoreDetail.menuSegmentControlTitle,
            I18N.StoreDetail.reviewSegmentControlTitle
        ]
        for (index, title) in titles.enumerated() {
            segment.insertSegment(withTitle: title, at: index, animated: true)
            segment.setWidth(92, forSegmentAt: index)
        }

        let normalAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.Gray200,
            .font: UIFont.pretendardSemiBold(size: 16)
        ]
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.Gray800,
            .font: UIFont.pretendardSemiBold(size: 16)
        ]
        segment.selectedSegmentIndex = 0
        segment.setTitleTextAttributes(normalAttributes, for: .normal)
        segment.setTitleTextAttributes(selectedAttributes, for: .selected)

        return segment
    }()
    
    private let underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .Gray600
        return view
    }()
    
    private let firstGrayView = {
        let view = UIView()
        view.backgroundColor = .Gray000
        return view
    }()
    
    let homeView: HomeView = {
        let view = HomeView()
        view.backgroundColor = .TablingWhite
        return view
    }()
    
    private let secondGrayView = {
        let view = UIView()
        view.backgroundColor = .Gray000
        return view
    }()
    
    let allMenuView: AllMenuView = {
        let view = AllMenuView()
        return view
    }()
    
    private let thirdGrayView = {
        let view = UIView()
        view.backgroundColor = .Gray000
        return view
    }()
    
    let recentReviewView: RecentReviewView = {
        let view = RecentReviewView()
        return view
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
        setAddTarget()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
extension StoreDetailView {
    func setHierarchy() {
        self.addSubviews(storeNameLabel, storeAddressLabel, lookMapTitleButton, lookMapButton, starStackView, starScoreLabel, segmentControl, underLineView, firstGrayView, recentReviewView, secondGrayView, allMenuView, thirdGrayView, homeView)
    }
    
    func setLayout() {
        storeNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(19)
            $0.leading.equalToSuperview().inset(16)
            $0.height.equalTo(36)
        }
        
        storeAddressLabel.snp.makeConstraints {
            $0.top.equalTo(storeNameLabel.snp.bottom).offset(6)
            $0.leading.equalTo(storeNameLabel.snp.leading)
            $0.width.equalTo(260)
            $0.height.equalTo(42)
        }
        
        lookMapButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(57)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.height.equalTo(12)
        }
        
        lookMapTitleButton.snp.makeConstraints {
            $0.centerY.equalTo(lookMapButton)
            $0.trailing.equalTo(lookMapButton.snp.leading).offset(-1)
        }
        
        starStackView.snp.makeConstraints {
            $0.leading.equalTo(storeNameLabel.snp.leading)
            $0.top.equalTo(storeAddressLabel.snp.bottom).offset(6)
            $0.height.equalTo(14)
            $0.width.equalTo(70)
        }
        
        starScoreLabel.snp.makeConstraints {
            $0.leading.equalTo(starStackView.snp.trailing).offset(3)
            $0.centerY.equalTo(starStackView.snp.centerY)
        }
        
        segmentControl.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(52)
            $0.top.equalTo(starStackView.snp.bottom).offset(17)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(34)
        }
        
        underLineView.snp.makeConstraints {
            $0.top.equalTo(segmentControl.snp.bottom).offset(21)
            $0.width.equalTo(92)
            $0.height.equalTo(2)
            $0.leading.equalTo(segmentControl.snp.leading)
        }
        
        firstGrayView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(underLineView.snp.bottom)
            $0.height.equalTo(8)
        }
        
        homeView.snp.makeConstraints {
            $0.top.equalTo(firstGrayView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(681)
        }
        
        secondGrayView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(homeView.snp.bottom)
            $0.height.equalTo(8)
        }
        
        allMenuView.snp.makeConstraints {
            $0.top.equalTo(secondGrayView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(702)
        }
        
        thirdGrayView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(allMenuView.snp.bottom)
            $0.height.equalTo(8)
        }
        
        recentReviewView.snp.makeConstraints {
            $0.top.equalTo(thirdGrayView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setAddTarget() {
        segmentControl.addTarget(self, action: #selector(didChangeValue(_:)), for: .valueChanged)
        segmentControl.addTarget(self, action: #selector(changeSegmentedControlLinePosition(_:)), for: .valueChanged)
    }
    
    @objc
    private func didChangeValue(_ segment: UISegmentedControl) {
//        switch segment.selectedSegmentIndex {
//        case 0:
//            homeView.isHidden = false
//            allMenuView.isHidden = true
//            recentReviewView.isHidden = true
//        case 1:
//            homeView.isHidden = true
//            allMenuView.isHidden = false
//            recentReviewView.isHidden = true
//        default:
//            homeView.isHidden = true
//            allMenuView.isHidden = true
//            recentReviewView.isHidden = false
//        }
    }
    
    @objc
    func changeSegmentedControlLinePosition(_ segment: UISegmentedControl) {
        let leadingDistance = Int(92 * CGFloat(segment.selectedSegmentIndex) + (92 - self.underLineView.bounds.width) * 0.5)
        UIView.animate(withDuration: 0.2, animations: {
            self.underLineView.snp.updateConstraints { $0.leading.equalTo(self.segmentControl.snp.leading).offset(leadingDistance) }
            self.layoutIfNeeded()
        })
    }
    
    func setDataBind(model: StoreDetailEntity) {
        storeNameLabel.text = model.name
        storeAddressLabel.text = model.longAddress
        for (index, starImage) in starStackView.arrangedSubviews.enumerated() {
            if let starImage = starImage as? UIImageView {
                if index < Int(model.averageStar) {
                    starImage.image = ImageLiterals.Common.ic_star_fill
                } else {
                    starImage.image = ImageLiterals.Common.ic_star_empty
                }
            }
        }
        starScoreLabel.text = "\(model.averageStar).0 (\(model.reviewCount))"
    }
}
