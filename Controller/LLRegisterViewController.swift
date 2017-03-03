//
//  LLRegisterViewController.swift
//  LLTVShow
//
//  Created by lotawei on 17/1/20.
//  Copyright © 2017年 lotawei. All rights reserved.
//

import UIKit

class LLRegisterViewController: UIViewController {
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor =  normalcolor
        
        navigationItem.title = "注册"
        let dict:NSDictionary = [NSForegroundColorAttributeName: btncolor,NSFontAttributeName : UIFont.boldSystemFont(ofSize: 17)]
        //标题颜色
        self.navigationController?.navigationBar.titleTextAttributes = dict as? [String : AnyObject]
        
        
    }

   

}
