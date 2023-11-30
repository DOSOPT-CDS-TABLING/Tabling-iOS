//
//  StoreDetailViewController.swift
//  Tabling-iOS
//
//  Created by 고아라 on 2023/11/17.
//

import UIKit

final class StoreDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var shopID: Int = 1
    var tagData: [String] = []
    private var storeDetailEntity: StoreDetailEntity?
    private lazy var reviewDummy: [ReviewList] = StoreDetailEntity.reviewDummy()
    
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
    
    private let imagescrollCollectionView = ImageScrollCollectionView()
    
    private lazy var imageCollectionView = imagescrollCollectionView.imagescrollCollectionView
    
    private let waitingTeamLabel: UILabel = {
        let label = UILabel()
        label.text = "대기 2팀"
        label.backgroundColor = .TablingPrimary
        label.setLineAndCharacterSpacing(font: .pretendardSemiBold(size: 16))
        label.textColor = .TablingWhite
        label.textAlignment = .center
        label.layer.cornerRadius = 4
        label.clipsToBounds = true
        return label
    }()
    
    private let photoCountLabel: UILabel = {
        let label = UILabel()
        label.text = "1/6"
        label.setLineAndCharacterSpacing(font: .pretendardRegular(size: 14))
        label.textColor = .TablingWhite
        label.textAlignment = .center
        return label
    }()
    
    private let storeDetailBottomTabView = StoreDetailBottomTabView()
    
    private let storeDetailView: StoreDetailView = {
        let view = StoreDetailView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
        return view
    }()
    
    private lazy var storeTagCollectionView = storeDetailView.homeView.storeTagCollectionView
    private lazy var homeCollectionView = storeDetailView.allMenuView.homeCollectionView
    private lazy var detailTableView = storeDetailView.recentReviewView.detailTableView
    private lazy var reviewTableView = storeDetailView.recentReviewView.reviewTableView
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getStoreDetailAPI(shopId: shopID)
        setUI()
        setHierarchy()
        setLayout()
        setDelegate()
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
        contentView.addSubviews(imagescrollCollectionView, waitingTeamLabel, photoCountLabel, storeDetailView)
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
        
        waitingTeamLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(195)
            $0.leading.equalToSuperview().inset(16)
            $0.width.equalTo(74)
            $0.height.equalTo(32)
        }
        
        photoCountLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(208)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(37)
            $0.height.equalTo(21)
        }
        
        storeDetailView.snp.makeConstraints {
            $0.top.equalTo(imagescrollCollectionView.snp.bottom).inset(57)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setDelegate() {
        storeDetailBottomTabView.storeDetailButtonDelegate = self
        homeCollectionView.dataSource = self
        detailTableView.delegate = self
        detailTableView.dataSource = self
        reviewTableView.delegate = self
        reviewTableView.dataSource = self
        scrollView.delegate = self
        imageCollectionView.dataSource = self
        imageCollectionView.delegate = self
        storeTagCollectionView.dataSource = self
    }
    
    func setNavigationBar() {
        let backButton = UIBarButtonItem(image: ImageLiterals.Common.ic_back_w,
                                         style: .plain,
                                         target: nil,
                                         action: nil)
        let shareButton = UIBarButtonItem(image: ImageLiterals.StoreDetail.ic_share_w,
                                          style: .plain,
                                          target: nil,
                                          action: nil)
        let heartButton = UIBarButtonItem(image: ImageLiterals.StoreDetail.ic_heart_w,
                                          style: .plain,
                                          target: nil,
                                          action: nil)
        navigationItem.leftBarButtonItem = backButton
        navigationItem.rightBarButtonItems = [heartButton, shareButton]
        navigationItem.leftBarButtonItem?.tintColor = .TablingWhite
        navigationItem.rightBarButtonItems?.forEach {
            $0.tintColor = .TablingWhite
        }
        
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
            if let dataModel = storeDetailEntity {
                cell.setDataBind(model: dataModel)
            }
            cell.tag = indexPath.row
            return cell
        case reviewTableView:
            let cell = RecentReviewTableViewCell.dequeueReusableCell(tableView: reviewTableView)
            if let dataModel = storeDetailEntity?.reviewList[indexPath.row] {
                cell.setDataBind(model: dataModel)
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - UIScrollView Delegate
extension StoreDetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y
        if yOffset > 0 {
            navigationItem.leftBarButtonItem?.tintColor = .Gray800
            navigationItem.rightBarButtonItems?.forEach { $0.tintColor = .Gray800 }
        } else {
            navigationItem.leftBarButtonItem?.tintColor = .TablingWhite
            navigationItem.rightBarButtonItems?.forEach { $0.tintColor = .TablingWhite }
        }
    }
}

// MARK: - CollectionView Delegate
extension StoreDetailViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        switch collectionView {
        case homeCollectionView:
            return storeDetailEntity?.menuList.count ?? 0
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case homeCollectionView:
            return storeDetailEntity?.menuList[section].menuInfoList.count ?? 0
        case imageCollectionView:
            return storeDetailEntity?.detailPhotoList.count ?? 0
        case storeTagCollectionView:
            return storeDetailEntity?.hashTagList.count ?? 0
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case homeCollectionView:
            let cell = MenuCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            if let dataModel = storeDetailEntity?.menuList[indexPath.section].menuInfoList[indexPath.row] {
                cell.setDataBind(model: dataModel)
            }
            return cell
        case imageCollectionView:
            let cell = StoreDetailImageCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            if let dataModel = storeDetailEntity?.detailPhotoList {
                cell.setDataBind(data: dataModel[indexPath.row])
            }
            return cell
        case storeTagCollectionView:
            let cell =
            StoreTagCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            if let dataModel = storeDetailEntity?.hashTagList {
                self.tagData = dataModel
                cell.setDataBind(model: dataModel, indexPath: indexPath)
            }
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "MenuCollectionHeaderView", for: indexPath) as? MenuCollectionHeaderView else { return UICollectionReusableView() }
            let dataModel = storeDetailEntity?.menuList[indexPath.section].menuCategory
            header.setDataBind(data: dataModel ?? "")
            return header
        default:
            return UICollectionReusableView()
        }
    }
}

extension StoreDetailViewController: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = Int(imageCollectionView.contentOffset.x / imageCollectionView.frame.width)
        updateDataForCurrentPage(currentPage)
    }
    
    // 페이지가 변경될 때 호출할 메서드
    func updateDataForCurrentPage(_ currentPage: Int) {
        self.photoCountLabel.text = "\(currentPage+1)/6"
    }
}

// MARK: - Network
extension StoreDetailViewController {
    func getStoreDetailAPI(shopId: Int) {
        StoreDetailService.shared.getStoreDetailAPI(shopId: shopId) { networkResult in
            switch networkResult {
            case .success(let data):
                if let data = data as? GenericResponse<StoreDetailEntity> {
                    if let detailData = data.data {
                        self.storeDetailEntity = detailData
                        self.storeDetailView.setDataBind(model: detailData)
                        self.storeDetailView.recentReviewView.setDataBind(model: detailData)
                        self.storeDetailView.homeView.setDataBind(model: detailData)
                        self.waitingTeamLabel.text = "대기 \(detailData.currentWaiting)팀"
                        self.photoCountLabel.text = "1/\(detailData.detailPhotoList.count)"
                        print(detailData)
                    }
                    DispatchQueue.main.async {
                        self.homeCollectionView.reloadData()
                        self.detailTableView.reloadData()
                        self.reviewTableView.reloadData()
                        self.imageCollectionView.reloadData()
                        self.storeTagCollectionView.reloadData()
                    }
                }
            case .requestErr, .serverErr:
                print("오류발생")
            default:
                break
            }
        }
    }
}
