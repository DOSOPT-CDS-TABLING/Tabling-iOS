//
//  ReserveAlertView.swift
//  Tabling-iOS
//
//  Created by 고아라 on 2023/11/21.
//

import UIKit

import SnapKit

protocol ButtonDelegate: AnyObject {
    func closeButtonTapped()
    func detailButtonTappd()
}

final class ReserveAlertView: UIView {
    
    // MARK: - Properties
    
    weak var buttonDelegate: ButtonDelegate?
    
    // MARK: - UI Components
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiterals.StoreDetail.ic_exit_circle, for: .normal)
        return button
    }()
    
    private let reserveTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.ReserveAlert.reserveTitle
        label.textColor = .Gray700
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 20))
        label.partColorChange(targetString: "대기 신청", textColor: .TablingSecondary1)
        return label
    }()
    
    private let waitingView: UIView = {
        let view = UIView()
        view.backgroundColor = .Gray600
        view.layer.cornerRadius = 4
        return view
    }()
    
    private let waitingIcon: UIImageView = UIImageView(image: ImageLiterals.StoreDetail.ic_waiting)
    
    private let waitingTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.ReserveAlert.waitingTitle
        label.textColor = .TablingSecondary2
        label.font = .pretendardSemiBold(size: 16)
        return label
    }()
    
    private let waitingNum: UILabel = {
        let label = UILabel()
        label.textColor = .TablingWhite
        label.font = .pretendardSemiBold(size: 24)
        return label
    }()
    
    private let waitingNumTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.ReserveAlert.waitingNumTitle
        label.textColor = .Gray200
        label.font = .pretendardSemiBold(size: 16)
        return label
    }()
    
    private let infoIcon: UIImageView = UIImageView(image: ImageLiterals.StoreDetail.ic_info)
    
    private let infoTitle: UILabel = {
        let label = UILabel()
        label.textColor = .TablingPrimary
        label.font = .pretendardSemiBold(size: 12)
        return label
    }()
    
    private let detailView: UIView = {
        let view = UIView()
        view.backgroundColor = .Gray000
        view.layer.cornerRadius = 4
        return view
    }()
    
    private let shopTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.ReserveAlert.shopTitle
        label.textColor = .Gray200
        label.font = .pretendardSemiBold(size: 14)
        return label
    }()
    
    private let shopLabel: UILabel = {
        let label = UILabel()
        label.textColor = .Gray300
        label.font = .pretendardSemiBold(size: 14)
        return label
    }()
    
    private let personTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.ReserveAlert.personTitle
        label.textColor = .Gray200
        label.font = .pretendardSemiBold(size: 14)
        return label
    }()
    
    private let personLabel: UILabel = {
        let label = UILabel()
        label.textColor = .Gray300
        label.font = .pretendardSemiBold(size: 14)
        return label
    }()
    
    private let statusTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.ReserveAlert.statusTitle
        label.textColor = .Gray200
        label.font = .pretendardSemiBold(size: 14)
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .Gray300
        label.font = .pretendardSemiBold(size: 14)
        return label
    }()
    
    private let detailButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .TablingPrimary
        button.setTitle(I18N.ReserveAlert.reserveButtonTitle, for: .normal)
        button.titleLabel?.font = .pretendardSemiBold(size: 14)
        button.titleLabel?.textColor = .TablingWhite
        button.layer.cornerRadius = 8
        return button
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .Gray500
        
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

extension ReserveAlertView {
    func setUI() {
        backgroundColor = .TablingWhite
        layer.cornerRadius = 8
    }
    
    func setHierarchy() {
        waitingView.addSubviews(waitingIcon, waitingTitle, waitingNumTitle, waitingNum)
        detailView.addSubviews(shopTitle, shopLabel, personTitle, personLabel, statusTitle, statusLabel)
        addSubviews(closeButton, reserveTitle, waitingView, infoIcon, infoTitle, detailView, detailButton)
    }
    
    func setLayout() {
        closeButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(19)
            $0.trailing.equalToSuperview().inset(16)
            $0.size.equalTo(24)
        }
        
        reserveTitle.snp.makeConstraints {
            $0.top.equalToSuperview().inset(41)
            $0.leading.equalToSuperview().inset(16)
        }
        
        waitingView.snp.makeConstraints {
            $0.top.equalTo(reserveTitle.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(284)
            $0.height.equalTo(52)
        }
        
        waitingIcon.snp.makeConstraints {
            $0.centerY.equalToSuperview().inset(18)
            $0.leading.equalToSuperview().inset(20)
            $0.size.equalTo(16)
        }
        
        waitingTitle.snp.makeConstraints {
            $0.centerY.equalToSuperview().inset(14)
            $0.leading.equalTo(waitingIcon.snp.trailing).offset(8)
        }
        
        waitingNumTitle.snp.makeConstraints {
            $0.top.equalToSuperview().inset(17)
            $0.trailing.equalToSuperview().inset(25)
        }
        
        waitingNum.snp.makeConstraints {
            $0.centerY.equalToSuperview().inset(12)
            $0.trailing.equalTo(waitingNumTitle.snp.leading).offset(-5)
        }
        
        infoIcon.snp.makeConstraints {
            $0.top.equalTo(waitingView.snp.bottom).offset(12)
            $0.leading.equalTo(waitingView.snp.leading)
            $0.size.equalTo(24)
        }
        
        infoTitle.snp.makeConstraints {
            $0.top.equalTo(waitingView.snp.bottom).offset(17)
            $0.leading.equalTo(infoIcon.snp.trailing)
        }
        
        detailView.snp.makeConstraints {
            $0.top.equalTo(infoIcon.snp.bottom).offset(16)
            $0.centerX.equalToSuperview().inset(16)
            $0.width.equalTo(283)
            $0.height.equalTo(105)
        }
        
        shopTitle.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.leading.equalToSuperview().inset(12)
            $0.height.equalTo(23)
        }
        
        shopLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview().inset(12)
            $0.height.equalTo(23)
        }
        
        personTitle.snp.makeConstraints {
            $0.top.equalTo(shopTitle.snp.bottom).offset(6)
            $0.leading.equalToSuperview().inset(12)
            $0.height.equalTo(23)
        }
        
        personLabel.snp.makeConstraints {
            $0.top.equalTo(shopLabel.snp.bottom).offset(6)
            $0.trailing.equalToSuperview().inset(12)
            $0.height.equalTo(23)
        }
        
        statusTitle.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(12)
            $0.leading.equalToSuperview().inset(12)
            $0.height.equalTo(23)
        }
        
        statusLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview().inset(12)
            $0.height.equalTo(23)
        }
        
        detailButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(33)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(56)
        }
    }
    
    func setAddTarget() {
        closeButton.addTarget(self, action: #selector(isTapped), for: .touchUpInside)
        detailButton.addTarget(self, action: #selector(isTapped), for: .touchUpInside)
    }
    
    @objc
    func isTapped(_ sender: UIButton) {
        switch sender {
        case closeButton:
            buttonDelegate?.closeButtonTapped()
        case detailButton:
            buttonDelegate?.detailButtonTappd()
        default:
            break
        }
    }
    
    func setDataBind(model: ReserveEntity) {
        waitingNum.text = String(model.waitingNumber)
        infoTitle.text = "현재 내 앞 대기 \(model.beforeCount)팀"
        shopLabel.text = model.shopName
        personLabel.text = "\(model.personCount)명"
        statusLabel.text = model.orderStatus
    }
}
