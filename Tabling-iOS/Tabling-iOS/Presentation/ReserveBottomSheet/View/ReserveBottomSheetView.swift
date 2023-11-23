//
//  ReserveBottomSheetView.swift
//  Tabling-iOS
//
//  Created by 민 on 11/22/23.
//

import UIKit

import SnapKit

protocol ReserveBottomSheetButtonDelegate: AnyObject {
    func bottomSheetCloseButtonTapped()
    func bottomSheetTablingButtonTapped()
}

final class ReserveBottomSheetView: UIView {
    
    // MARK: - Properties
    
    weak var reserveBottomSheetButtonDelegate: ReserveBottomSheetButtonDelegate?
    
    private var personCount: Int = 1 {
        didSet {
            personCountLabel.text = personCount.description
        }
    }
    
    // MARK: - UI Components
    
    private let dismissButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiterals.StoreDetail.ic_exit_circle, for: .normal)
        return button
    }()
    
    private let personChoiceLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.ReserveBottomSheet.personChoiceTitle
        label.textColor = .Gray800
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 20))
        label.partColorChange(targetString: "방문 인원", textColor: .TablingSecondary1)
        return label
    }()
    
    private let personLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.ReserveBottomSheet.personTitle
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 16))
        return label
    }()
    
    private lazy var choicePersonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubviews(minusButton, personCountLabel, plusButton)
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var choicePersonView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.Gray100.cgColor
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let minusButton: UIButton = {
        let button = UIButton(type: .custom)
        button.isEnabled = false
        button.setImage(ImageLiterals.StoreDetail.ic_minus_able, for: .normal)
        button.setImage(ImageLiterals.StoreDetail.ic_minus_disable, for: .disabled)
        return button
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiterals.StoreDetail.ic_plus, for: .normal)
        return button
    }()
    
    private lazy var personCountLabel: UILabel = {
        let label = UILabel()
        label.text = personCount.description
        label.textAlignment = .center
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 16))
        return label
    }()
    
    private let tablingButton: UIButton = {
        let button = UIButton()
        button.setTitle(I18N.ReserveBottomSheet.tablingButtonTitle, for: .normal)
        button.setTitleColor(.TablingWhite, for: .normal)
        button.titleLabel?.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 16))
        button.layer.cornerRadius = 8
        button.backgroundColor = .TablingPrimary
        return button
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
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
extension ReserveBottomSheetView {
    func setUI() {
        self.backgroundColor = .TablingWhite
    }
    
    func setHierarchy() {
        addSubviews(dismissButton, personChoiceLabel, personLabel, choicePersonView, tablingButton)
        choicePersonView.addSubviews(minusButton, personCountLabel, plusButton)
    }
    
    func setLayout() {
        dismissButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(19)
            $0.trailing.equalToSuperview().inset(16)
            $0.size.equalTo(24)
        }
        
        personChoiceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(45)
            $0.leading.equalToSuperview().inset(14)
        }
        
        personLabel.snp.makeConstraints {
            $0.top.equalTo(personChoiceLabel.snp.bottom).offset(28)
            $0.leading.equalToSuperview().inset(16)
        }
        
        choicePersonView.snp.makeConstraints {
            $0.centerY.equalTo(personLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(102)
            $0.height.equalTo(38)
        }
        
        minusButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(10)
            $0.width.equalTo(18)
            $0.height.equalTo(18)
        }
        
        personCountLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        plusButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(10)
            $0.width.equalTo(18)
            $0.height.equalTo(18)
        }
        
        tablingButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(38)
            $0.height.equalTo(56)
        }
    }
    
    func setAddTarget() {
        dismissButton.addTarget(self, action: #selector(closeButtonClicked), for: .touchUpInside)
        tablingButton.addTarget(self, action: #selector(tablingButtonClicked), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(minusButtonClicked), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(plusButtonClicked), for: .touchUpInside)
    }
    
    @objc
    func closeButtonClicked(_ sender: UIButton) {
        reserveBottomSheetButtonDelegate?.bottomSheetCloseButtonTapped()
    }
    
    @objc
    func tablingButtonClicked(_ sender: UIButton) {
        reserveBottomSheetButtonDelegate?.bottomSheetTablingButtonTapped()
    }
    
    @objc
    func minusButtonClicked(_ sender: UIButton) {
        if personCount >= 2 { personCount -= 1 }
        if personCount == 1 { minusButton.isEnabled = false }
    }
    
    @objc
    func plusButtonClicked(_ sender: UIButton) {
        if personCount <= 99 { personCount += 1 }
        if personCount >= 2 { minusButton.isEnabled = true }
    }
    
    func setDataBind() {
        
    }
}
