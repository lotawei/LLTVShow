//
//  GlobalConfig.swift
//  LLTVShow
//
//  Created by lotawei on 16/11/27.
//  Copyright © 2016年 lotawei. All rights reserved.
//

import UIKit
//屏幕宽高度
let   ScreenWidth = UIScreen.main.bounds.size.width
let   ScreenHeight = UIScreen.main.bounds.size.height
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

//用户存储路经
 let userAccountPath = "\(NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.userDomainMask,true).first!)/user.data"




