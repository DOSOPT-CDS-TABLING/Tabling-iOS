//
//  ReserveBottomSheetViewController.swift
//  Tabling-iOS
//
//  Created by 민 on 11/22/23.
//

import UIKit

final class ReserveBottomSheetViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    private let dimmedBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.5)
        return view
    }()
    
    private let reserveBottomSheetView: ReserveBottomSheetView = {
        let view = ReserveBottomSheetView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 16
        view.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
        return view
    }()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAPI()
        setUI()
        setHierarchy()
        setLayout()
        setDelegate()
    }
}

// MARK: - Extensions
extension ReserveBottomSheetViewController {
    func setUI() {
    }
    
    func setHierarchy() {
        view.addSubviews(dimmedBackView, reserveBottomSheetView)
    }
    
    func setLayout() {
        dimmedBackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        reserveBottomSheetView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(248)
        }
    }
    
    func setDelegate() {
        reserveBottomSheetView.reserveBottomSheetButtonDelegate = self
    }
    
    func hideBottomSheet() {
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {
            self.dimmedBackView.alpha = 0.0
            self.view.layoutIfNeeded()
        }) { _ in
            if self.presentingViewController != nil {
                self.dismiss(animated: true)
            }
        }
    }
}

// MARK: - Network

extension ReserveBottomSheetViewController {
    func getAPI() {
        
    }
}

extension ReserveBottomSheetViewController: ReserveBottomSheetButtonDelegate {
    func bottomSheetCloseButtonTapped() {
        hideBottomSheet()
    }
    
    func bottomSheetTablingButtonTapped() {
        let nextVC = ReserveAlertViewController()
        nextVC.modalPresentationStyle = .overFullScreen
        self.present(nextVC, animated: false)

    }
}
