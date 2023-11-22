//
//  TablingListEntity.swift
//  Tabling-iOS
//
//  Created by 고아라 on 2023/11/22.
//

import Foundation

struct TablingListEntity: Codable {
    let orderID: Int
    let orderStatus, shopName: String
    let personCount, waitingNumber, beforeCount, remainingReviewPeriod: Int

    enum CodingKeys: String, CodingKey {
        case orderID = "order_id"
        case orderStatus = "order_status"
        case shopName = "shop_name"
        case personCount = "person_count"
        case waitingNumber = "waiting_number"
        case beforeCount = "before_count"
        case remainingReviewPeriod = "remaining_review_period"
    }
}

extension TablingListEntity {
    static func reserveDummy() -> [TablingListEntity] {
        return [
            TablingListEntity(orderID: 1, orderStatus: "이용 예정", shopName: "파이브가이즈 여의도", personCount: 2, waitingNumber: 66, beforeCount: 4, remainingReviewPeriod: 3),
            TablingListEntity(orderID: 2, orderStatus: "이용 완료", shopName: "포브라더스 도곡점", personCount: 1, waitingNumber: 65, beforeCount: 0, remainingReviewPeriod: 0),
            TablingListEntity(orderID: 3, orderStatus: "이용 완료", shopName: "청와옥 양재점", personCount: 2, waitingNumber: 67, beforeCount: 0, remainingReviewPeriod: -1)
        ]
    }
}
