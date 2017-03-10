//
//  LLRegisterViewController.swift
//  LLTVShow
//
//  Created by lotawei on 17/1/20.
//  Copyright © 2017年 lotawei. All rights reserved.
//

import UIKit

class LLRegisterViewController: BaseViewController ,LTMorphingLabelDelegate {
    
    lazy var  lblname:LTMorphingLabel = {
        let  lab = LTMorphingLabel()
        lab.delegate = self
        
        lab.tintColor = fontcolor
        lab.morphingEffect = .burn
        lab.text = "邮箱"
        
        return  lab
    }()
    lazy  var  txtfield:YoshikoTextField = {
        let   field = YoshikoTextField()
        
    
        field.borderStyle = .roundedRect
        return  field
    }()
    lazy var  btnregister:UIButton = {
        let  register  = UIButton()
        register.setTitle("发送验证", for: .normal)
        register.backgroundColor = UIColor.blue
        
        return  register
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        initview()
      
    }
    
     func  initview(){
        self.navigationController?.navigationBar.isHidden  = false
        view.backgroundColor =  normalcolor
        navigationItem.title = "发送验证"
        let dict:NSDictionary = [NSForegroundColorAttributeName: fontcolor,NSFontAttributeName : UIFont.boldSystemFont(ofSize: 17)]
        //标题颜色
        self.navigationController?.navigationBar.titleTextAttributes = dict as? [String : AnyObject]
        view.addSubview(self.lblname)
        view.addSubview(self.btnregister)
        view.addSubview(self.txtfield)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden  = true
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.lblname.snp.makeConstraints { (maker) in
            maker.left.equalTo(10)
            maker.width.equalTo(60)
            maker.height.equalTo(40)
            maker.top.equalTo(10)
        }
        self.txtfield.snp.makeConstraints { (maker) in
            maker.left.equalTo(60)
            maker.width.equalTo(150)
            maker.height.equalTo(30)
            maker.top.equalTo(10)
        }
        self.btnregister.snp.makeConstraints { (maker) in
            maker.right.equalTo(-10)
            maker.width.equalTo(100)
            maker.height.equalTo(30)
            maker.top.equalTo(10)
        }
        
    }
   

}
