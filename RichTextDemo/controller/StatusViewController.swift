//
//  StatusViewController.swift
//  RichTextDemo
//
//  Created by 周伟克 on 2018/9/14.
//  Copyright © 2018年 周伟克. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class StatusViewController: UIViewController {

    weak var tableView: StatusTableView!
    
    lazy var statuses = [Status]()
    override func viewDidLoad() {
        super.viewDidLoad()        
        initUI()
        loadData()
    }
    
    private func loadData() {
        
        let url = "http://192.168.199.242:8001/status.php"
        let request = Alamofire.request(url, method: .get,
                                        parameters: nil,
                                        encoding: JSONEncoding.default,
                                        headers: nil)
        request.responseJSON { [weak self] (response) in
            guard let ws = self else {
                return
            }
            ws.statuses.removeAll()
            switch response.result {
            case .success(_):
                let json = JSON(response.data!).arrayValue
                for subJson in json {
                    let status = Status(json:subJson)
                    ws.statuses.append(status)
                }
                ws.tableView.reloadData(statuses: ws.statuses)
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    /// 初始化UI
    private func initUI() {
        
        navigationItem.title = "富文本demo"
        let tableView = StatusTableView(frame: .zero, style: .grouped)
        view.addSubview(tableView)
        self.tableView = tableView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(x: 0, y: 64, width: view.frame.width,
                                 height: view.frame.height - 64)
    }
    
    /// 正则测试
    func testRegular() {
        let pattern = "abc|efg" // abc\efg\abcfg\abcf\abcg......
        let regular = try? NSRegularExpression(pattern: pattern, options: [])
        let str = "abcg"
        let range = NSMakeRange(0, str.count)
        let matches = regular?.matches(in: str, options: [], range: range) ?? []
        print(matches.count)
    }
}
