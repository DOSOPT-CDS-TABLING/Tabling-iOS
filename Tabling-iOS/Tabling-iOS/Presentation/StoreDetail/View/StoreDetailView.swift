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
        label.text = "파이브가이즈 여의도"
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 24))
        return label
    }()
    
    private let storeAddressLabel: UILabel = {
        let label = UILabel()
        label.text = "서울 영등포구 여의대로 108 (여의도동, 파크원) 더현대서울 B1"
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
        label.text = "3.9 (64)"
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
        segment.insertSegment(withTitle: I18N.StoreDetail.homeSegmentControlTitle, at: 0, animated: true)
        segment.insertSegment(withTitle: I18N.StoreDetail.menuSegmentControlTitle, at: 1, animated: true)
        segment.insertSegment(withTitle: I18N.StoreDetail.reviewSegmentControlTitle, at: 2, animated: true)
        segment.selectedSegmentIndex = 0
        segment.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.Gray200,
            NSAttributedString.Key.font: UIFont.pretendardSemiBold(size: 16)
        ], for: .normal)
        segment.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.Gray800,
            NSAttributedString.Key.font: UIFont.pretendardSemiBold(size: 16)
        ], for: .selected)
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()
    
    private let underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .Gray600
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let grayView: UIView = {
        let view = UIView()
        view.backgroundColor = .Gray000
        return view
    }()
    
    private let homeView: HomeView = {
        let view = HomeView()
        view.backgroundColor = .TablingWhite
        return view
    }()
    
    private let allMenuView: AllMenuView = {
        let view = AllMenuView()
        return view
    }()
    
    private let recentReviewView: RecentReviewView = {
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
        self.addSubviews(storeNameLabel, storeAddressLabel, lookMapTitleButton, lookMapButton, starStackView, starScoreLabel, segmentControl, underLineView, grayView, recentReviewView, allMenuView, homeView)
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
            $0.leading.trailing.equalToSuperview().inset(56)
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
        
        grayView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(underLineView.snp.bottom)
            $0.height.equalTo(8)
        }
        
        homeView.snp.makeConstraints {
            $0.top.equalTo(grayView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        allMenuView.snp.makeConstraints {
            $0.top.equalTo(grayView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        recentReviewView.snp.makeConstraints {
            $0.top.equalTo(grayView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setAddTarget() {
        segmentControl.addTarget(self, action: #selector(didChangeValue(_:)), for: .valueChanged)
        segmentControl.addTarget(self, action: #selector(changeSegmentedControlLinePosition(_:)), for: .valueChanged)
    }
    
    @objc
    private func didChangeValue(_ segment: UISegmentedControl) {
        switch segment.selectedSegmentIndex {
        case 0:
            homeView.isHidden = false
            allMenuView.isHidden = true
            recentReviewView.isHidden = true
        case 1:
            homeView.isHidden = true
            allMenuView.isHidden = false
            recentReviewView.isHidden = true
        default:
            homeView.isHidden = true
            allMenuView.isHidden = true
            recentReviewView.isHidden = false
        }
    }
    
    @objc
    private func changeSegmentedControlLinePosition(_ segment: UISegmentedControl) {
        lazy var leadingDistance: CGFloat =  CGFloat(segmentControl.selectedSegmentIndex)*93
        UIView.animate(withDuration: 0.2, animations: {
            self.underLineView.snp.updateConstraints { $0.leading.equalTo(self.segmentControl.snp.leading).offset(leadingDistance)
            }
            self.layoutIfNeeded()
        })
    }
}
