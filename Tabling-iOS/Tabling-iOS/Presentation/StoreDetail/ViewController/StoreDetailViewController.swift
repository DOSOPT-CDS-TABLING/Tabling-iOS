//
//  StoreDetailViewController.swift
//  Tabling-iOS
//
//  Created by 고아라 on 2023/11/17.
//

import UIKit

final class StoreDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    private let images = ["big_1", "big_2", "big_1", "big_2"]
    
    // MARK: - UI Components
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.bounces = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let storeDetailBottomTabView = StoreDetailBottomTabView()
    
    private lazy var imagescrollCollectionView: UICollectionView = {
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
    
    private let storeDetailView: StoreDetailView = {
        let view = StoreDetailView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
        return view
    }()
    
    private lazy var detailTableView = storeDetailView.recentReviewView.detailTableView
    private lazy var reviewTableView = storeDetailView.recentReviewView.reviewTableView
    private lazy var reviewDummy: [ReviewList] = StoreDetailEntity.reviewDummy()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setHierarchy()
        setLayout()
        setDelegate()
        setRegisterCell()
        setNavigationBar()
    }
}

// MARK: - Extensions
extension StoreDetailViewController {
    func setUI() {
        storeDetailBottomTabView.backgroundColor = .TablingWhite
        storeDetailView.backgroundColor = .TablingWhite
    }
    
    func setHierarchy() {
        view.addSubviews(scrollView, storeDetailBottomTabView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(imagescrollCollectionView, storeDetailView)
    }
    
    func setLayout() {
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(-98)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(110)
        }
        
        storeDetailBottomTabView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(110)
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView.snp.width)
            $0.height.greaterThanOrEqualTo(view.snp.height).priority(.low)
        }
        
        imagescrollCollectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(300)
        }
        
        storeDetailView.snp.makeConstraints {
            $0.top.equalTo(imagescrollCollectionView.snp.bottom).inset(57)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setDelegate() {
        storeDetailBottomTabView.storeDetailButtonDelegate = self
        detailTableView.delegate = self
        detailTableView.dataSource = self
        reviewTableView.delegate = self
        reviewTableView.dataSource = self
        imagescrollCollectionView.delegate = self
        imagescrollCollectionView.dataSource = self
    }
    
    func setRegisterCell() {
        StoreDetailImageCollectionViewCell.register(collectionView: imagescrollCollectionView)
    }
    
    func setNavigationBar() {
        // 기본 UIBarButtonItem 설정
        let backButton = UIBarButtonItem(image: ImageLiterals.Common.ic_back_w,
                                         style: .plain,
                                         target: nil,
                                         action: nil)
        navigationItem.leftBarButtonItem = backButton
        navigationItem.leftBarButtonItem?.tintColor = .TablingWhite
        let shareButton = UIBarButtonItem(image: ImageLiterals.StoreDetail.ic_share_w,
                                          style: .plain,
                                          target: nil,
                                          action: nil)
        shareButton.tintColor = .TablingWhite
        let heartButton = UIBarButtonItem(image: ImageLiterals.StoreDetail.ic_heart_w,
                                          style: .plain,
                                          target: nil,
                                          action: nil)
        heartButton.tintColor = .TablingWhite
        navigationItem.rightBarButtonItems = [heartButton, shareButton]
        
        // 스크롤시 UIBarButtonItem 변경
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = .TablingWhite
    }
}

extension StoreDetailViewController: StoreDetailButtonDelegate {
    func tablingButtonClicked() {
        let nextVC = ReserveBottomSheetViewController()
        nextVC.modalPresentationStyle = .overFullScreen
        self.present(nextVC, animated: false)
    }
}

extension StoreDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch tableView {
        case detailTableView:
            return 20
        case reviewTableView:
            return 103
        default:
            return 0
        }
    }
}

extension StoreDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case detailTableView:
            return 4
        case reviewTableView:
            return reviewDummy.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case detailTableView:
            let cell = DetailStarTableViewCell.dequeueReusableCell(tableView: detailTableView)
            cell.tag = indexPath.row
            return cell
        case reviewTableView:
            let cell = RecentReviewTableViewCell.dequeueReusableCell(tableView: reviewTableView)
            cell.setDataBind(model: reviewDummy[indexPath.row])
            return cell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - CollectionView DataSource
extension StoreDetailViewController: UICollectionViewDataSource {
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
extension StoreDetailViewController: UICollectionViewDelegate {}
