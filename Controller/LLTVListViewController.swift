//
//  LLTVListViewController.swift
//  LLTVShow
//
//  Created by lotawei on 17/2/10.
//  Copyright © 2017年 lotawei. All rights reserved.
//

import UIKit
class LLTVListViewController: BaseViewController {

    //  搜索条
    lazy   var  searchbar:UISearchBar = {
       let     searchbar = UISearchBar(frame: CGRect(x: 0, y: 20, width: ScreenWidth, height: 30))
       
        //需要网络
        return   searchbar
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        view.addSubview(searchbar)
    }
    
   
}
