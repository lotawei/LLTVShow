//
//  LLTabbarController.swift
//  LLTVShow
//
//  Created by lotawei on 16/12/12.
//  Copyright © 2016年 lotawei. All rights reserved.
//

import UIKit

class LLTabbarController: UITabBarController,UITabBarControllerDelegate {
    @IBOutlet weak var tabbar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func awakeFromNib() {
        
        super.awakeFromNib()
        self.delegate = self
        tabbar.frame =  CGRect(x: 0, y: 0, width: 200, height: 100)
        
    }
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        
       
        
        return  nil
    
   }
}
