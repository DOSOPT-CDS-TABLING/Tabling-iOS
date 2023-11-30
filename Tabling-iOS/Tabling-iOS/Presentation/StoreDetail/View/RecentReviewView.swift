//
//  RecentReviewView.swift
//  Tabling-iOS
//
//  Created by 민 on 11/21/23.
//

import UIKit

import SnapKit

final class RecentReviewView: UIView {
    
    // MARK: - UI Components
    
    private let reviewCountLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.StoreDetail.testLabel
        label.textColor = .Gray800
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 16))
        return label
    }()
    
    private let averageTitle: UILabel = {
        let label = UILabel()
        label.text = I18N.StoreDetail.averageTitle
        label.textColor = .Gray800
        label.setLineAndCharacterSpacing(font: .pretendardRegular(size: 12))
        return label
    }()
    
    private let averageLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.StoreDetail.testLabel
        label.textColor = .Gray800
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 24))
        return label
    }()
    
    private lazy var starStackView: UIStackView = {
        lazy var stackview = UIStackView()
        stackview.axis = .horizontal
        for _ in 0..<5 {
            let starImage = UIImageView()
            starImage.image = ImageLiterals.Common.ic_star_empty
            starImage.snp.makeConstraints {
                $0.size.equalTo(14)
            }
            stackview.addArrangedSubview(starImage)
        }
        return stackview
    }()
    
    lazy var detailTableView: UITableView = {
        lazy var tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .TablingWhite
        tableView.sectionFooterHeight = 0
        tableView.sectionHeaderTopPadding = 0
        tableView.isScrollEnabled = false
        tableView.isUserInteractionEnabled = true
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private let seperateView: UIView = {
        let view = UIView()
        view.backgroundColor = .Gray000
        return view
    }()
    
    lazy var reviewTableView: UITableView = {
        lazy var tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .TablingWhite
        tableView.sectionFooterHeight = 0
        tableView.sectionHeaderTopPadding = 0
        tableView.isScrollEnabled = false
        tableView.isUserInteractionEnabled = true
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        return tableView
    }()
    
    private let allReviewLookImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.StoreDetail.btn_all_review_look
        return imageView
    }()

    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
        setRegisterCell()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
extension RecentReviewView {
    func setHierarchy() {
        addSubviews(reviewCountLabel, averageTitle, averageLabel, starStackView, detailTableView, seperateView, reviewTableView, allReviewLookImage)
    }
    
    func setLayout() {
        reviewCountLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(25)
            $0.leading.equalToSuperview().inset(15)
            $0.height.equalTo(24)
        }
        
        averageTitle.snp.makeConstraints {
            $0.top.equalTo(reviewCountLabel.snp.bottom).offset(25)
            $0.leading.equalToSuperview().inset(52)
        }
        
        averageLabel.snp.makeConstraints {
            $0.top.equalTo(averageTitle.snp.bottom)
            $0.leading.equalToSuperview().inset(57)
        }
        
        starStackView.snp.makeConstraints {
            $0.top.equalTo(averageLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().inset(39)
            $0.height.equalTo(14)
        }
        
        detailTableView.snp.makeConstraints {
            $0.top.equalTo(reviewCountLabel.snp.bottom).offset(17)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(196)
            $0.height.equalTo(87)
        }
        
        seperateView.snp.makeConstraints {
            $0.top.equalTo(detailTableView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(3)
        }
        
        reviewTableView.snp.makeConstraints {
            $0.top.equalTo(seperateView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        allReviewLookImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(reviewTableView.snp.bottom).offset(16)
            $0.bottom.equalToSuperview().offset(-30)
            $0.width.equalTo(106)
        }
    }
    
    func setRegisterCell() {
        DetailStarTableViewCell.register(tableView: detailTableView)
        RecentReviewTableViewCell.register(tableView: reviewTableView)
    }
    
    func setDataBind(model: StoreDetailEntity) {
        reviewCountLabel.text = "리뷰 \(model.reviewCount)건"
        averageLabel.text = String(model.averageStar)+".0"
        
        for (index, starImage) in starStackView.arrangedSubviews.enumerated() {
            if let starImage = starImage as? UIImageView {
                if index < Int(model.averageStar) {
                    starImage.image = ImageLiterals.Common.ic_star_fill
                } else {
                    starImage.image = ImageLiterals.Common.ic_star_empty
                }
            }
        }
    }
}
