//
//  TablingListViewController.swift
//  Tabling-iOS
//
//  Created by 고아라 on 2023/11/17.
//

import UIKit

final class TablingListViewController: UIViewController {
    
    // MARK: - Properties
    
    private var tablingListEntity: [TablingListEntity] = []
    private var completeEntity: CompleteEntity?
    
    // MARK: - UI Components
    
    private let tablingListView = TablingListView()
    private lazy var collectionView = tablingListView.completeCollectionView.collectionView
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = tablingListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getTablingListAPI()
        setUI()
        setNavigationBar()
        setDelegate()
    }
}

// MARK: - Extensions
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
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let keyWindow = windowScene.windows.first else {
            return
        }
        let rootVC = UINavigationController(rootViewController: StoreListViewController())
        keyWindow.rootViewController = rootVC
    }
    
    func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension TablingListViewController: CompleteDelegate {
    func detailButtonTapped() {
        let nav = WaitingDetailViewController()
        self.navigationController?.pushViewController(nav, animated: false)
    }
    
    func shopButtonTappd() {
        let nav = StoreDetailViewController()
        self.navigationController?.pushViewController(nav, animated: false)
    }
    
    func confirmButtonTapped(index: Int) {
        patchCompleteAPI(idx: index)
    }
}

// MARK: - Network

extension TablingListViewController {
    func getTablingListAPI() {
        TablingListService.shared.getTablingListAPI { networkResult in
            print(networkResult)
            switch networkResult {
            case .success(let data):
                if let data = data as? GenericResponse<[TablingListEntity]> {
                    if let listData = data.data {
                        self.tablingListEntity = listData
                    }
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                }
            case .requestErr, .serverErr:
                print("오류발생")
            default:
                break
            }
        }
    }
    
    func patchCompleteAPI(idx: Int) {
        TablingListService.shared.patchCompleteAPI(id: idx) { networkResult in
            print(networkResult)
            switch networkResult {
            case .success(let data):
                if let data = data as? GenericResponse<CompleteEntity> {
                    dump(data)
                    if let listData = data.data {
                        self.completeEntity = listData
                        
//                        let indexPath = IndexPath(row: self.selectedTag, section: 0)
//                        print(self.selectedTag)
//                        if let cell = self.collectionView.cellForItem(at: indexPath) as? CompleteCollectionViewCell {
//                            print( self.completeEntity?.orderStatus ?? "dsdsd")
//                            cell.setCellLayout(status: self.completeEntity?.orderStatus ?? "")
//                            cell.setNeedsLayout()
//                            DispatchQueue.main.async {
//                                self.collectionView.reloadItems(at: [indexPath])
//                            }
//                        }
                    }
                    DispatchQueue.main.async {
                        self.getTablingListAPI()
//                        self.collectionView.reloadData()
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

extension TablingListViewController: UICollectionViewDelegate {
}

extension TablingListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =
        CompleteCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
        cell.completeDelegate = self
        cell.idx = tablingListEntity[indexPath.row].orderID
        cell.setDataBind(model: tablingListEntity[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tablingListEntity.count
    }
}

extension TablingListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 27
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch tablingListEntity[indexPath.row].orderStatus {
        case "이용 예정":
            return CGSize(width: UIScreen.main.bounds.width - 32, height: 355)
        case "이용 완료":
            return CGSize(width: UIScreen.main.bounds.width - 32, height: 215)
        default:
            return CGSize(width: UIScreen.main.bounds.width - 32, height: 227)
        }
    }
}
