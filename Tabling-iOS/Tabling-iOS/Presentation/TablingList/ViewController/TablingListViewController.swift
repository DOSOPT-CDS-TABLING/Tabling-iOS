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
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = tablingListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setNavigationBar()
    }
}

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
}
