//
//  WaitingDetailViewController.swift
//  Tabling-iOS
//
//  Created by 고아라 on 2023/11/17.
//

import UIKit

final class WaitingDetailViewController: UIViewController {

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
        
        setUI()
        setHierarchy()
        setLayout()
        setDelegate()
        setNavigationBar()
    }
}

// MARK: - Extensions
extension WaitingDetailViewController {
    func setUI() {
        view.backgroundColor = .white
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
        
        navigationItem.title = "대기 상세"
        
        let refreshButton = UIBarButtonItem(image: ImageLiterals.Common.ic_refresh,
                                         style: .plain,
                                         target: self,
                                            action: .none)
        navigationItem.rightBarButtonItem = refreshButton
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    @objc
    func backButtonTapped() {
        self.navigationController?.popViewController(animated: false)
    }
}
