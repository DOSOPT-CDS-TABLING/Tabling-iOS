//
//  CompleteCollectionView.swift
//  Tabling-iOS
//
//  Created by 고아라 on 2023/11/23.
//

import UIKit

import SnapKit

final class CompleteCollectionView: UIView {
    
    // MARK: - UI Components
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 16
        flowLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.clipsToBounds = true
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.isUserInteractionEnabled = true
        collectionView.allowsSelection = true
        return collectionView
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHiearchy()
        setLayout()
        setRegisterCell()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
private extension CompleteCollectionView {
    func setHiearchy() {
        addSubview(collectionView)
    }

    func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setRegisterCell() {
        CompleteCollectionViewCell.register(collectionView: collectionView)
    }
}
