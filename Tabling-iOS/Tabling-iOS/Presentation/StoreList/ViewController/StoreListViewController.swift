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
    private lazy var locationCollectionView = LocationCollectionView().collectionView
    private let locationData: [LocationData] = LocationDummyData
    
    // MARK: - UI Components
    
    private let myView = View()
    
    private let moreButtonImageView: UIImageView = UIImageView(image: ImageLiterals.StoreList.ic_moreLocation_bg)
    
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
        view.addSubviews(locationCollectionView, moreButtonImageView)
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
    }
    
    func setDelegate() {
        locationCollectionView.delegate = self
        locationCollectionView.dataSource = self
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
        let cell =
        LocationCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
        cell.setDataBind(model: locationData[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return locationData.count
    }
}

extension StoreListViewController: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let model = locationData[indexPath.item]
            let label = UILabel()
            label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 12))
            label.font = .pretendardRegular(size: 12)
            label.text = model.location
            label.sizeToFit()

            let labelWidth = label.frame.width + 32 // 여유 공간을 둘 수 있도록 추가값을 줍니다.
            let labelHeight: CGFloat = 32 // 셀의 높이를 고정하거나 동적으로 설정합니다.

            return CGSize(width: labelWidth, height: labelHeight)
        }
    }
