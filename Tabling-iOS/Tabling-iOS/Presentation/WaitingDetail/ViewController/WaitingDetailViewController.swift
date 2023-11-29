//
//  WaitingDetailViewController.swift
//  Tabling-iOS
//
//  Created by 고아라 on 2023/11/17.
//

import UIKit

final class WaitingDetailViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: - UI Components
    private let myView = View()
    
    private let currentStatusLabel: UILabel = {
        let label = UILabel()
        label.text = "대기중이에요"
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 12))
        label.textColor = .Gray300
        return label
    }()
    
    private let storeNameLabel: UILabel = {
        let label = UILabel()
        label.text = "파이브가이즈 여의도"
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 24))
        label.textColor = .Gray700
        return label
    }()
    
    private let waitingNumTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "대기번호 #66"
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 20))
        label.textColor = .TablingPrimary
        return label
    }()
    
    private let queueView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.backgroundColor = .Gray700
        return view
    }()
    
    private let queueTitle: UILabel = {
        let label = UILabel()
        label.text = "내 앞 대기"
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 14))
        label.textColor = .TablingWhite
        return label
    }()
    
    private let queueNumLabel: UILabel = {
        let label = UILabel()
        label.text = "4팀"
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 20))
        label.textColor = .TablingPrimary
        return label
    }()
    
    private lazy var tagButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubviews(callButtonImage, locationButtonImage, detailButtonImage)
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        return stackView
    }()
    
    private let callButtonImage: UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleAspectFill
        image = UIImageView(image: ImageLiterals.WaitingDetail.tag_call)
        return image
    }()
    
    private let locationButtonImage: UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleAspectFill
        image = UIImageView(image: ImageLiterals.WaitingDetail.tag_location)
        return image
    }()
    
    private let detailButtonImage: UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleAspectFill
        image = UIImageView(image: ImageLiterals.WaitingDetail.tag_storeDetail)
        return image
    }()
    
    private let divideSectionView: UIView = {
        var view = UIView()
        view.backgroundColor = .Gray000
        return view
    }()
    
    private let divideContentView: UIView = {
        var view = UIView()
        view.backgroundColor = .Gray000
        return view
    }()
    
    private let divideContentView2: UIView = {
        var view = UIView()
        view.backgroundColor = .Gray000
        return view
    }()
    
    private let salesInfoTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.WaitingDetail.waitingInfoTitle
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 16))
        label.textColor = .Gray800
        return label
    }()
    
    private lazy var waitingTitleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubviews(waitingDateTitle, waitingNumTitle, waitingheadCountTitle, waitingStatusTitle, totalSalesTitle)
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private let waitingDateTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.WaitingDetail.waitingDateTitle
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 14))
        label.textColor = .Gray200
        return label
    }()
    
    private let waitingNumTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.WaitingDetail.waitingNumTitle
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 14))
        label.textColor = .Gray200
        return label
    }()
    
    private let waitingheadCountTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.WaitingDetail.waitingheadCountTitle
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 14))
        label.textColor = .Gray200
        return label
    }()
    
    private let waitingStatusTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.WaitingDetail.waitingStatusTitle
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 14))
        label.textColor = .Gray200
        return label
    }()
    
    private let totalSalesTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.WaitingDetail.totalSalesTitle
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 14))
        label.textColor = .Gray500
        return label
    }()
    
    private lazy var waitingLabelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubviews(waitingDateLabel, waitingNumLabel, waitingheadCountLabel, waitingStatusLabel, totalSalesLabel)
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private let waitingDateLabel: UILabel = {
        let label = UILabel()
        label.text = "2023-11-13 (월)  20:39"
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 14))
        label.textColor = .Gray300
        label.textAlignment = .right
        return label
    }()
    
    private let waitingNumLabel: UILabel = {
        let label = UILabel()
        label.text = "66번"
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 14))
        label.textColor = .Gray300
        label.textAlignment = .right
        return label
    }()
    
    private let waitingheadCountLabel: UILabel = {
        let label = UILabel()
        label.text = "2명"
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 14))
        label.textColor = .Gray300
        label.textAlignment = .right
        return label
    }()
    
    private let waitingStatusLabel: UILabel = {
        let label = UILabel()
        label.text = "이용예정"
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 14))
        label.textColor = .Gray300
        label.textAlignment = .right
        return label
    }()
    
    private let totalSalesLabel: UILabel = {
        let label = UILabel()
        label.text = "0원"
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 14))
        label.textColor = .Gray500
        label.textAlignment = .right
        return label
    }()
    
    private let requestTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.WaitingDetail.requestTitle
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 16))
        label.textColor = .Gray800
        return label
    }()
    
    private let requestLabel: UILabel = {
        let label = UILabel()
        label.text = "작성한 내용이 없습니다."
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 14))
        label.textColor = .Gray000
        return label
    }()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = myView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setHierarchy()
        setLayout()
        setNavigationBar()
    }
}

// MARK: - Extensions
extension WaitingDetailViewController {
    func setUI() {
        view.backgroundColor = .white
    }
    
    func setHierarchy() {
        view.addSubviews(currentStatusLabel, storeNameLabel, waitingNumTitleLabel, queueView, tagButtonStackView, divideSectionView, divideContentView, divideContentView2, salesInfoTitle, waitingTitleStackView, waitingLabelStackView, requestTitle, requestLabel)
        queueView.addSubviews(queueTitle, queueNumLabel)
    }
    
    func setLayout() {
        currentStatusLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(32)
            $0.left.equalTo(16)
        }
        storeNameLabel.snp.makeConstraints {
            $0.top.equalTo(currentStatusLabel.snp.bottom).offset(6)
            $0.left.equalTo(currentStatusLabel)
        }
        waitingNumTitleLabel.snp.makeConstraints {
            $0.top.equalTo(storeNameLabel.snp.bottom).offset(8)
            $0.left.equalTo(storeNameLabel)
        }
        queueView.snp.makeConstraints {
            $0.top.equalTo(currentStatusLabel)
            $0.right.equalTo(-16)
            $0.width.equalTo(84)
            $0.height.equalTo(76)
        }
        queueTitle.snp.makeConstraints {
            $0.top.equalTo(15)
            $0.centerX.equalToSuperview()
        }
        queueNumLabel.snp.makeConstraints {
            $0.top.equalTo(queueTitle.snp.bottom).offset(4)
            $0.centerX.equalToSuperview()
        }
        tagButtonStackView.snp.makeConstraints {
            $0.top.equalTo(queueView.snp.bottom).offset(28)
            $0.left.equalTo(17)
            $0.right.equalTo(-17)
            $0.height.equalTo(40)
        }
        divideSectionView.snp.makeConstraints {
            $0.top.equalTo(tagButtonStackView.snp.bottom).offset(26)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(4)
        }
        salesInfoTitle.snp.makeConstraints {
            $0.top.equalTo(divideSectionView.snp.bottom).offset(20)
            $0.left.equalTo(16)
        }
        divideContentView.snp.makeConstraints {
            $0.top.equalTo(salesInfoTitle.snp.bottom).offset(12)
            $0.left.equalTo(16)
            $0.right.equalTo(-16)
            $0.height.equalTo(1)
        }
        waitingTitleStackView.snp.makeConstraints {
            $0.top.equalTo(divideContentView.snp.bottom).offset(12)
            $0.left.equalTo(16)
            $0.right.equalTo(-16)
        }
        waitingLabelStackView.snp.makeConstraints {
            $0.top.equalTo(divideContentView.snp.bottom).offset(12)
            $0.left.equalTo(16)
            $0.right.equalTo(-16)
        }
        requestTitle.snp.makeConstraints {
            $0.top.equalTo(waitingLabelStackView.snp.bottom).offset(28)
            $0.left.equalTo(16)
        }
        divideContentView2.snp.makeConstraints {
            $0.top.equalTo(requestTitle.snp.bottom).offset(12)
            $0.left.equalTo(16)
            $0.right.equalTo(-16)
            $0.height.equalTo(1)
        }
        requestLabel.snp.makeConstraints {
            $0.top.equalTo(divideContentView2.snp.bottom).offset(12)
            $0.left.equalTo(16)
        }
    }
    
    func setNavigationBar() {
        let backButton = UIBarButtonItem(image: ImageLiterals.Common.ic_back_b,
                                         style: .plain,
                                         target: self,
                                         action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        navigationItem.title = "대기 상세"
        
        let refreshButton = UIBarButtonItem(image: ImageLiterals.Common.ic_refresh,
                                         style: .plain,
                                         target: self,
                                            action: .none)
        navigationItem.rightBarButtonItem = refreshButton
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    @objc
    func backButtonTapped() {
        self.navigationController?.popViewController(animated: false)
    }
}
