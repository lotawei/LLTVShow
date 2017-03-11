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
  
    
    @IBOutlet weak var brandanimationview: UIView!
  
    func checklogin(_ sender: Any) {
        
      UIApplication.shared.delegate?.window??.rootViewController =  LLMainTabarController()
        
       UIApplication.shared.delegate?.window??.makeKeyAndVisible()
        
        //如果要做一个历史记录信息的可以在  登录验证完毕后 存入本地 
        
        
        
        
        
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
