//
//  LLTVListViewController.swift
//  LLTVShow
//
//  Created by lotawei on 17/2/10.
//  Copyright © 2017年 lotawei. All rights reserved.
//

import UIKit

class LLTVListViewController: BaseViewController {
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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



