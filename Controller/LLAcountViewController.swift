//
//  LLAcountViewController.swift
//  LLTVShow
//
//  Created by lotawei on 17/2/10.
//  Copyright © 2017年 lotawei. All rights reserved.
//

import UIKit

class LLAcountViewController: BaseViewController {
    
    let   headview:UIView = UIView()
    //
   lazy var   btnlogin:UIButton = {
        let  btn = UIButton()
       btn.backgroundColor = fontcolor
        btn.setTitle("登录", for: .normal)
        btn.addTarget(self, action: #selector(LLAcountViewController.login), for: .touchUpInside)
    
     return  btn
   }()
    //
    lazy var   btnregister:UIButton = {
        let  abtn = UIButton()
        abtn.backgroundColor = fontcolor
        abtn.setTitle("注册", for: .normal)
        abtn.addTarget(self, action: #selector(LLAcountViewController.register), for: .touchUpInside)
        
        return  abtn
    }()
    
    //头像
    lazy  var  portraitimg:UIImageView = {
        let  img = UIImageView()
         img.backgroundColor = UIColor.black
        
        return  img
    }()
    
        
        
   
    
    func login()  {
        

        self.navigationController?.pushViewController(LLLoginViewController(), animated: true)
        
        
    }
    func     register(){
          self.navigationController?.pushViewController(LLRegisterViewController(), animated: true)

    
        
    }
   
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
         initialview()
        
        
    }
    func initialview(){
        self.navigationController?.navigationBar.isHidden = true
       
        
        view.addSubview(headview)
        headview.backgroundColor = UIColor.gray
        headview.addSubview(self.btnlogin)
        headview.addSubview(self.btnregister)
        headview.addSubview(self.portraitimg)
        
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.btnlogin.snp.makeConstraints { (maker) in
            maker.width.equalTo(80)
            maker.height.equalTo(30)
            maker.bottom.equalTo(-15)
            maker.left.equalTo((ScreenWidth - 160 - 20 )/2.0)
            
        }
        
        
        self.portraitimg.snp.makeConstraints { (maker) in
            maker.width.equalTo(75)
            maker.height.equalTo(75)
            maker.centerX.equalTo(headview)
            maker.top.equalTo(25)
        }
        self.btnregister.snp.makeConstraints { (maker) in
            maker.width.equalTo(80)
            maker.height.equalTo(30)
            maker.bottom.equalTo(-15)
             maker.right.equalTo(-(ScreenWidth - 160 - 80 )/2.0)
        }
        self.headview.snp.makeConstraints { (maker) in
            maker.top.equalTo(0)
            maker.width.equalTo(ScreenWidth)
            maker.height.equalTo(150)
        }
      
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
       
        
    }

  

}
