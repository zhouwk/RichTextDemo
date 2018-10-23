//
//  SequenceExtension.swift
//  RichTextDemo
//
//  Created by 周伟克 on 2018/9/25.
//  Copyright © 2018年 周伟克. All rights reserved.
//

import Foundation


extension Sequence {
    
    func findFirst(_ match: (Element) -> Bool ) -> Element? {
        for element in self where match(element) {
            return element
        }
        return nil
    }
}
