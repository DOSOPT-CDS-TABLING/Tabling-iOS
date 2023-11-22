//
//  ReserveAlertViewController.swift
//  Tabling-iOS
//
//  Created by 고아라 on 2023/11/21.
//

import UIKit

import SnapKit

final class ReserveAlertViewController: UIViewController {
    
    // MARK: - Properties
    
    private let reserveEntity: ReserveEntity = ReserveEntity.reserveDummy()
    
    // MARK: - UI Components
    
    private let reserveAlertView = ReserveAlertView()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setHierachy()
        setLayout()
        setDelegate()
        fetchData()
    }
}

// MARK: - Extensions
extension ReserveAlertViewController {
    func setUI() {
        view.backgroundColor = .black.withAlphaComponent(0.5)
    }
    
    func setHierachy() {
        view.addSubview(reserveAlertView)
    }
    
    func setDelegate() {
        reserveAlertView.buttonDelegate = self
    }
    
    func setLayout() {
        reserveAlertView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(320)
            $0.height.equalTo(415)
        }
    }
    
    func fetchData() {
        reserveAlertView.setDataBind(model: reserveEntity)
    }
}

extension ReserveAlertViewController: ButtonDelegate {
    func closeButtonTapped() {
        self.dismiss(animated: false)
    }
    
    func detailButtonTappd() {
        let nav = WaitingDetailViewController()
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: false)
    }
}
