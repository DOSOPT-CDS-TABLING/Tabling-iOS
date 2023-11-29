//
//  StoreDetailService.swift
//  Tabling-iOS
//
//  Created by 고아라 on 2023/11/25.
//

import Foundation

import Alamofire

final class StoreDetailService: BaseService {
    
    static let shared = StoreDetailService()
    
    private override init() {}
}

extension StoreDetailService {
    func getTablingListAPI(shopId: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = URLConstant.storeDetailURL
        let header: HTTPHeaders = NetworkConstant.header
        let dataRequest = AF.request(url+"/\(shopId)",
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let data = response.data else { return }
                let networkResult = self.judgeStatus(by: statusCode,
                                                     data,
                                                     StoreDetailEntity.self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
}
