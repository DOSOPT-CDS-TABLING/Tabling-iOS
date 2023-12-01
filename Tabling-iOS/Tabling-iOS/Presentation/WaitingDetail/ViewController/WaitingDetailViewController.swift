//
//  WaitingDetailViewController.swift
//  Tabling-iOS
//
//  Created by 고아라 on 2023/11/17.
//

import UIKit

final class WaitingDetailViewController: UIViewController {

    // MARK: - Properties
    
    private var waitingEntity: WaitingDetailEntity?
    private let waitingDetailView = WaitingDetailView()
    
    var orderId: Int = 0
   
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = waitingDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getWaitingListAPI()
        setNavigationBar()
    }
}

// MARK: - Extensions
extension WaitingDetailViewController {
    
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

extension WaitingDetailViewController {
    func getWaitingListAPI() {
        WaitingDetailService.shared.getWaitingDetailAPI(orderID: orderId) { networkResult in
            switch networkResult {
            case .success(let data):
                if let data = data as? GenericResponse<WaitingDetailEntity> {
                    if let listData = data.data {
                        self.waitingEntity = listData
                    }
                    DispatchQueue.main.async {
                        guard let waitingEntity = self.waitingEntity else { return }
                        self.waitingDetailView.setDataBind(model: waitingEntity)
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
