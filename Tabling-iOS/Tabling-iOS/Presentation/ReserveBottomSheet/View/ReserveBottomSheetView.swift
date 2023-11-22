//
//  ReserveBottomSheetView.swift
//  Tabling-iOS
//
//  Created by 민 on 11/22/23.
//

import UIKit

import SnapKit

final class ReserveBottomSheetView: UIView {
    
    // MARK: - Properties
    
    // weak var delegate: menuCountDelegate?
    
    private var personCount: Int = 1 {
        didSet {
            personLabel.text = personCount.description
            // self.delegate?.priceChangeByMenuCount(menuCont: menuCount)
        }
    }
    // MARK: - UI Components
    
    private let personChoiceLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.ReserveBottomSheet.personChoiceTitle
        return label
    }()
    
    private let personLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.ReserveBottomSheet.personTitle
        return label
    }()
    
    private let minusButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private lazy var personCountLabel: UILabel = {
        let label = UILabel()
        label.text = personCount.description
        return label
    }()
    
    private let tablingButton: UIButton = {
        let button = UIButton()
        button.setTitle(I18N.ReserveBottomSheet.tablingButtonTitle, for: .normal)
        return button
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
extension ReserveBottomSheetView {
    func setUI() {
        
    }
    
    func setHierarchy() {
        
    }
    
    func setLayout() {
        
    }
    
    func setAddTarget() {
        
    }
    
    @objc
    func buttonTapped() {
        
    }
    
    func setRegisterCell() {
        
    }
    
    func setDataBind() {
        
    }
}
