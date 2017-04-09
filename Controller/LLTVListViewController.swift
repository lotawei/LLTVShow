//
//  LLTVListViewController.swift
//  LLTVShow
//
//  Created by lotawei on 17/2/10.
//  Copyright © 2017年 lotawei. All rights reserved.
//

import UIKit

class LLTVListViewController: BaseViewController {
    
  
  fileprivate  var    tableview:LLBaseTableView!
  fileprivate  var    tabdata:[LLContenCategory] = [LLContenCategory]()
    
    
    lazy var refreshHeadView:LLRefreshView = {
        let refreshHeadView = LLRefreshView(refreshingTarget: self, refreshingAction: #selector(LLTVListViewController.headRefresh))
        
        
        return refreshHeadView!
    }()
      func  headRefresh(){
        
        
        weak var  tmp = self
      
      
        var   finish = false
        
        _ =  LLAuthManager.init(opentvurl, .get, nil, datablock: { (data) in
            if  data.result.error != nil {
                
                 tmp?.tableview.mj_header.endRefreshing()
                
            }
            else{
            LLContenCategory.GetContenCategory(data, { (categories) in
                tmp?.tabdata = categories!
                
                finish = true
                if  finish {
                 tmp?.tableview.mj_header.endRefreshing()
                 tmp?.tableview.reloadData()
                    
                    
                }
            })
            }
            
            
            
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = .top
        automaticallyAdjustsScrollViewInsets = false
        
        tableview = LLBaseTableView(frame: CGRect.zero, style: .plain)
        tableview.delegate = self
        tableview.dataSource = self
//        let refreshHeadView = LLRefreshView(refreshingTarget: self, refreshingAction: "headRefresh")
        self.refreshHeadView.gifView?.frame = CGRect(x:0, y:30, width:100, height:100)
        tableview.mj_header = self.refreshHeadView
        
        
        tableview.register(LLCategoryCell.self,
                            forCellReuseIdentifier:"myCell")
        view.addSubview(tableview!)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        headRefresh()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
      
        tableview.snp.makeConstraints { (maker) in
            maker.width.equalTo(ScreenWidth)
            maker.height.equalTo(ScreenHeight - kTabBarH - kNavigationBarH - kStatusBarH)
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
        return   ScreenWidth +  90
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
        
        
        
    }
    
}


