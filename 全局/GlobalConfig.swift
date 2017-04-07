//
//  GlobalConfig.swift
//  LLTVShow
//
//  Created by lotawei on 16/11/27.
//  Copyright © 2016年 lotawei. All rights reserved.
//

import UIKit
//


let  tvurl="https://route.showapi.com/951-1?showapi_appid=32615&showapi_timestamp=20170224154502&showapi_sign=e80620ed9e23a51d1223dcca7032a9f9"
//屏幕宽高度  尺寸常用
let kItemMargin : CGFloat = 10
let kHeaderViewH : CGFloat = 50
let kNormalItemW = (ScreenWidth - 3 * kItemMargin) / 2
let kNormalItemH = kNormalItemW * 3 / 4
let NormalCellID = "NormalCellID"
let SearchCellID = "SearchCellID"
let HeaderViewID = "HeaderViewID"

let kStatusBarH: CGFloat = 20
let kNavigationBarH: CGFloat = 44
let kTabBarH: CGFloat = 49
let   ScreenWidth = UIScreen.main.bounds.size.width
let   ScreenHeight = UIScreen.main.bounds.size.height
//云数据库appkey
let   bmobappkey  = "6ddcdd50e7d7e32e67aec881b8585e4b"

//全局主题变化的通知
let   StyleNotifyChange = "StyleNotifyChange"

//获取app版本号及 ios 版本号
let infoDictionary = Bundle.main.infoDictionary
let appDisplayName: AnyObject? = infoDictionary!["CFBundleDisplayName"] as AnyObject?
let majorVersion : AnyObject? = infoDictionary! ["CFBundleShortVersionString"] as AnyObject?
let minorVersion : AnyObject? = infoDictionary! ["CFBundleVersion"] as AnyObject?
let appversion = majorVersion as! String
let iosversion : NSString = UIDevice.current.systemVersion as NSString   //ios 版本
let identifierNumber = UIDevice.current.identifierForVendor   //设备 udid
let systemName = UIDevice.current.systemName   //设备名称
let model = UIDevice.current.model   //设备型号
let localizedModel = UIDevice.current.localizedModel   //设备区域化型号





//整个app颜色基调
let   normalcolor:UIColor = UIColor(red: 244, green: 244, blue: 244, alpha: 1.0)
//黑夜模式
let   darkcolor:UIColor = UIColor(red: 244, green: 244, blue: 244, alpha: 1.0)
//护眼模式
let   eyecolor:UIColor = UIColor(red: 246, green: 246, blue: 246, alpha: 1.0)
//蓝色
var   lgbackcolor:UIColor = UIColor(red: 6/255.0, green: 131/255.0, blue: 177/255.0, alpha: 1.0)
//按钮 颜色
var   btncolor:UIColor = UIColor(red: 200.0/255.0, green:250.0/255.0, blue: 253.0/255.0, alpha: 0.5)
//字体颜色
var   fontcolor:UIColor =  UIColor(red: 171.0/255.0, green:129.0/255.0, blue: 59.0/255.0, alpha: 0.8)

//用户存储路经
 let userAccountPath = "\(NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.userDomainMask,true).first!)/user.data"
//用户缓存路径 包括 头像图片资源 和 收藏影视 路径
 let userCachePath = "\(NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first!)/"

//


//列表 中 的通知  object  发的字符串

let   LLPOSTmsg = "我的消息"
let   LLPOSTLevelUpVip =  "升级会员"
let   LLPOSTIntersting = "猜你喜欢"
let   LLPOSTSubstyle = "主题皮肤"
let   LLPOSDarkStyle = "夜间模式"
let   LLPOSLightStyle = "正常模式"
let   LLPOSTShare = "分享"
let   LLPOSTClean = "清理缓存"
let   LLPOSTAbout = "关于"
//

// 制定通知

let notificationName =  "notifystyle"
let notificationSelect =  "notifyselect"
let   NOTIfyCenter = NotificationCenter.default

//




