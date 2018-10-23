//
//  ElasticTopHUD.swift
//  RichTextDemo
//
//  Created by 周伟克 on 2018/9/25.
//  Copyright © 2018年 周伟克. All rights reserved.
//

import UIKit

/// 添加在window上的弹框
class ElasticTopHUD: UIView {

    let containerHeight = CGFloat(200)
    let contentHeight = CGFloat(64) // 需要对phoneX以上的机型做适配
    weak var label: UILabel!
    override init(frame: CGRect) {
        let frame = CGRect(x: 0, y: -200,
                           width: UIScreen.main.bounds.width,
                           height: containerHeight)
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI() {
        
        backgroundColor = UIColor.white
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 15)
        addSubview(label)
        self.label = label
    }
    
    func setMsg(_ msg: String) {
        label.text = msg
        label.sizeToFit()
        label.frame.origin.x = 5
        label.frame.origin.y = containerHeight - contentHeight * 0.5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    static func show(text: String) -> ElasticTopHUD {
        
        let hud = ElasticTopHUD(frame: .zero)
        hud.setMsg(text)
        let keyWindow = UIApplication.shared.keyWindow!
        keyWindow.addSubview(hud)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.9, options: [.curveEaseIn], animations: {
            hud.transform = CGAffineTransform.init(translationX: 0,
                                                   y: hud.contentHeight)
        }) { (_) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                UIView.animate(withDuration: 0.3, animations: {
                    hud.transform = .identity
                }, completion: { (_) in
                    hud.removeFromSuperview()
                })
            })
        }
        return hud
    }
}
