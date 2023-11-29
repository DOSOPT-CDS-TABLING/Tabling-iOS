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
        guard let existingText = self.text else {
            return
        }
        let existingAttributes = self.attributedText?.attributes(at: 0, effectiveRange: nil) ?? [:]
        let attributedStr = NSMutableAttributedString(string: existingText, attributes: existingAttributes)
        let range = (existingText as NSString).range(of: targetString)
        attributedStr.addAttribute(NSAttributedString.Key.font, value: font, range: range)
        attributedStr.addAttribute(NSAttributedString.Key.foregroundColor, value: textColor, range: range)
        self.attributedText = attributedStr
    }
    
    func partColorChange(targetString: String, textColor: UIColor) {
        guard let existingText = self.text else {
            return
        }
        let existingAttributes = self.attributedText?.attributes(at: 0, effectiveRange: nil) ?? [:]
        let attributedStr = NSMutableAttributedString(string: existingText, attributes: existingAttributes)
        let range = (existingText as NSString).range(of: targetString)
        attributedStr.addAttribute(NSAttributedString.Key.foregroundColor, value: textColor, range: range)
        self.attributedText = attributedStr
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
                                   range: NSRange(location: 0, length: attributedStr.length))
        attributedStr.addAttribute(NSAttributedString.Key.kern,
                                   value: -0.025,
                                   range: NSRange(location: 0, length: attributedStr.length))
        attributedStr.addAttribute(NSAttributedString.Key.font, value: font, range: NSRange(location: 0, length: attributedStr.length))
        
        self.attributedText = attributedStr
    }
}
