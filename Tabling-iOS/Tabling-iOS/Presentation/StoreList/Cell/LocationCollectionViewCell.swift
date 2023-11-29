//
//  LocationCollectionViewCell.swift
//  Tabling-iOS
//
//  Created by yeonsu on 11/25/23.
//

import UIKit
import SnapKit

final class LocationCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    // MARK: - UI Components
    private let backgroundUIView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 1
        return view
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .Gray400
        label.text = "전체"
        label.setLineAndCharacterSpacing(font: .pretendardRegular(size: 12))
        return label
    }()
    
    // MARK: - Life Cycles
    override init(frame: CGRect) {
        super.init(frame: frame)

        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
extension LocationCollectionViewCell {
    
    func setHierarchy() {
        addSubviews(backgroundUIView)
        backgroundUIView.addSubview(locationLabel)
    }
    
    func setLayout() {
        backgroundUIView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.height.equalTo(32)
            $0.leading.trailing.equalToSuperview()
        }
        
        locationLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        }
    }
    
    func configure(with title: String, isSelected: Bool = false) {
        backgroundUIView.backgroundColor = isSelected ? .Gray800 : .TablingWhite
        backgroundUIView.layer.borderColor = isSelected ? UIColor.Gray800.cgColor : UIColor.Gray200.cgColor
        locationLabel.text = title
        locationLabel.textColor = isSelected ? .TablingWhite : .Gray400
    }
    
    func setDataBind(model: LocationData) {
        locationLabel.text = model.location
    }
}
