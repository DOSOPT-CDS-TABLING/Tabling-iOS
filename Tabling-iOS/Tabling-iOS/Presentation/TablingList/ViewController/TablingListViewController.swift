//
//  TablingListViewController.swift
//  Tabling-iOS
//
//  Created by 고아라 on 2023/11/17.
//

import UIKit

final class TablingListViewController: UIViewController {
    
    // MARK: - Properties
    
    private let tablingListEntity: [TablingListEntity] = TablingListEntity.tablingListDummy()
    
    // MARK: - UI Components
    
    private let tablingListView = TablingListView()
    private lazy var collectionView = tablingListView.completeCollectionView.collectionView
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = tablingListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setNavigationBar()
        setDelegate()
    }
}

// MARK: - Extensions
extension TablingListViewController {
    func setUI() {
        view.backgroundColor = .TablingWhite
    }
    
    func setNavigationBar() {
        let backButton = UIBarButtonItem(image: ImageLiterals.Common.ic_back_b,
                                         style: .plain,
                                         target: self,
                                         action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        let label = UILabel()
        label.text = I18N.TablingList.navigationBarTitle
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 18))
        navigationItem.titleView = label
    }
    
    @objc
    func backButtonTapped() {
        self.navigationController?.popViewController(animated: false)
    }
    
    func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension TablingListViewController: UICollectionViewDelegate {
}

extension TablingListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =
        CompleteCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
        cell.setDataBind(model: tablingListEntity[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tablingListEntity.count
    }
}

extension TablingListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch tablingListEntity[indexPath.row].orderStatus {
        case "이용 예정":
            return CGSize(width: UIScreen.main.bounds.width - 22, height: 355)
        case "이용 완료":
            return CGSize(width: UIScreen.main.bounds.width - 22, height: 215)
        default:
            return CGSize(width: UIScreen.main.bounds.width - 22, height: 227)
        }
    }
}
