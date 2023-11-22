//
//  StoreDetailViewController.swift
//  Tabling-iOS
//
//  Created by 고아라 on 2023/11/17.
//

import UIKit

final class StoreDetailViewController: UIViewController {
    
    // MARK: - UI Components
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let storeDetailBottomTabView = StoreDetailBottomTabView()
    private let storeDetatilImageScrollView = StoreDetatilImageScrollView()
    private let storeDetailView: StoreDetailView = {
        let view = StoreDetailView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
        return view
    }()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storeDetailBottomTabView.backgroundColor = .TablingWhite
        storeDetailView.backgroundColor = .TablingWhite
        getAPI()
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
        
    }
    
    func setHierarchy() {
        view.addSubviews(scrollView, storeDetailBottomTabView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(storeDetatilImageScrollView, storeDetailView)
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
        
        storeDetatilImageScrollView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(300)
        }
        
        storeDetailView.snp.makeConstraints {
            $0.top.equalTo(storeDetatilImageScrollView.snp.bottom).inset(57)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    func setDelegate() {
        storeDetailBottomTabView.storeDetailButtonDelegate = self
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

// MARK: - Network
extension StoreDetailViewController {
    func getAPI() {
        
    }
}

extension StoreDetailViewController: StoreDetailButtonDelegate {
    func tablingButtonClicked() {
        let nextVC = ReserveBottomSheetViewController()
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: false)
    }
}
