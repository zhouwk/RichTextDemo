
//
//  StatusTableView.swift
//  RichTextDemo
//
//  Created by 周伟克 on 2018/9/14.
//  Copyright © 2018年 周伟克. All rights reserved.
//

import UIKit

class StatusTableView: UITableView {

    let reuseCellID = "StatusTableViewCell"
    let reuseFooterViewID = "UITableFooterView"
    let reuseHeaderViewID = "UITablewHeaderView"
    lazy var statuses = [Status]()

    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
        showsVerticalScrollIndicator = false
        backgroundColor = UIColor.groupTableViewBackground
        
        delegate = self
        dataSource = self
        register(StatusTableViewCell.self,
                 forCellReuseIdentifier: reuseCellID)
        register(UITableViewHeaderFooterView.self,
                 forHeaderFooterViewReuseIdentifier: reuseFooterViewID)
        register(UITableViewHeaderFooterView.self,
                 forHeaderFooterViewReuseIdentifier: reuseHeaderViewID)
        
        

    }
    
    func reloadData(statuses: [Status]) {
        
        self.statuses = statuses
        reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StatusTableView: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return statuses.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let contentAttri = statuses[indexPath.section].contentAttriString
        let contentHeight = contentAttri.height(fontSize: 15, in: frame.width - 10)
        // extralHeight使用是为了解决一个TextView的bug(模拟器发现的，真机没发现)，
        // 调用了SpecialTextView isScrollEnabled = false
        // 导致最后一行没有显示出来, 增加一个pt让最后一行显示出来 很奇怪 ？？
        // 如何直接关闭SpecialTextView的用户交互(自然也关掉了滚动)，但是不会出现这种情况，很奇怪 ？？
        let extralHeight = CGFloat(1)
        return 95 + contentHeight + extralHeight
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = ElasticTopHUD.show(text: "cell   \(indexPath)点击事件")
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableView.dequeueReusableHeaderFooterView(withIdentifier: reuseHeaderViewID)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        return tableView.dequeueReusableHeaderFooterView(withIdentifier: reuseFooterViewID)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        return tableView.dequeueReusableCell(withIdentifier: reuseCellID)!
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let statusCell = cell as! StatusTableViewCell
        statusCell.updateUIBy(status: statuses[indexPath.section])
    }
}

