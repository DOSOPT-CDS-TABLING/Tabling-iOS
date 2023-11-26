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
    
    // MARK: - UI Components
    
    private let myView = View()
    
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
        
    }
    
    func setHierarchy() {
        
    }
    
    func setLayout() {
        
    }
    
    func setDelegate() {
        
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
