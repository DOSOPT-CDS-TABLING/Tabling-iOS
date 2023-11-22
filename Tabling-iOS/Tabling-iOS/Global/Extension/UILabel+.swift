//
//  UILabel+.swift
//  Tabling-iOS
//
//  Created by 고아라 on 2023/11/17.
//

import UIKit

extension UILabel {
    // 특정 부분만 폰트, 색상 적용
    func partFontChange(targetString: String, font: UIFont, textColor: UIColor) {
        let fullText = self.text ?? ""
        let range = (fullText as NSString).range(of: targetString)
        let attributedString = NSMutableAttributedString(string: fullText)
        attributedString.addAttribute(.font, value: font, range: range)
        attributedString.addAttribute(.foregroundColor, value: textColor, range: range)
        self.attributedText = attributedString
    }

    // 행간, 자간 조절 메소드
    func setLineAndCharacterSpacing(font: UIFont) {
        guard let existingText = self.text else {
            return
        }
        
        let existingAttributes = self.attributedText?.attributes(at: 0, effectiveRange: nil) ?? [:]
        
        let attributedStr = NSMutableAttributedString(string: existingText, attributes: existingAttributes)
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 1.5
        attributedStr.addAttribute(NSAttributedString.Key.paragraphStyle,
                                   value: style,
                                   range: NSMakeRange(0, attributedStr.length))
        attributedStr.addAttribute(NSAttributedString.Key.kern,
                                   value: -0.025,
                                   range: NSMakeRange(0, attributedStr.length))
        attributedStr.addAttribute(NSAttributedString.Key.font, value: font, range: NSMakeRange(0, attributedStr.length))
        
        self.attributedText = attributedStr
    }
}
