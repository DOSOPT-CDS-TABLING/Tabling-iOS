//
//  StoreDetailViewController.swift
//  Tabling-iOS
//
//  Created by 고아라 on 2023/11/17.
//

import UIKit

final class StoreDetailViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: - UI Components
    private let storeDetailView = StoreDetailView()
    private let storeDetatilImageScrollView = StoreDetatilImageScrollView()
    private let storeDetailBottomTabView = StoreDetailBottomTabView()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storeDetatilImageScrollView.backgroundColor = .green
        storeDetailBottomTabView.backgroundColor = .TablingWhite
        getAPI()
        setUI()
        setHierarchy()
        setLayout()
        setDelegate()
    }
}

// MARK: - Extensions
extension StoreDetailViewController {
    func setUI() {

    }
    
    func setHierarchy() {
        view.addSubviews(storeDetatilImageScrollView, storeDetailBottomTabView)
    }
    
    func setLayout() {
        storeDetatilImageScrollView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(300)
        }
        
        storeDetailBottomTabView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(110)
        }
    }
    
    func setDelegate() {
        
    }
}

// MARK: - Network
extension StoreDetailViewController {
    func getAPI() {
        
    }
}

//extension ViewController: UICollectionViewDelegate {
//
//}
//
//extension ViewController: UICollectionViewDataSource {
//
//}
//
//extension ViewController: UICollectionViewFlowLayout {
//
//}
