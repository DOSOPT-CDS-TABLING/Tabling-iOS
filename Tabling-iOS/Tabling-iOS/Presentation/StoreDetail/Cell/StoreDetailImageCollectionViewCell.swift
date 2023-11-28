//
//  StoreDetailImageCollectionViewCell.swift
//  Tabling-iOS
//
//  Created by 민 on 11/27/23.
//

import UIKit

final class StoreDetailImageCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {

    // MARK: - UI Components
    
    private let storeImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let gradientView: UIView = {
        let view = UIView()
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.black.withAlphaComponent(0.0).cgColor,
                           UIColor.black.withAlphaComponent(0.5).cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        view.layer.addSublayer(gradient)
        return view
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientView.frame = storeImage.bounds
        gradientView.layer.sublayers?.first?.frame = gradientView.bounds
    }
}

// MARK: - Extensions
extension StoreDetailImageCollectionViewCell {
    func setHierarchy() {
        self.addSubview(storeImage)
        storeImage.addSubview(gradientView)
    }
    
    func setLayout() {
        storeImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        gradientView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setDataBind(model: String) {
        storeImage.image = UIImage(named: model)
    }
}
