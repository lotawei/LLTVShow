//
//  LLTVListViewController.swift
//  LLTVShow
//
//  Created by lotawei on 17/2/10.
//  Copyright © 2017年 lotawei. All rights reserved.
//

import UIKit

class LLTVListViewController: BaseViewController {

    lazy   var  searchbar:UISearchBar = {
       let     searchbar = UISearchBar(frame: CGRect(x: 0, y: 64, width: ScreenWidth, height: 30))
        
        
        return   searchbar
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
      
        view.addSubview(searchbar)
    }
    
   
}
