//
//  StoreDetailBottomTabView.swift
//  Tabling-iOS
//
//  Created by 민 on 11/20/23.
//

import UIKit

import SnapKit

final class StoreDetailBottomTabView: UIView {

    // MARK: - UI Components
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.addArrangedSubviews(tablingbutton, reservationbutton, orederButton)
        return stackView
    }()
    
    private let tablingbutton: UIButton = {
        let button = UIButton()
        button.setTitle("원격줄서기", for: .normal)
        button.setTitleColor(.TablingPrimary, for: .normal)
        button.layer.cornerRadius = 6
        button.layer.borderColor = UIColor.TablingPrimary.cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    private let reservationbutton: UIButton = {
        let button = UIButton()
        button.setTitle("예약 불가", for: .normal)
        button.setTitleColor(.Gray100, for: .normal)
        button.layer.cornerRadius = 6
        button.layer.borderColor = UIColor.Gray100.cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    private let orederButton: UIButton = {
        let button = UIButton()
        button.setTitle("주문 불가", for: .normal)
        button.setTitleColor(.Gray100, for: .normal)
        button.layer.cornerRadius = 6
        button.layer.borderColor = UIColor.Gray100.cgColor
        button.layer.borderWidth = 1
        return button
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
extension StoreDetailBottomTabView {
    func setUI() {
        
    }
    
    func setHierarchy() {
        self.addSubview(buttonStackView)
    }
    
    func setLayout() {
        buttonStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(14)
            $0.bottom.equalToSuperview().inset(44)
        }
    }
    
    func setAddTarget() {
        tablingbutton.addTarget(self, action: #selector(tablingButtonTapped), for: .touchUpInside)
    }
    
    @objc
    func tablingButtonTapped() {
        print("click!")
    }
}
