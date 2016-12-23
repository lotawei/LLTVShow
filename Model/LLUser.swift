//
//  LLUser.swift
//  LLTVShow
//
//  Created by lotawei on 16/11/27.
//  Copyright © 2016年 lotawei. All rights reserved.
//

import UIKit
//分为普通用户,vip ,管理员(管理员用于接受反馈信息)
enum Usertype:Int {
    case normal,vip, admin
}
//主题类型
enum   Substyle:Int {
    case normal,dark, eyeprotect //正常,黑夜,护眼
}
class LLUser: NSObject ,NSCoding{
    //昵称
    var   name:String!
    //密码
    var   psd:String!
    //状态
    var   islogin:Bool!
    //用户类型
    var   usertype:Usertype!
    //用户头像
    var   portrait:String!
    //主题类型
    var   substyle:Substyle!
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey:"name")
        aCoder.encode(psd, forKey:"psd")
        aCoder.encode(islogin, forKey: "login")
        aCoder.encode(usertype, forKey: "usertype")
        aCoder.encode(portrait, forKey: "portrait")
        aCoder.encode(substyle, forKey: "substyle")
   }
    required  init?(coder aDecoder: NSCoder) {
        super.init()
        name =  aDecoder.decodeObject(forKey: "name") as!  String
        psd = aDecoder.decodeObject(forKey: "psd") as! String
        islogin = aDecoder.decodeBool(forKey: "login")
        portrait = aDecoder.decodeObject(forKey: "portrait") as! String
        usertype = Usertype(rawValue: Int(aDecoder.decodeInt32(forKey: "usertype")))
        substyle = Substyle(rawValue: Int(aDecoder.decodeInt32(forKey: "substyle")))
    }
}
//扩展一个归档
extension   LLUser{
    //    存储用户信息
    func  saveuser() ->  Bool{
        return  NSKeyedArchiver.archiveRootObject(self, toFile:userAccountPath)
    }
    
}


