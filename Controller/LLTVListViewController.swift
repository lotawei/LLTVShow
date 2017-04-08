//
//  LLTVListViewController.swift
//  LLTVShow
//
//  Created by lotawei on 17/2/10.
//  Copyright © 2017年 lotawei. All rights reserved.
//

import UIKit

class LLTVListViewController: BaseViewController {
    
  
    var    tableview:LLBaseTableView!
    var    tabdata:[LLContenCategory] = [LLContenCategory]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        tableview = LLBaseTableView(frame: CGRect.zero, style: .plain)
        tableview.delegate = self
        tableview.dataSource = self
        
        
        tableview.register(LLCategoryCell.self,
                            forCellReuseIdentifier:"myCell")
        view.addSubview(tableview!)
        
        weak var  tmp = self
        _ =  LLAuthManager.init("http://open.moretv.com.cn/moviesite", .get, nil, datablock: { (data) in
            LLContenCategory.GetContenCategory(data, { (categories) in
                 tmp?.tabdata = categories!
                
                
                 tmp?.tableview.reloadData()
            })
            
            
            
            
        })
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
      
        tableview.snp.makeConstraints { (maker) in
            maker.width.equalTo(ScreenWidth)
            maker.height.equalTo(ScreenHeight - 49)
            maker.left.equalTo(0)
            maker.top.equalTo(0)
        }
        
        
        
    }
    
    // MARK:- Action
    // MARK: 扫一扫和搜索Action
    func leftItemClick() {
        
    }
    
    func rightItemClick() {
        // 搜索
        
    }
    
    func titleViewClick() {
        
    }

        
     override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if  (self.navigationController?.viewControllers.count)! > 0 {
               self.navigationController?.navigationBar.isHidden  = false
        }
    }
}
extension LLTVListViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        
        
        return  1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return   tabdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let  cellid = "cell"
        let   category = tabdata[indexPath.row]
        
        var   cell = tableview.dequeueReusableCell(withIdentifier: cellid) as?  LLCategoryCell
        if  cell == nil {
            
            cell = LLCategoryCell(style: .default, reuseIdentifier: cellid)
            
        }
      
        //设置 cell
        cell!.setcategory(category)
        
        
        
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return   120
    }
    
    
}


