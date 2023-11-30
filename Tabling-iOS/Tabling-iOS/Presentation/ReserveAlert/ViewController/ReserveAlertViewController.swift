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
    
    var reserveEntity: ReserveEntity?
    var shopId: Int = 0
    var personCount: Int = 0
    
    // MARK: - UI Components
    
    private let reserveAlertView = ReserveAlertView()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postReserveAPI()
        setUI()
        setHierachy()
        setLayout()
        setDelegate()
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
        guard let postResponse = reserveEntity else { return }
        reserveAlertView.setDataBind(model: postResponse)
    }
}

extension ReserveAlertViewController: ButtonDelegate {
    func closeButtonTapped() {
        self.dismiss(animated: false)
    }
    
    func detailButtonTappd() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let keyWindow = windowScene.windows.first else {
            return
        }
        let rootVC = UINavigationController(rootViewController: TablingListViewController())
        keyWindow.rootViewController = rootVC
    }
}

extension ReserveAlertViewController {
    func postReserveAPI() {
        StoreDetailService.shared.postTablingStartAPI(
            shopId: self.shopId,
            personCount: self.personCount) { networkResult in
            switch networkResult {
            case .success(let data):
                if let data = data as? GenericResponse<ReserveEntity> {
                    if let listData = data.data {
                        self.reserveEntity = listData
                    }
                    DispatchQueue.main.async {
                        self.fetchData()
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
