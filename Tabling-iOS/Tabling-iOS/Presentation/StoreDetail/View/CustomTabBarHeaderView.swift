//
//  CustomTabBarHeaderView.swift
//  Tabling-iOS
//
//  Created by 민 on 12/4/23.
//

import UIKit

protocol CustomTabBarHeaderViewDelegate: AnyObject {
    func firstSegmentClicked()
    func secondSegmentClicked()
    func thirdSegmentClicked()
}

class CustomTabBarHeaderView: UIView {
    
    // MARK: - Properties
    
    weak var customTabBarHeaderViewDelegate: CustomTabBarHeaderViewDelegate?
    
    // MARK: - UI Components
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubviews(homeButton, allMenuButton, recentReviewButton)
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        return stackView
    }()
    
    private let homeButton: UIButton = {
        let button = UIButton()
        button.isHighlighted = true
        button.setTitle(I18N.StoreDetail.homeSegmentControlTitle, for: .normal)
        button.titleLabel?.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 16))
        button.setTitleColor(.Gray200, for: .normal)
        button.setTitleColor(.Gray800, for: .highlighted)
        return button
    }()
    
    private let allMenuButton: UIButton = {
        let button = UIButton()
        button.setTitle(I18N.StoreDetail.menuSegmentControlTitle, for: .normal)
        button.titleLabel?.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 16))
        button.setTitleColor(.Gray200, for: .normal)
        button.setTitleColor(.Gray800, for: .highlighted)
        return button
    }()
    
    private let recentReviewButton: UIButton = {
        let button = UIButton()
        button.setTitle(I18N.StoreDetail.reviewSegmentControlTitle, for: .normal)
        button.titleLabel?.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 16))
        button.setTitleColor(.Gray200, for: .normal)
        button.setTitleColor(.Gray800, for: .highlighted)
        return button
    }()
    
    private let underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .Gray600
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

extension CustomTabBarHeaderView {
    
    func setHierarchy() {
        self.addSubviews(stackView, underLineView)
    }
    
    func setLayout() {
        stackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(52)
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.height.equalTo(34)
        }
        
        underLineView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.width.equalTo(92)
            $0.height.equalTo(2)
            $0.leading.equalTo(stackView.snp.leading).offset(-3)
        }
    }
    
    func changeCustomHeader(index: Int) {
        changeSegmentedControlLinePosition(selectedSegmentIndex: index)
        switch index {
        case 0:
            homeButton.isHighlighted = true
            allMenuButton.isHighlighted = false
            recentReviewButton.isHighlighted = false
        case 1:
            homeButton.isHighlighted = false
            allMenuButton.isHighlighted = true
            recentReviewButton.isHighlighted = false
        default:
            homeButton.isHighlighted = false
            allMenuButton.isHighlighted = false
            recentReviewButton.isHighlighted = true
        }
    }
    
    func changeSegmentedControlLinePosition(selectedSegmentIndex: Int) {
        let leadingDistance = Int(95 * CGFloat(selectedSegmentIndex) + (95 - self.underLineView.bounds.width) * 0.5)
        UIView.animate(withDuration: 0.2, animations: {
            self.underLineView.snp.updateConstraints {
                $0.leading.equalTo(self.stackView.snp.leading).offset(leadingDistance) }
            self.layoutIfNeeded()
        })
    }
    
    func setAddTarget() {
        homeButton.addTarget(self, action: #selector(isTabButtonClicked), for: .touchUpInside)
        allMenuButton.addTarget(self, action: #selector(isTabButtonClicked), for: .touchUpInside)
        recentReviewButton.addTarget(self, action: #selector(isTabButtonClicked), for: .touchUpInside)
    }
    
    @objc
    private func isTabButtonClicked(_ sender: UIButton) {
        switch sender {
        case homeButton:
            customTabBarHeaderViewDelegate?.firstSegmentClicked()
        case allMenuButton:
            customTabBarHeaderViewDelegate?.secondSegmentClicked()
        case recentReviewButton:
            customTabBarHeaderViewDelegate?.thirdSegmentClicked()
        default:
            break
        }
    }
}
