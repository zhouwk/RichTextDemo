//
//  StringExtension.swift
//  RichTextDemo
//
//  Created by 周伟克 on 2018/9/25.
//  Copyright © 2018年 周伟克. All rights reserved.
//

import Foundation
import UIKit

extension NSMutableAttributedString {
    
    func height(fontSize: CGFloat = 15, in width: CGFloat) -> CGFloat {
        
        // usesFontLeading 不换行高度
        let size = CGSize(width: width, height: CGFloat.infinity)
        let height = boundingRect(with: size, options: [.usesLineFragmentOrigin],
                                  context: nil).size.height
        return height
    }
}


extension String {
    
    func match(pattern: String) -> [NSTextCheckingResult] {
        
        guard let regular = try? NSRegularExpression(pattern: pattern, options: []) else {
            return []
        }
        let range = NSMakeRange(0, count)
        return regular.matches(in: self, options: [], range: range)
    }
}
