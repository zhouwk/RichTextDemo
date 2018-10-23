//
//  Status.swift
//  RichTextDemo
//
//  Created by 周伟克 on 2018/9/14.
//  Copyright © 2018年 周伟克. All rights reserved.
//

import UIKit
import SwiftyJSON

class Status: NSObject {

    var name = ""
    var content = ""
    var repost_count = 0
    var comment_count = 0
    var favour_count = 0
    var time = 0.0
    var timeStr = ""
    var like = false
    
    // 非接口部分数据
    var specialTexts = [SpecialText]()
    var contentAttriString = NSMutableAttributedString(string: "")
    var font = UIFont.systemFont(ofSize: 15) {
        didSet {
            let range = NSMakeRange(0, contentAttriString.length)
            contentAttriString.addAttributes([.font: font], range: range)

        }
    }
    
    
    init(json: JSON) {
        
        super.init()
        name = json["name"].stringValue
        content = json["content"].stringValue
        analyzeContent()
        packageContentAttriString()
        repost_count = json["repost_count"].intValue
        comment_count = json["comment_count"].intValue
        favour_count = json["comment_count"].intValue
        time = json["time"].doubleValue
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = Date(timeIntervalSince1970: time)
        timeStr = df.string(from: date)
        like = json["like"].boolValue
    }
    
    /// 解析content中的特殊字符串
    private func analyzeContent() {
        
        let temp = NSString(string: content)
        //1. 匹配用户名
        let namePattern = "@[a-zA-Z0-9\\u4e00-\\u9fa5]+"
        var matches = content.match(pattern: namePattern)
        for match in matches {
            let username = temp.substring(with: match.range)
            let text = SpecialText(text: username, type: .username, range: match.range)
            specialTexts.append(text)
        }
        
        // 匹配话题
        let topicPattern = "#[a-aA-Z0-9\\u4e00-\\u9fa5]+#"
        matches = content.match(pattern: topicPattern)
        for match in matches {
            let topic = temp.substring(with: match.range)
            let text = SpecialText(text: topic, type: .topic, range: match.range)
            specialTexts.append(text)
        }

        // 匹配简易网址
        let urlPattern = "https://[a-zA-Z0-9/\\.-_]+"
        matches = content.match(pattern: urlPattern)
        for match in matches {
            let url = temp.substring(with: match.range)
            let text = SpecialText(text: url, type: .url, range: match.range)
            specialTexts.append(text)
        }
        // 匹配图片
        let picPattern = "\\[[\\u4e00-\\u9fa5]+\\]"
        matches = content.match(pattern: picPattern)
        for match in matches {
            let pic = temp.substring(with: match.range)
            let text = SpecialText(text: pic, type: .pic, range: match.range)
            specialTexts.append(text)
        }
        
        specialTexts = specialTexts.sorted(by: { (left, right) -> Bool in
            return left.range.location < right.range.location
        })
    }
    
    
    /// 拼接contentAttriString
    private func packageContentAttriString() {
        
        
        contentAttriString = NSMutableAttributedString(string: content)
        var reduce = 0
        for specialText in specialTexts {
            
            specialText.range.location -= reduce
            let rangeTemp = specialText.range
            var subAttrStr: NSMutableAttributedString!
            if specialText.type == .pic, let picName = specialText.picName {
                let attach = NSTextAttachment()
                attach.image = UIImage(named: picName)
                attach.bounds = CGRect(x: 0, y: 0, width: font.lineHeight, height: font.lineHeight)
                subAttrStr = NSMutableAttributedString(attachment: attach)
                if specialText.range.length != 1 {
                    reduce += rangeTemp.length - 1
                    specialText.range.length = 1
                }
            } else {
                subAttrStr = NSMutableAttributedString(string: specialText.text)
                var color: UIColor!
                switch specialText.type {
                case .username:
                    color = UIColor.red
                case .topic:
                    color = UIColor.orange
                case .url:
                    color = UIColor.green
                case .pic:
                    // 本地没有这个图片，依然显示图片对应的文字
                    color = UIColor.black
                }
                let range = NSMakeRange(0, specialText.range.length)
                subAttrStr.addAttributes([.foregroundColor: color],
                                         range: range)
            }
            contentAttriString.replaceCharacters(in: rangeTemp, with: subAttrStr)
        }
        
        
        let paraStyle = NSMutableParagraphStyle()
        paraStyle.lineBreakMode = .byCharWrapping
        let range = NSMakeRange(0, contentAttriString.length)
        contentAttriString.addAttributes([.font: font,
                                          .paragraphStyle: paraStyle],
                                         range: range)
    }
}
