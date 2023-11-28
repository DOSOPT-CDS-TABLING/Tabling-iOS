//
//  ImageLiterals.swift
//  Tabling-iOS
//
//  Created by 고아라 on 2023/11/18.
//

import UIKit

enum ImageLiterals {
    enum Common {
        static var ic_back_b: UIImage { .load(name: "ic_chevron_left_black") }
        static var ic_back_w: UIImage { .load(name: "ic_chevron_left_white") }
        static var ic_refresh: UIImage { .load(name: "ic_refresh_ios") }
        static var ic_next: UIImage { .load(name: "ic_chevron_right_black") }
        static var devider_narrow: UIImage { .load(name: "divider_narrow_ios") }
        static var devider_wide: UIImage { .load(name: "divider_wide_ios") }
        static var ic_star_fill: UIImage { .load(name: "icon_star_colored") }
        static var ic_star_empty: UIImage { .load(name: "icon_star_gray") }
    }
    
    enum WaitingDetail {
        static var tag_call: UIImage { .load(name: "tag_call_detail_1") }
        static var tag_location: UIImage { .load(name: "tag_location_detail_1") }
        static var tag_storeDetail: UIImage { .load(name: "tag_store_detail_1") }
    }
    
    enum StoreDetail {
        static var ic_heart_b: UIImage { .load(name: "ic_heart_black") }
        static var ic_heart_w: UIImage { .load(name: "ic_heart_white") }
        static var ic_share_b: UIImage { .load(name: "ic_share_black") }
        static var ic_share_w: UIImage { .load(name: "ic_share_white") }
        static var ic_wifi: UIImage { .load(name: "ic_wifi") }
        static var ic_toilet: UIImage { .load(name: "ic_couple") }
        static var ic_parking: UIImage { .load(name: "ic_car") }
        static var ic_waiting: UIImage { .load(name: "ic_waiting") }
        static var ic_exit_circle: UIImage { .load(name: "icon_exit_circle") }
        static var ic_minus_able: UIImage { .load(name: "ic_minus_able") }
        static var ic_minus_disable: UIImage { .load(name: "ic_minus_disable") }
        static var ic_plus: UIImage { .load(name: "ic_plus") }
        static var ic_info: UIImage { .load(name: "ic_info") }
        static var btn_all_menu_look: UIImage { .load(name: "btn_all_menu_look") }
        static var btn_all_review_look: UIImage { .load(name: "btn_all_review_look") }
    }
    
    enum StoreList {
        static var ic_moreLocation: UIImage { .load(name: "ic_more") }
        static var ic_moreLocation_bg: UIImage { .load(name: "ic_more_bc") }
        static var ic_polygon: UIImage { .load(name: "ic_polygon") }
        static var ic_people: UIImage { .load(name: "ic_people") }
    }
    
    enum TablingList {
        static var ic_review: UIImage { .load(name: "tdesign_pen-ball") }
        static var tag_canceled: UIImage { .load(name: "tag_canceled_ios") }
        static var tag_completed: UIImage { .load(name: "tag_completed_ios") }
        static var tag_noshow: UIImage { .load(name: "tag_noshow_ios") }
        static var tag_planned: UIImage { .load(name: "tag_planned_ios") }
    }
}
