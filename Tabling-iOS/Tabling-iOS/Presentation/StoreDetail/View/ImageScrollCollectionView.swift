//
//  ImageScrollCollectionView.swift
//  Tabling-iOS
//
//  Created by 민 on 11/27/23.
//

import UIKit

import SnapKit

final class ImageScrollCollectionView: UIView {

    // MARK: - Properties
    
    var index: Int = 0
    
    // MARK: - UI Components
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(systemName: "apple.logo")
        return image
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .TablingPrimary
        button.setTitleColor(.Gray300, for: .normal)
        button.setTitle("버튼", for: .normal)
        button.layer.cornerRadius = 24
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
extension ImageScrollCollectionView {
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
