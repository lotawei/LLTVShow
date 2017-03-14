//
//  LLLoginView.swift
//  LLTVShow
//
//  Created by lotawei on 17/1/18.
//  Copyright © 2017年 lotawei. All rights reserved.
//

import UIKit



class LLLoginView: UIView {
    @IBOutlet weak var txtlogin: TextFieldEffects!
  
    @IBOutlet weak var txtpwd: TextFieldEffects!
    
    @IBOutlet weak var btnlogin: UIButton!
  
     let  activityIndicatorView  = NVActivityIndicatorView(frame: CGRect.zero, type: .semiCircleSpin, color: fontcolor, padding: 1)
    
    
    @IBOutlet weak var brandanimationview: UIView!
    
    
  
    override func layoutSubviews() {
        super.layoutSubviews()
        activityIndicatorView.frame = CGRect(x: (ScreenWidth - 100 )/2.0 , y: 0, width: 100, height: 40)
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addSubview(self.activityIndicatorView)
    }
  
    func checklogin(_ sender: Any) {
        
          var   valid  =  false
         if   txtlogin.text == " "{
            _ = SweetAlert().showAlert("输入的用户名不能为空！")
            return
        }
        if  txtpwd.text == " "{
            _ = SweetAlert().showAlert("请输入密码")
            return
        }
        valid  =  true
        
        let   username = txtlogin.text
        let   pwd = txtpwd.text
        
        if   valid {
            
         
         serverauthrizon(username!,pwd!)
    
        }
        
        
    }
    
    
    // requestusers
   
    func  serverauthrizon(_ name:String , _ pwd:String)  {
        activityIndicatorView.startAnimating()
        weak  var   tmp = self
        BmobUser.loginWithUsername(inBackground: name, password: pwd) { (user, err) in
            tmp?.activityIndicatorView.stopAnimating()
            
            if   err != nil{
               
                _  = SweetAlert().showAlert("登录失败")
                
            }
            
            if    user !=  nil{
                
                 let     curuser = user! as  BmobObject
                 let    name = curuser.object(forKey: "username") as! String
                 let    portrait = curuser.object(forKey: "portrait") as! String
                 let    usertype = curuser.object(forKey: "usertype") as! Int
                 let    substyle = curuser.object(forKey: "substyle") as! Int
                let     locuser  = LLUser.init(name , Usertype(rawValue: usertype)! ,portrait, Substyle(rawValue: substyle)!, isfirst: "no")
                if  (locuser.saveuser()){
                 //  分权限管理的话   是管理员 直有一个界面
                    if  locuser.usertype.rawValue == Usertype.admin.rawValue {
                        UIApplication.shared.delegate?.window??.rootViewController = BaseViewController()
                        UIApplication.shared.delegate?.window??.makeKeyAndVisible()
                    }
                    else{
                    
                        UIApplication.shared.delegate?.window??.rootViewController  = LLMainTabarController()
                         UIApplication.shared.delegate?.window??.makeKeyAndVisible()
                    }
                    
                }
                
                
            }
            
            
        }
        
        
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        btnlogin.backgroundColor =  fontcolor
     
        
        creatblur()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if   !txtlogin.isExclusiveTouch{
            txtlogin.resignFirstResponder()
        }
        if   !txtpwd.isExclusiveTouch{
            txtpwd.resignFirstResponder()
        }
    }
    func   creatblur(){
        //首先创建一个模糊效果
        let blurEffect = UIBlurEffect(style: .regular)
        //接着创建一个承载模糊效果的视图
        let blurView = UIVisualEffectView(effect: blurEffect)
        //设置模糊视图的大小（全屏）
        blurView.frame.size = CGSize(width: self.width, height: self.height)
        let  backimg = UIImageView(frame: blurView.frame)
        backimg.image = #imageLiteral(resourceName: "background")
        blurView.addSubview(backimg)
        //添加模糊视图到页面view上（模糊视图下方都会有模糊效果）
        self.insertSubview(blurView, at: 0)
    }
    
}
extension   LLLoginView:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if   !txtlogin.isExclusiveTouch{
            txtlogin.resignFirstResponder()
        }
        if   !txtpwd.isExclusiveTouch{
            txtpwd.resignFirstResponder()
        }
        return  true
    }
    
    
    
}
