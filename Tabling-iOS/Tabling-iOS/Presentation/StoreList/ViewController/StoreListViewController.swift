//
//  StoreListViewController.swift
//  Tabling-iOS
//
//  Created by 고아라 on 2023/11/17.
//

import UIKit
import SnapKit

final class StoreListViewController: UIViewController {
    
    // MARK: - Properties
    private let locationData: [LocationData] = LocationDummyData
    private let storeListData: [StoreListEntity] = StoreListEntity.tablingListDummyData()
    
    // MARK: - UI Components
    private let myView = View()
    
    private let moreButtonImageView: UIImageView = UIImageView(image: ImageLiterals.StoreList.ic_moreLocation_bg)
    
    private lazy var locationCollectionView = LocationCollectionView().collectionView
    
    private lazy var storeListCollectionView = StoreListCollectionView().collectionView
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = myView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        getAPI()
        setUI()
        setHierarchy()
        setLayout()
        setDelegate()
        setNavigationBar()
    }
}

// MARK: - Extensions
extension StoreListViewController {
    func setUI() {
        moreButtonImageView.contentMode = .scaleAspectFill
    }
    
    func setHierarchy() {
        view.addSubviews(locationCollectionView, moreButtonImageView, storeListCollectionView)
    }
    
    func setLayout() {
        locationCollectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(8)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-60)
            $0.height.equalTo(32)
        }
        
        moreButtonImageView.snp.makeConstraints {
            $0.top.equalTo(locationCollectionView)
            $0.right.equalTo(view.safeAreaLayoutGuide.snp.right)
            $0.height.equalTo(32)
        }
        
        storeListCollectionView.snp.makeConstraints {
            $0.top.equalTo(locationCollectionView.snp.bottom).offset(15)
            $0.left.bottom.right.equalToSuperview()
        }
    }
    
    func setDelegate() {
        locationCollectionView.delegate = self
        locationCollectionView.dataSource = self
        
        storeListCollectionView.delegate = self
        storeListCollectionView.dataSource = self
    }
    
    func setNavigationBar() {
        let backButton = UIBarButtonItem(image: ImageLiterals.Common.ic_back_b,
                                         style: .plain,
                                         target: self,
                                         action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 151, height: 44))
        
        let imageView = UIImageView(image: ImageLiterals.StoreList.ic_polygon)
        imageView.contentMode = .scaleAspectFit
        
        let titleLabel = UILabel()
        titleLabel.text = "서울 남부"
        titleLabel.textColor = UIColor.black // 타이틀 색상 설정
        titleLabel.sizeToFit()
        
        titleView.addSubview(imageView)
        titleView.addSubview(titleLabel)
        
        let spacing: CGFloat = 2.0
        
        let totalWidth = titleLabel.frame.width + spacing + imageView.frame.width
        
        titleLabel.frame = CGRect(
            x: (titleView.frame.width - totalWidth) / 2,
            y: 0,
            width: titleLabel.frame.width + 2,
            height: titleView.frame.height
        )
        
        imageView.frame = CGRect(
            x: titleLabel.frame.maxX + spacing,
            y: 0,
            width: imageView.frame.width,
            height: titleView.frame.height
        )
        
        // 네비게이션 바의 titleView에 titleView 할당
        navigationItem.titleView = titleView
        titleLabel.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 18))
    }
    
    @objc
    func backButtonTapped() {
        self.navigationController?.popViewController(animated: false)
    }
}

// MARK: - Network

extension StoreListViewController {
    func getAPI() {
        
    }
}

extension StoreListViewController: UICollectionViewDelegate {
}

extension StoreListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case locationCollectionView:
            let cell =
            LocationCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.setDataBind(model: locationData[indexPath.item])
            return cell
        case storeListCollectionView:
            let cell =
            StoreListCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.setDataBind(model: storeListData[indexPath.item])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == locationCollectionView {
            return locationData.count
        } else if collectionView == storeListCollectionView {
            return storeListData.count
        }
        return 0
    }
}

extension StoreListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case locationCollectionView:
            let model = locationData[indexPath.item]
            let label = UILabel()
            label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 12))
            label.font = .pretendardRegular(size: 12)
            label.text = model.location
            label.sizeToFit()
            
            let labelWidth = label.frame.width + 32
            let labelHeight: CGFloat = 32
            
            return CGSize(width: labelWidth, height: labelHeight)
        case storeListCollectionView:
            let cellWidth = collectionView.bounds.width
                       let cellHeight: CGFloat = 116
                       let spacing: CGFloat = 7

                       return CGSize(width: cellWidth, height: cellHeight + spacing)
                  
        default:
            return CGSize()
        }
    }
}
