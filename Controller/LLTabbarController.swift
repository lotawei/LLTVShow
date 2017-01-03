//
//  LLTabbarController.swift
//  LLTVShow
//
//  Created by lotawei on 16/12/12.
//  Copyright © 2016年 lotawei. All rights reserved.
//

import UIKit

class LLTabbarController: UITabBarController{

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
       
    }
    override func awakeFromNib() {
        super.awakeFromNib()

        
        setimgback()
    }
    
    func setimgback()  {
   
        tabBar.clipsToBounds =  true
        tabBar.backgroundImage = #imageLiteral(resourceName: "barback")
     
 
        
    }
    
    
//    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
//    
//    UIGraphicsBeginImageContext(rect.size);
//    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
//    
//    CGContextFillRect(context, rect);
//    
//    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
//    
//    UIGraphicsEndImageContext();
//    
//    [self.tabBar setBackgroundImage:img];
//    
//    [self.tabBar setShadowImage:img];
//    
//    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbarbg3.jpg"]];
//    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6)
//    
//    {
//    
//    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
//    
//    }

}
