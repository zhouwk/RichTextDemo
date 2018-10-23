//
//  SpecialTextView.swift
//  RichTextDemo
//
//  Created by 周伟克 on 2018/9/25.
//  Copyright © 2018年 周伟克. All rights reserved.
//

import UIKit

class SpecialTextView: UITextView {
    
    var status: Status! {
        
        didSet {
            specailTexts = status.specialTexts
            attributedText = status.contentAttriString
        }
    }
    private var specailTexts: [SpecialText]!
    private var selectedSpecailText: SpecialText?
    init(frame: CGRect) {
//        super.init(frame: frame)
        super.init(frame: frame, textContainer: nil) // 只能使用该构造函数
        setupUI()
    }
    
    func setupUI() {
        // 除去上下边距(textContainerInset即使把左右设置为0，还是有左右边距的存在)
        textContainerInset = .zero
        // 除去左右边距
        textContainer.lineFragmentPadding = 0
        isEditable = false
        isScrollEnabled = false
        isSelectable = false
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let selectedSpecailText = selectedSpecailText {
            let text = selectedSpecailText.text
            _ = ElasticTopHUD.show(text: text)
            self.selectedSpecailText = nil
        }
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        
        for specialText in specailTexts {
            // 获取每一段特殊字符所占有的矩形框
            selectedRange = specialText.range
            if let _selectedTextRange = selectedTextRange {
                let _selectionRects = selectionRects(for: _selectedTextRange) as! [UITextSelectionRect]
                specialText.rects = _selectionRects.map({
                    return $0.rect
                })
            }
        }
        
        if let specialText = specailTexts.findFirst({
            return $0.rects.findFirst({ (rect) -> Bool in
                return rect.contains(point)
            }) != nil
        }) {
            selectedSpecailText = specialText
            return true
        }
        return false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
