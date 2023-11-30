//
//  StoreDetailEntity.swift
//  Tabling-iOS
//
//  Created by 고아라 on 2023/11/17.
//

import Foundation

struct StoreDetailEntity: Codable {
    let shopID: Int
    let detailPhotoList: [String]
    let currentWaiting: Int
    let name, longAddress, salesTime, waitingTime: String
    let restTime, restDay, phoneNumber: String
    let hashTagList: [String]
    let introduceContent: String
    let menuList: [MenuList]
    let averageStar, reviewCount: Int
    let detailStarList: [Double]
    let reviewList: [ReviewList]

    enum CodingKeys: String, CodingKey {
        case shopID = "shop_id"
        case detailPhotoList = "detail_photo_list"
        case currentWaiting = "current_waiting"
        case name
        case longAddress = "long_address"
        case salesTime = "sales_time"
        case waitingTime = "waiting_time"
        case restTime = "rest_time"
        case restDay = "rest_day"
        case phoneNumber = "phone_number"
        case hashTagList = "hash_tag_list"
        case introduceContent = "introduce_content"
        case menuList = "menu_list"
        case averageStar = "average_star"
        case reviewCount = "review_count"
        case detailStarList = "detail_star_list"
        case reviewList = "review_list"
    }
}

// MARK: - MenuList
struct MenuList: Codable {
    let menuCategory: String
    let menuInfoList: [MenuInfoList]

    enum CodingKeys: String, CodingKey {
        case menuCategory = "menu_category"
        case menuInfoList = "menu_info_list"
    }
}

// MARK: - MenuInfoList
struct MenuInfoList: Codable {
    let menuID: Int
    let menuPhotoURL: String
    let menuName: String
    let price: Int

    enum CodingKeys: String, CodingKey {
        case menuID = "menu_id"
        case menuPhotoURL = "menu_photo_url"
        case menuName = "menu_name"
        case price
    }
}

// MARK: - ReviewList
struct ReviewList: Codable {
    let reviewID, star: Int
    let reviewerName: String
    let dayBefore: Int
    let reviewContent: String

    enum CodingKeys: String, CodingKey {
        case reviewID = "review_id"
        case star
        case reviewerName = "reviewer_name"
        case dayBefore = "day_before"
        case reviewContent = "review_content"
    }
}
