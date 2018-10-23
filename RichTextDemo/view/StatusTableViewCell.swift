
//
//  StatusTableViewCell.swift
//  RichTextDemo
//
//  Created by 周伟克 on 2018/9/14.
//  Copyright © 2018年 周伟克. All rights reserved.
//

import UIKit
import SnapKit

// tableview + cell 执行逻辑
class StatusTableViewCell: UITableViewCell {

    
    weak var iconView: UIImageView!
    weak var nameLabel: UILabel!
    weak var timeLabel: UILabel!
    weak var contentTextView: SpecialTextView!
    weak var favourBtn: UIButton!
    weak var commentBtn: UIButton!
    weak var repostBtn: UIButton!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initUI()
    }
    

    func updateUIBy(status: Status) {
        nameLabel.text = status.name
        timeLabel.text = status.timeStr
        contentTextView.status = status
        repostBtn.setTitle("\(status.repost_count)", for: .normal)
        commentBtn.setTitle("\(status.comment_count)", for: .normal)
        favourBtn.setTitle("\(status.favour_count)", for: .normal)
        favourBtn.isSelected = status.like
        
    }
    
    private func initUI() {
        
        selectionStyle = .none
        
        let iconView = UIImageView(image: #imageLiteral(resourceName: "avatar_default"))
        contentView.addSubview(iconView)
        iconView.snp.makeConstraints { (maker) in
            maker.top.equalTo(5)
            maker.left.equalTo(5)
            maker.size.equalTo(CGSize(width: 50, height: 50))
        }
        self.iconView = iconView
        
        let nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 14)
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(5)
            maker.left.equalTo(iconView.snp.right).offset(5)
        }
        self.nameLabel = nameLabel
        
        let timeLabel = UILabel()
        contentView.addSubview(timeLabel)
        timeLabel.font = UIFont.systemFont(ofSize: 14)
        timeLabel.snp.makeConstraints { (maker) in
            maker.left.equalTo(nameLabel)
            maker.bottom.equalTo(iconView)
        }
        self.timeLabel = timeLabel
        
        let contentTextView = SpecialTextView(frame: .zero)
        contentTextView.font = UIFont.systemFont(ofSize: 15)
        contentView.addSubview(contentTextView)
        contentTextView.snp.makeConstraints { (maker) in
            maker.left.equalTo(5)
            maker.top.equalTo(iconView.snp.bottom).offset(5)
            maker.right.equalTo(-5)
        }
        self.contentTextView = contentTextView
        
        let repostBtn = UIButton(type: .custom)
        repostBtn.setImage(#imageLiteral(resourceName: "icon_retpost"), for: .normal)
        contentView.addSubview(repostBtn)
        repostBtn.snp.makeConstraints { (maker) in
            maker.left.equalTo(0)
            maker.top.equalTo(contentTextView.snp.bottom).offset(5)
            maker.bottom.equalTo(0)
            maker.width.equalTo(self).dividedBy(3)
            maker.height.equalTo(30)
        }
        self.repostBtn = repostBtn

        let commentBtn = UIButton(type: .custom)
        commentBtn.setImage(#imageLiteral(resourceName: "icon_comment"), for: .normal)
        contentView.addSubview(commentBtn)
        commentBtn.snp.makeConstraints { (maker) in
            maker.left.equalTo(repostBtn.snp.right)
            maker.bottom.equalTo(0)
            maker.width.equalTo(self).dividedBy(3)
            maker.height.equalTo(30)
        }
        self.commentBtn = commentBtn
        
        let favourBtn = UIButton(type: .custom)
        favourBtn.setImage(#imageLiteral(resourceName: "like"), for: .normal)
        favourBtn.setImage(#imageLiteral(resourceName: "like_selected"), for: .selected)
        contentView.addSubview(favourBtn)
        favourBtn.snp.makeConstraints { (maker) in
            maker.left.equalTo(commentBtn.snp.right)
            maker.bottom.equalTo(0)
            maker.width.equalTo(self).dividedBy(3)
            maker.height.equalTo(30)
        }
        self.favourBtn = favourBtn
        
        
        for btn in [repostBtn, commentBtn, favourBtn] {
            
            btn.setTitleColor(UIColor.lightGray, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
            btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
