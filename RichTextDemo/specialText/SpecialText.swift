//
//  SpecialText.swift
//  RichTextDemo
//
//  Created by 周伟克 on 2018/9/25.
//  Copyright © 2018年 周伟克. All rights reserved.
//

import UIKit

enum SpecilType {
    case username
    case pic
    case topic
    case url
}

class SpecialText: NSObject {

    var type = SpecilType.username
    var range = NSMakeRange(0, 0)
    var text = ""
    var picName: String?
    var rects = [CGRect]()
    
    init(text: String, type: SpecilType, range: NSRange) {
        super.init()
    
        self.text = text
        self.type = type
        self.range = range
        
        if type == .pic {
            // demo中只用了这两种pic, 其他pic按照不识别继续显示文字处理
            if text == "[鼓掌]" {
                picName = "guzhang"
            } else if text == "[哭]" {
                picName = "cry"
            }
        }
    }
}
