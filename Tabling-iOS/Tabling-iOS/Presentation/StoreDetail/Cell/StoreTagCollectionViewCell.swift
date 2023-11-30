//
//  StoreTagCollectionViewCell.swift
//  Tabling-iOS
//
//  Created by yeonsu on 11/29/23.
//

import UIKit

final class StoreTagCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    static let identifier = "StoreTagCollectionViewCell"
    
    // MARK: - UI Components
    private let backgroundUIView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let tagLabel: UILabel = {
        let label = UILabel()
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 12))
        label.font = .pretendardSemiBold(size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .Gray400
        
        return label
    }()
    
    // MARK: - Life Cycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
extension StoreTagCollectionViewCell {
    func setUI() {
        backgroundUIView.layer.cornerRadius = 16
        backgroundUIView.layer.borderWidth = 1
        backgroundUIView.layer.borderColor = UIColor.Gray100.cgColor
    }
    
    func setHierarchy() {
        addSubviews(backgroundUIView)
        backgroundUIView.addSubview(tagLabel)
    }
    
    func setLayout() {
        backgroundUIView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.height.equalTo(32)
            $0.width.greaterThanOrEqualTo(tagLabel.snp.width).offset(32)
        }
        
        tagLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        }
    }
    
    func setDataBind(model: [String], indexPath: IndexPath) {
        tagLabel.text = model[indexPath.row]
    }
    
    func calculateHeight(forWidth width: CGFloat) -> CGFloat {
        tagLabel.preferredMaxLayoutWidth = width - 32 // 여유 여백을 고려하여 계산
        let size = systemLayoutSizeFitting(CGSize(width: width, height: UIView.layoutFittingCompressedSize.height),
                                           withHorizontalFittingPriority: .required,
                                           verticalFittingPriority: .fittingSizeLevel)
        return size.height
    }
}
