//
//  StringLiterals.swift
//  Tabling-iOS
//
//  Created by 고아라 on 2023/11/18.
//

import Foundation

enum I18N {
    
    enum WaitingDetail {
        static let waitingInfoTitle = "대기정보"
        static let waitingDateTitle = "접수일시"
        static let waitingNumTitle = "대기번호"
        static let waitingheadCountTitle = "인원"
        static let waitingStatusTitle = "대기상태"
        static let totalSalesTitle = "총 금액"
        static let requestTitle = "요청사항"
        static let statusDoneLabel = "이용이 완료되었어요"
        static let statusIngLabel = "대기중이에요"
    }
    
    enum ReserveAlert {
        static let reserveTitle = "대기 신청 완료"
        static let waitingTitle = "대기번호"
        static let waitingNumTitle = "번"
        static let shopTitle = "매장명"
        static let personTitle = "인원"
        static let statusTitle = "신청상태"
        static let reserveButtonTitle = "대기 내역 확인하기"
    }
    
    enum StoreDetail {
        static let lookMapButtonTitle = "지도보기"
        static let homeSegmentControlTitle = "홈"
        static let menuSegmentControlTitle = "전체메뉴"
        static let reviewSegmentControlTitle = "최근리뷰"
        static let tablingButtonTitle = "원격줄서기"
        static let reservationButtonTitle = "예약 불가"
        static let orederButtonTitle = "주문 불가"
        static let allMenuTitle = "전체 메뉴"
        static let testLabel = "test"
        static let detailTitle1 = "음식 맛"
        static let detailTitle2 = "분위기"
        static let detailTitle3 = "친절도"
        static let detailTitle4 = "청결상태"
        static let averageTitle = "전체 평점"
        static let salesInfoTitle = "영업정보"
        static let salesTimeInfoTitle = "운영시간"
        static let salesWaitTimeInfoTitle = "원격줄서기"
        static let salesRestTimeInfoTitle = "휴식시간"
        static let salesDayoffInfoTitle = "휴무일"
        static let salesPhoneInfoTitle = "전화번호"
        static let storePickTagTitle = "매장 PICK!"
        static let amenityTitle = "편의시설"
        static let introduceStoreTitle = "매장소개"
    }
    
    enum ReserveBottomSheet {
        static let personChoiceTitle = "방문 인원을 선택하세요"
        static let personTitle = "인원"
        static let tablingButtonTitle = "대기 신청하기"
    }
    
    enum StoreList {
        static let storeTestLabel = "test"
    }
    
    enum TablingList {
        static let navigationBarTitle = "원격 줄서기 내역"
        static let segementTitle1 = "이용예정/완료"
        static let segementTitle2 = "취소/노쇼"
        static let statusPlanTitle = "이용예정"
        static let statusCompleteTitle = "이용완료"
        static let detailButtonTitle = "상세보기"
        static let testLabel = "test"
        static let beforeCountTitle = "현재 내 앞 대기"
        static let delayButtonTitle = "내 순서 미루기"
        static let confirmButtonTitle = "확정 코드 입력하기"
        static let cancelButtonTitle = "주문 취소"
        static let reviewButtonTitle = "리뷰쓰기"
        static let reviewEndTitle = "리뷰 작성 기간이 지났어요."
    }
}
