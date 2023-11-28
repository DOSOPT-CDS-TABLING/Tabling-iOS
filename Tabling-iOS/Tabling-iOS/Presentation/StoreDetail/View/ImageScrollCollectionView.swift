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
    
    private let images = ["big_1", "big_2", "big_1", "big_2"]
    
    // MARK: - UI Components
    
    private let imagescrollCollectionView: UICollectionView = {
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
        
        setUI()
        setHierarchy()
        setLayout()
        setRegisterCell()
        setDelegate()
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
    
    func setDelegate() {
        imagescrollCollectionView.delegate = self
        imagescrollCollectionView.dataSource = self
    }
    
    func setDataBind() {
        
    }
}

// MARK: - CollectionView DataSource
extension ImageScrollCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = StoreDetailImageCollectionViewCell.dequeueReusableCell(collectionView: imagescrollCollectionView, indexPath: indexPath)
        cell.setDataBind(model: images[indexPath.row])
        return cell
    }
}

// MARK: - CollectionView Delegate
extension ImageScrollCollectionView: UICollectionViewDelegate {}
