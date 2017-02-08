//
//  BaseNaVgationController.swift
//  LLTVShow
//
//  Created by lotawei on 16/11/27.
//  Copyright © 2016年 lotawei. All rights reserved.
//

import UIKit

class BaseNaVgationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
       //初始化nav
        
        setNaviBack()
        
    }
    
     func setNaviBack(){
    
    let  navigationBar = UINavigationBar.appearance()
    navigationBar.tintColor = fontcolor
    //返回按钮的箭头颜色
    
//    [navigationBar setTintColor:[UIColor colorWithRed:0.984 green:0.000 blue:0.235 alpha:1.000]];
    
    //设置返回样式图片
       
//    let buttonItem = [UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil];
//    
        let buttonItem =  UIBarButtonItem.appearance(whenContainedInInstancesOf: [UINavigationBar.classForCoder() as! UIAppearanceContainer.Type])
        
        let offset:UIOffset = UIOffset(horizontal: -500, vertical: -500)
    
  
    buttonItem.setBackButtonTitlePositionAdjustment(offset, for: .default)
//    [buttonItem setBackButtonTitlePositionAdjustment:offset forBarMetrics:UIBarMetricsDefault];
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
