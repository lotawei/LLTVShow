//
//  BaseNaVgationController.swift
//  LLTVShow
//
//  Created by lotawei on 16/11/27.
//  Copyright © 2016年 lotawei. All rights reserved.
//)

import UIKit

class BaseNaVgationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
       //初始化nav
        
        setNaviBack()
        
    }
    
    func setNaviBack(){
    
        
  
    let  navigationBar = UINavigationBar.appearance()
    //去掉线
     
    
    navigationBar.tintColor = fontcolor
    //返回按钮的箭头颜色
        //字体颜色
        navigationBar.titleTextAttributes = [NSFontAttributeName:UIFont.systemFont(ofSize: 18),NSForegroundColorAttributeName:fontcolor]

//
        let buttonItem =  UIBarButtonItem.appearance(whenContainedInInstancesOf: [UINavigationBar.classForCoder() as! UIAppearanceContainer.Type])
        
        let offset:UIOffset = UIOffset(horizontal: -500, vertical: -500)
    
  
        buttonItem.setBackButtonTitlePositionAdjustment(offset, for: .default)

    
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationBar.setBackgroundImage(nil, for: .default)
        navigationBar.shadowImage = nil
//        [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//        [self.navigationController.navigationBar setShadowImage:[UIImage new]];
        
    }
    
    //这里可以更导航条颜色
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationBar.setBackgroundImage(imagewithcolor(color: UIColor.white), for: .default)
        navigationBar.shadowImage = UIImage()
//        [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//        [self.navigationController.navigationBar setShadowImage:[UIImage new]];
        
        
    }
    // 半透明背景
    func imagewithcolor(color:UIColor) -> UIImage {
        let  rect =  CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        //上下文
        UIGraphicsBeginImageContext(rect.size)
        
        let   context  = UIGraphicsGetCurrentContext()
        
        context!.setFillColor(color.cgColor)
        context?.fill(rect)
        //从上下文获取图片
        let   theimage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
        
        return   theimage!
    }
    
 
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
