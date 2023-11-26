//
//  LocationCollectionViewCell.swift
//  Tabling-iOS
//
//  Created by yeonsu on 11/25/23.
//

import UIKit
import SnapKit

final class LocationCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    // MARK: - Properties
    private let backgroundUIView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 12))
        label.font = .pretendardRegular(size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .Gray400
        
        return label
    }()
    
    // MARK: - UI Components
    
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
extension LocationCollectionViewCell {
    func setUI() {
        backgroundUIView.layer.cornerRadius = 16
        backgroundUIView.layer.borderWidth = 1
    }
    
    func setHierarchy() {
        addSubviews(backgroundUIView)
        backgroundUIView.addSubview(locationLabel)
    }
    
    func setLayout() {
        backgroundUIView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.height.equalTo(32)
            $0.left.right.equalToSuperview()
        }
        
        locationLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        }
    }
    
    func configure(with title: String, isSelected: Bool = false) {
        backgroundColor = isSelected ? .Gray800 : .TablingWhite
        layer.borderColor = isSelected ? UIColor.Gray200.cgColor : UIColor.Gray800.cgColor
        locationLabel.text = title
        locationLabel.textColor = isSelected ? .TablingWhite : .Gray100
    }
    
    func setDataBind(model: LocationData) {
        locationLabel.text = model.location
    }
}
