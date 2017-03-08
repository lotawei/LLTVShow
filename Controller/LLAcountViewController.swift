//
//  LLAcountViewController.swift
//  LLTVShow
//
//  Created by lotawei on 17/2/10.
//  Copyright © 2017年 lotawei. All rights reserved.
//

import UIKit

class LLAcountViewController: BaseViewController {
    
   lazy var   btnlogin:HamburgerButton = {
        let  btn = HamburgerButton()
       btn.backgroundColor = fontcolor
    
        btn.addTarget(self, action: #selector(LLAcountViewController.login), for: .touchUpInside)
    
     return  btn
   }()
    
    func login()  {
        
         self.btnlogin.showsMenu  = !self.btnlogin.showsMenu
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(self.btnlogin)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.btnlogin.snp.makeConstraints { (maker) in
            maker.width.equalTo(50);
             maker.height.equalTo(50);
            maker.center.equalTo(view)
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
       
        
    }

  

}
