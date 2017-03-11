//
//  LLAcountViewController.swift
//  LLTVShow
//
//  Created by lotawei on 17/2/10.
//  Copyright © 2017年 lotawei. All rights reserved.
//

import UIKit

class LLAcountViewController: BaseViewController {
    
  
    
    let   mainscrollerview:UIScrollView! = nil
    // 数据
    lazy   var   listcount = ["周一","zhoue","zhousa","zhousi","zhouw","周一","zhoue","zhousa","zhousi","zhouw","周一","zhoue","zhousa","zhousi","zhouw"]

    //头部
    
    
    let   headview:UIView = UIView()
    //
   lazy var   btnlogin:UIButton = {
        let  btn = UIButton()
       btn.backgroundColor = fontcolor
        btn.setTitle("登录", for: .normal)
        btn.addTarget(self, action: #selector(LLAcountViewController.login), for: .touchUpInside)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 11)
     return  btn
   }()
    //
    lazy var   btnregister:UIButton = {
        let  abtn = UIButton()
        abtn.backgroundColor = fontcolor
        abtn.setTitle("注册", for: .normal)
        abtn.addTarget(self, action: #selector(LLAcountViewController.register), for: .touchUpInside)
          abtn.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        return  abtn
    }()
    
    //头像
    lazy  var  portraitimg:UIImageView = {
        let  img = UIImageView()
         img.backgroundColor = UIColor.black
        
        return  img
    }()
    //退出按钮
    lazy   var   btnlogout:UIButton = {
        
        let  logout  = UIButton()
        logout.setTitle("退出", for: .normal)
        logout.backgroundColor = fontcolor
        logout.addTarget(self, action: #selector(LLAcountViewController.logout), for: .touchUpInside)
        return  logout
    }()
   
    //下方列表
    
    lazy var   tableview:LLBaseTableView = {
       let   listtable = LLBaseTableView(frame: CGRect.zero,style: .plain)
     
        return  listtable
        
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self
         initialview()
        
         updateview()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
        updateview()
    }
    
    // configheadview
    func updateview()  {
        //无用户
        let   auser = LLCurrentUser.currentuser.user
        
        
        if auser != nil {
        self.btnlogin.isHidden  =  true
        self.btnregister.isHidden = true
        self.btnlogout.isHidden = false
        }
        else{
            self.btnlogin.isHidden  =  false
            self.btnregister.isHidden = false
            self.btnlogout.isHidden = true
        }
        
    }
    func initialview(){
        self.navigationController?.navigationBar.isHidden = true
        view.addSubview(headview)
        headview.backgroundColor = UIColor.gray
        headview.addSubview(self.btnlogin)
        headview.addSubview(self.btnregister)
        headview.addSubview(self.portraitimg)
        headview.addSubview(self.btnlogout)
        view.addSubview(self.tableview)
        self.tableview.delegate = self
         self.tableview.dataSource = self
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.portraitimg.clipsToBounds = true
        self.portraitimg.layer.cornerRadius = 40
        
   
        self.btnlogin.snp.makeConstraints { (maker) in
            maker.width.equalTo(80)
            maker.height.equalTo(30)
            maker.bottom.equalTo(-10)
            maker.left.equalTo((ScreenWidth - 240)/2.0)
            
        }
        
        
        self.portraitimg.snp.makeConstraints { (maker) in
            maker.width.equalTo(80)
            maker.height.equalTo(80)
            maker.centerX.equalTo(headview)
            maker.top.equalTo(25)
        }
        self.btnregister.snp.makeConstraints { (maker) in
            maker.width.equalTo(80)
            maker.height.equalTo(30)
            maker.bottom.equalTo(-10)
             maker.right.equalTo(-(ScreenWidth - 240 )/2.0)
        }
        self.headview.snp.makeConstraints { (maker) in
            maker.top.equalTo(0)
            maker.width.equalTo(ScreenWidth)
            maker.height.equalTo(150)
        }
        self.btnlogout.snp.makeConstraints { (maker) in
            maker.centerX.equalTo(headview)
            maker.width.equalTo(80)
            maker.height.equalTo(30)
            maker.bottom.equalTo(-10)

        }
        
        
        self.tableview.snp.makeConstraints { (maker) in
            maker.width.equalTo(ScreenWidth)
            
            maker.height.equalTo(ScreenHeight  -  199)
            maker.top.equalTo(150)
        }
        updateview()
    }
    func login()  {
        
        
        self.navigationController?.pushViewController(LLLoginViewController(), animated: true)
        
        
    }
    func     register(){
        self.navigationController?.pushViewController(LLRegisterViewController(), animated: true)
        
        
        
    }
    func  logout(){
        
    }
   

}
extension  LLAcountViewController : UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return   1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.listcount.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var  cell = tableview.dequeueReusableCell(withIdentifier: "cell")
        
        if   cell ==  nil {
            
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = listcount[indexPath.row]
        
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    // 页面跳转回调用
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        updateview()
    }
}
