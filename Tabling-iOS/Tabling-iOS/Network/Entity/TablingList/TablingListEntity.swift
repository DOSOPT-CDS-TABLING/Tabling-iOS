//
//  TablingListEntity.swift
//  Tabling-iOS
//
//  Created by 고아라 on 2023/11/22.
//

import Foundation

struct TablingListEntity: Codable {
    let orderID: Int
    let orderStatus: String
    let shopID: Int
    let shopName, orderDate: String
    let personCount, waitingNumber, beforeCount, remainingReviewPeriod: Int

    enum CodingKeys: String, CodingKey {
        case orderID = "order_id"
        case orderStatus = "order_status"
        case shopID = "shop_id"
        case shopName = "shop_name"
        case orderDate = "order_date"
        case personCount = "person_count"
        case waitingNumber = "waiting_number"
        case beforeCount = "before_count"
        case remainingReviewPeriod = "remaining_review_period"
    }
}

extension TablingListEntity {
    static func tablingListDummy() -> [TablingListEntity] {
        return [
            TablingListEntity(orderID: 2, orderStatus: "이용 예정", shopID: 1, shopName: "파이브가이즈 여의도", orderDate: "11월 22일 (수)", personCount: 8, waitingNumber: 86, beforeCount: 5, remainingReviewPeriod: 2),
            TablingListEntity(orderID: 8, orderStatus: "이용 완료", shopID: 2, shopName: "포브라더스 도곡점", orderDate: "11월 20일 (월)", personCount: 1, waitingNumber: 65, beforeCount: 0, remainingReviewPeriod: 0),
            TablingListEntity(orderID: 3, orderStatus: "이용 완료", shopID: 3, shopName: "청와옥 양재점", orderDate: "11월 11일 (토)", personCount: 2, waitingNumber: 67, beforeCount: 0, remainingReviewPeriod: -1)
        ]
    }
}
