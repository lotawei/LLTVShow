//
//  LLUser.swift
//  LLTVShow
//
//  Created by lotawei on 16/11/27.
//  Copyright © 2016年 lotawei. All rights reserved.
//
import UIKit

// 为其扩展一个 颜色基调类
extension   Substyle{
    func substylecolor() -> UIColor {
        switch self.rawValue {
        case 0:
            return  normalcolor
        case 1:
            return   darkcolor
        case 2:
            return   eyecolor
        default:
            return  normalcolor
        }
    }
}
//分为普通用户,vip ,管理员(管理员用于接受反馈信息)
enum Usertype:Int {
    case normal,vip, admin  //服务器对应 0 1 2
}
//主题类型
enum   Substyle:Int {
    case normal,dark, eyeprotect //正常,黑夜,护眼 0 1 2
}

class LLUser: NSObject ,NSCoding{
    //昵称
    var   username:String!
    //用户类型
    var   usertype:Usertype!
    //用户头像 自定义的话存的就是路径 未自定义就是 asset 的图片
    var   portrait:String!
    //主题类型
    var   substyle:Substyle!
    //用户第一次使用本app  是的话可能就要打广告了
    var   isfirst:String!
    func encode(with aCoder: NSCoder) {
        aCoder.encode(username, forKey:"name")
        aCoder.encode(usertype.rawValue, forKey: "usertype")
        aCoder.encode(portrait, forKey: "portrait")
        aCoder.encode(substyle.rawValue, forKey: "substyle")
        aCoder.encode(isfirst, forKey: "isfirst")
   }
    
    
    override var description: String {
                 let properties = ["name":username, "usertype":usertype,"portrait":portrait,"substyle":substyle,"isfirsst":isfirst] as [String : Any]
        
                 return "\(properties)"
            }
    required  init?(coder aDecoder: NSCoder) {
        super.init()
        username =  aDecoder.decodeObject(forKey: "name") as!  String
        
        isfirst = aDecoder.decodeObject(forKey: "isfirst") as!  String
        portrait = aDecoder.decodeObject(forKey: "portrait") as! String
        usertype = Usertype(rawValue: Int(aDecoder.decodeInt32(forKey: "usertype")))
        substyle = Substyle(rawValue: Int(aDecoder.decodeInt32(forKey: "substyle")))
    }
    init( _ name:String,_ usertype:Usertype,_ portrait:String, _ substyle:Substyle,isfirst:String) {
        self.username = name
        self.usertype = usertype
        self.portrait = portrait
        self.substyle = substyle
        self.isfirst = isfirst
    }
}
//扩展一个归档
extension   LLUser{
    //    存储用户信息
    func  saveuser() ->  Bool{
        let   result = NSKeyedArchiver.archiveRootObject(self, toFile:userAccountPath)
        if    result {
            LLCurrentUser.currentuser.user =  self
        }
        
        
        
        return result
    }
    //  清理用户信息
    func   cleanuser()  {
        
        if(FileManager.default.fileExists(atPath:userAccountPath)){
            // 删除
            try! FileManager.default.removeItem(atPath: userAccountPath)
        }
        
        LLCurrentUser.currentuser.user =  nil
        
    }
    
    //  在用户设置头像时更改路径
    func changeportrait(path:String)  {
        if  path != ""{
         self.portrait = path
        }
    }
    //  扩展一个方法 判断用户是否设置了头像
    
    func alreadysetportrait() -> Bool {
        if   self.portrait == "default" || self.portrait == "flat" {
            
            
            return   false
        }
     
        return   true
    }
    
    
}


