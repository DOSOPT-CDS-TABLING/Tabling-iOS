//
//  ImageScrollCollectionView.swift
//  Tabling-iOS
//
//  Created by 민 on 11/27/23.
//

import UIKit

import SnapKit

final class ImageScrollCollectionView: UIView {
    
    // MARK: - UI Components
    
    lazy var imagescrollCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 300)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .Gray100
        return collectionView
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
extension ImageScrollCollectionView {
    func setHierarchy() {
        self.addSubviews(imagescrollCollectionView)
    }
    
    func setLayout() {
        imagescrollCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setRegisterCell() {
        StoreDetailImageCollectionViewCell.register(collectionView: imagescrollCollectionView)
    }

}
