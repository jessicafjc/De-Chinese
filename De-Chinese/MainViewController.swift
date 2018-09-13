//
//  MainViewController.swift
//  De-Chinese
//
//  Created by Mac on 2018/9/12.
//  Copyright © 2018年 JessicaFuMac. All rights reserved.
//

import UIKit
var chineseModel = ChineseModel()

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        searchAll(tb_name:"tbl_cn_basic")
    }

    func searchAll(tb_name:String) {
        let query:BmobQuery = BmobQuery(className: tb_name)
        var arr = [String]()
        query.findObjectsInBackground { (array, error) in
            let count:Int = (array?.count)!
            for i in 0 ..< count {
                let obj = array![i] as! BmobObject
                let chineseName = (obj.object(forKey: "chineseName") as? String)!
                let chineseStroke = (obj.object(forKey: "strokeNum") as? Int)!
                //打印汉字名字
                print("汉字 \(String(describing: chineseName))的笔画是\(String(describing: chineseStroke))")
                //打印objectId,createdAt,updatedAt
                print("objectid   \(obj.objectId)")
                print("createdAt  \(obj.createdAt)")
                print("updatedAt  \(obj.updatedAt)")
                arr.append(chineseName)
//                chineseModel.chineseList.append(chineseName)
            }
            chineseModel.chineseList = arr
        print("获取到的列表：\(chineseModel.chineseList)")
        }
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
