//
//  UIViewController+Extension.swift
//  CatStaGram
//
//  Created by 조동진 on 2022/03/27.
//

import UIKit

extension UIViewController {
  func generateButtonAttribute(_ button: UIButton, texts: String..., fonts: UIFont..., colors: UIColor...) -> NSMutableAttributedString {
    // UIButton에 입력된 text 가져오기
    guard let wholeText = button.titleLabel?.text else { fatalError("버튼에 텍스트가 없음.") }
    
    // 폰트 배열
    let customFonts: [UIFont] = fonts
    
    // 설정하고자 하는 String의 NSRanges
    let customTextRanges = texts.indices.map { index in
      (wholeText as NSString).range(of: texts[index])
    }
    
    // 설정하고자 하는 색상
    let customColors = colors
    
    // attribute 객체 생성
    let attributedString = NSMutableAttributedString(string: wholeText)
    
    // 텍스트에 맞는 설정 추가
    texts.indices.forEach { index in
      attributedString.addAttribute(.font,
                                    value: customFonts[index],
                                    range: customTextRanges[index])
      
      attributedString.addAttribute(.foregroundColor,
                                    value: customColors[index],
                                    range: customTextRanges[index])
    }
    
    return attributedString
  }
}
