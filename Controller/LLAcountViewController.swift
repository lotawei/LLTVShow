//
//  LLAcountViewController.swift
//  LLTVShow
//
//  Created by lotawei on 17/2/10.
//  Copyright © 2017年 lotawei. All rights reserved.
//

import UIKit

class LLAcountViewController: BaseViewController {

    var   abtn:UIButton?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
          self.abtn = UIButton()
        
        
        abtn?.setTitle("登录", for:  .normal)
        
        view.addSubview(abtn!)
        
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        abtn!.snp.makeConstraints { (contris) in
            
        }
        
        
    }

  

}
