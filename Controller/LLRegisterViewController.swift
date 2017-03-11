//
//  LLRegisterViewController.swift
//  LLTVShow
//
//  Created by lotawei on 17/1/20.
//  Copyright © 2017年 lotawei. All rights reserved.
//

import UIKit
//  快速随机生成一些未取名的用户名



public let    undefindedusername = ["苏陌染","柒夏", "花醉伊人泪", "七秒钟の记忆℡", "天亮说晚安", "落花忆梦", "隐身守候", "习惯性","墨白" ,"后會無期" ,"南城忆潇湘","步子大了丶容易扯蛋","新城已无旧少年", "朕略傻T_T 樱花霓ぴ", "浪痞", "情场撩妹王", "余悸", "习惯比依赖更可怕"]
public let   tragetValue = Int(arc4random_uniform(18))
public let   randomusername = undefindedusername[tragetValue]

class LLRegisterViewController: BaseViewController ,LTMorphingLabelDelegate {
    //用于提示的提示框
    let   alert = SweetAlert()
    
    
    lazy var  lblname:LTMorphingLabel = {
        let  lab = LTMorphingLabel()
        lab.delegate = self
        
        lab.textColor = fontcolor
        lab.morphingEffect = .burn
        lab.text = "邮箱"
        
        
        return  lab
    }()
    
    lazy var  lblpwd:LTMorphingLabel = {
        let  alab = LTMorphingLabel()
        alab.delegate = self
        
        alab.textColor = fontcolor
        alab.morphingEffect = .burn
        alab.text = "密码"
        
        
        return  alab
    }()
    lazy var  lblepwd:LTMorphingLabel = {
        let  alab = LTMorphingLabel()
        alab.delegate = self
        
        alab.textColor = fontcolor
        alab.morphingEffect = .sparkle
        alab.text = "重复"
        
        
        return  alab
    }()
    //邮箱
    lazy  var  txtemail:YoshikoTextField = {
        let   field = YoshikoTextField()
        field.borderStyle = .roundedRect
        field.tag = 1001
        field.delegate = self
        return  field
    }()
    //密码
    lazy  var  txtpwd:YoshikoTextField = {
        let   field = YoshikoTextField()
        field.borderStyle = .roundedRect
        field.isSecureTextEntry = true
        field.tag = 1002
        field.delegate = self
        return  field
    }()
    //重复密码
    lazy  var  txtepwd:YoshikoTextField = {
        let   field = YoshikoTextField()
        field.borderStyle = .roundedRect
        field.isSecureTextEntry = true
        field.tag = 1003
        field.delegate = self
        return  field
    }()
    lazy var  btnregister:UIButton = {
        let  register  = UIButton()
        register.setTitle("快速注册", for: .normal)
        register.backgroundColor = fontcolor
        register.addTarget(self, action: #selector(LLRegisterViewController.register), for: .touchUpInside)
        return  register
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        initview()
      
    }
    
     func  initview(){
        self.navigationController?.navigationBar.isHidden  = false
        view.backgroundColor =  normalcolor
        navigationItem.title = "注册"
        let dict:NSDictionary = [NSForegroundColorAttributeName: fontcolor,NSFontAttributeName : UIFont.boldSystemFont(ofSize: 17)]
        //标题颜色
        self.navigationController?.navigationBar.titleTextAttributes = dict as? [String : AnyObject]
        view.addSubview(self.lblname)
        view.addSubview(self.lblpwd)
        view.addSubview(self.lblepwd)
        view.addSubview(self.btnregister)
        view.addSubview(self.txtemail)
        view.addSubview(self.txtpwd)
        view.addSubview(self.txtepwd)
        
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden  = true
    }
    //  布局
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // 名称左
        let   al = (ScreenWidth - 180 - 80 )/2
        // 输入左
        let   iptl  = al + 80
        
        self.lblname.snp.makeConstraints { (maker) in
            maker.left.equalTo(al)
            maker.width.equalTo(80)
            maker.height.equalTo(30)
            maker.top.equalTo(30)
        }
        self.lblpwd.snp.makeConstraints { (maker) in
            maker.left.equalTo(al)
            maker.width.equalTo(80)
            maker.height.equalTo(30)
            maker.top.equalTo(70)
        }
        self.lblepwd.snp.makeConstraints { (maker) in
            maker.left.equalTo(al)
            maker.width.equalTo(80)
            maker.height.equalTo(30)
            maker.top.equalTo(110)
        }
        self.txtemail.snp.makeConstraints { (maker) in
            maker.left.equalTo(iptl)
            maker.width.equalTo(180)
            maker.height.equalTo(30)
            maker.top.equalTo(30)
        }
        self.txtpwd.snp.makeConstraints { (maker) in
            maker.left.equalTo(iptl)
            maker.width.equalTo(180)
            maker.height.equalTo(30)
            maker.top.equalTo(70)
        }
        self.txtepwd.snp.makeConstraints { (maker) in
            maker.left.equalTo(iptl)
            maker.width.equalTo(180)
            maker.height.equalTo(30)
            maker.top.equalTo(110)
        }
        self.btnregister.snp.makeConstraints { (maker) in
            maker.centerX.equalTo(view)
            maker.width.equalTo(180)
            maker.height.equalTo(30)
            maker.top.equalTo(180)
        }
        
        
    }
    
    //  注册功能 
    
    func   register(){
        
        
        var  valid = false
        if   !txtemail.validateEmail() {
            
            _ =  alert.showAlert("邮箱地址不合法")
            return
        }
        if txtpwd.text != txtepwd.text  {
            _ = alert.showAlert("两次密码不一致")
            return
        }
        
        
        let   eamil = txtemail.text
        let   pwd = txtpwd.text
        let   anewuser = BmobObject(className: "_User")
        anewuser?.setObject(randomusername, forKey: "username")
        anewuser?.setObject(eamil, forKey: "email")
        anewuser?.setObject(pwd, forKey: "password")
        valid  = true
        anewuser?.saveInBackground { (success, err) in
            if  err != nil{
              _ =  SweetAlert().showAlert("注册出现问题")
            }
            if   success{
              _ =  SweetAlert().showAlert("注册成功")
                
            }
            
        }
        
        if   valid{
        // 将其用户信息存起来
        let   auser = LLUser(randomusername, Usertype.normal, "defaultpotrait", Substyle.normal, isfirst: "no")
        _ =  auser.saveuser()
        }
    }
   
  //外部取消键盘显示
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if   !txtpwd.isExclusiveTouch{
            txtpwd.resignFirstResponder()
        }
        if   !txtemail.isExclusiveTouch{
            txtemail.resignFirstResponder()
        }
        if    !txtepwd.isExclusiveTouch{
             txtepwd.resignFirstResponder()
        }
    }
    
}

//  输入框代理

extension  LLRegisterViewController:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if   !textField.isExclusiveTouch{
            textField.resignFirstResponder()
        }
        return  true
    }
    
    
    
}



