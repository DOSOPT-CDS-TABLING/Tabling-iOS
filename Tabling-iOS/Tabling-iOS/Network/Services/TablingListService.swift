//
//  TablingListService.swift
//  Tabling-iOS
//
//  Created by 고아라 on 2023/11/25.
//

import Foundation

import Alamofire

final class TablingListService: BaseService {
    
    static let shared = TablingListService()
    
    private override init() {}
}

extension TablingListService {
    func getTablingListAPI(completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = URLConstant.tablingURL
        let header: HTTPHeaders = NetworkConstant.header
        let dataRequest = AF.request(url,
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
                                                     [TablingListEntity].self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
}
