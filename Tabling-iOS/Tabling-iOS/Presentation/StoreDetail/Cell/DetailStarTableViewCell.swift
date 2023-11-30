//
//  DetailStarTableViewCell.swift
//  Tabling-iOS
//
//  Created by 고아라 on 2023/11/24.
//

import UIKit

import SnapKit

final class DetailStarTableViewCell: UITableViewCell, UITableViewRegisterable {

    // MARK: - UI Components
    
    private let detailTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.StoreDetail.testLabel
        label.textColor = .Gray800
        label.setLineAndCharacterSpacing(font: .pretendardRegular(size: 12))
        return label
    }()
    
    private lazy var progressView: UIProgressView = {
        lazy var progressView = UIProgressView()
        progressView.progressViewStyle = .default
        progressView.progressTintColor = .Gray400
        progressView.trackTintColor = .Gray000
        progressView.clipsToBounds = true
        progressView.layer.cornerRadius = 3
        return progressView
    }()
    
    private let detailStar: UILabel = {
        let label = UILabel()
        label.text = I18N.StoreDetail.testLabel
        label.textColor = .Gray800
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 11))
        return label
    }()
    
    // MARK: - Life Cycles
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setHierarchy()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
extension DetailStarTableViewCell {
    func setUI() {
        backgroundColor = .TablingWhite
    }
    
    func setHierarchy() {
        addSubviews(detailTitle, detailStar, progressView)
    }
    
    func setLayout() {
        detailTitle.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview()
        }
        
        detailStar.snp.makeConstraints {
            $0.top.trailing.bottom.equalToSuperview()
            $0.width.equalTo(26)
        }
        
        progressView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(5)
            $0.trailing.equalTo(detailStar.snp.leading).offset(-6)
            $0.width.equalTo(99)
            $0.height.equalTo(7)
        }
    }
    
    func setDataBind(model: StoreDetailEntity) {
        switch tag {
        case 0: detailTitle.text = I18N.StoreDetail.detailTitle1
        case 1: detailTitle.text = I18N.StoreDetail.detailTitle2
        case 2: detailTitle.text = I18N.StoreDetail.detailTitle3
        case 3: detailTitle.text = I18N.StoreDetail.detailTitle4
        default: break
        }
        progressView.progress = Float(model.detailStarList[tag] * 0.2)
        detailStar.text = "\(model.detailStarList[tag])점"
        detailStar.textAlignment = .right
    }
}
