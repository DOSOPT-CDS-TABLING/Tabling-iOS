//
//  StoreDetailView.swift
//  Tabling-iOS
//
//  Created by 고아라 on 2023/11/17.
//

import UIKit

import SnapKit

final class StoreDetailView: UIView {
    
    // MARK: - Properties
    var index: Int = 0
    
    // 움직일 underLineView의 leadingAnchor 따로 작성
    private lazy var leadingDistance: NSLayoutConstraint = {
        return underLineView.leadingAnchor.constraint(equalTo: segmentControl.leadingAnchor)
    }()
    
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
    
    private let lookMapButton: UIButton = {
        let button = UIButton()
        button.setTitle("지도보기", for: .normal)
        button.setTitleColor(.Gray200, for: .normal)
        button.titleLabel?.setLineAndCharacterSpacing(font: .pretendardRegular(size: 12))
        button.setImage(ImageLiterals.Common.ic_next, for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        return button
    }()
    
    private lazy var starStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubviews(firstStarIamge, secondStarIamge, thirdStarIamge, fourthStarIamge, fifthStarIamge)
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let firstStarIamge: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.Common.ic_star_fill
        return imageView
    }()
    
    private let secondStarIamge: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.Common.ic_star_fill
        return imageView
    }()
    
    private let thirdStarIamge: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.Common.ic_star_fill
        return imageView
    }()
    
    private let fourthStarIamge: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.Common.ic_star_fill
        return imageView
    }()
    
    private let fifthStarIamge: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.Common.ic_star_empty
        return imageView
    }()
    
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
        // segment.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        segment.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        
        segment.insertSegment(withTitle: "홈", at: 0, animated: true)
        segment.insertSegment(withTitle: "전체메뉴", at: 1, animated: true)
        segment.insertSegment(withTitle: "최근리뷰", at: 2, animated: true)
        segment.selectedSegmentIndex = 0
        
        segment.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.Gray200,
            NSAttributedString.Key.font: UIFont.pretendardRegular(size: 16)
        ], for: .normal)
        segment.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.Gray800,
            NSAttributedString.Key.font: UIFont.pretendardSemiBold(size: 16)
        ], for: .selected)
        
        segment.addTarget(self, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        // segment.addTarget(StoreDetailView.self, action: #selector(changeSegmentedControlLinePosition), for: .valueChanged)
        
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
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
        setAddTarget()
        setRegisterCell()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
extension StoreDetailView {
    func setUI() {
        
    }
    
    func setHierarchy() {
        self.addSubviews(storeNameLabel, storeAddressLabel, lookMapButton, starStackView, starScoreLabel, segmentControl, underLineView, grayView)
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
        }
        
        underLineView.snp.makeConstraints {
            $0.top.equalTo(segmentControl.snp.bottom).offset(45)
            $0.height.equalTo(2)
            $0.leading.trailing.equalToSuperview().inset(52)
            $0.width.equalTo(segmentControl.snp.width).multipliedBy(1/CGFloat(segmentControl.numberOfSegments))
        }
        
        grayView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(underLineView.snp.bottom)
            $0.height.equalTo(8)
        }
    }
    
    func setAddTarget() {
        
    }
    
    @objc
    func buttonTapped() {
        
    }
    
    @objc
    private func changeSegmentedControlLinePosition() {
        let segmentIndex = CGFloat(segmentControl.selectedSegmentIndex)
        let segmentWidth = segmentControl.frame.width / CGFloat(segmentControl.numberOfSegments)
        let leadingDistance = segmentWidth * segmentIndex
        UIView.animate(withDuration: 0.2, animations: { [weak self] in
            self?.leadingDistance.constant = leadingDistance
            self?.layoutIfNeeded()
        })
    }
    
    func setRegisterCell() {
        
    }
    
    func setDataBind() {
        
    }
}
