//
//  ReserveEntity.swift
//  Tabling-iOS
//
//  Created by 고아라 on 2023/11/21.
//

import Foundation

struct ReserveEntity: Codable {
    let waitingNumber, beforeCount: Int
    let shopName: String
    let personCount: Int
    let orderStatus: String

    enum CodingKeys: String, CodingKey {
        case waitingNumber = "waiting_number"
        case beforeCount = "before_count"
        case shopName = "shop_name"
        case personCount = "person_count"
        case orderStatus = "order_status"
    }
}

extension ReserveEntity {
    static func reserveDummy() -> ReserveEntity {
        return ReserveEntity(waitingNumber: 66, beforeCount: 4, shopName: "파이브가이즈 여의도", personCount: 2, orderStatus: "확정 예정")
    }
}
