//
//  LLMainTabarController.swift
//  LLTVShow
//
//  Created by lotawei on 17/1/11.
//  Copyright © 2017年 lotawei. All rights reserved.
//

import UIKit

class LLMainTabarController: LLAnimationTabBarController,UITabBarControllerDelegate {
  fileprivate  var  isfirstLoadMaintabarcontroller : Bool =   true
    override func viewDidLoad() {
        delegate = self
        buildMainTabarChildViewController()
    }
    func buildMainTabarChildViewController()  {
        
        tabBarControllerAddChildViewController(LLTVListViewController() , title: "影视", imagename: "Mytv_normal", selectimagename: "Mytv_select", tag: 0)
        tabBarControllerAddChildViewController(LLAcountViewController() , title: "我的", imagename: "MyAcount_normal", selectimagename: "MyAcount_select", tag: 1)
       
        
        
    }
    override  func viewDidAppear(_ animated: Bool) {
     
        if isfirstLoadMaintabarcontroller {
            let   containers = createViewContainers()
            createCustomIcons(containers)
            isfirstLoadMaintabarcontroller = false
        }
    }
    

    
}
extension   LLMainTabarController{
    func tabBarControllerAddChildViewController(_ childView: UIViewController, title: String, imagename: String, selectimagename: String, tag: Int)
    {
        let vcItem = RAMAnimatedTabBarItem(title: title, image: UIImage(named: imagename), selectedImage: UIImage(named: selectimagename))
        vcItem.tag = tag
        /**
         *  设置            动画效果
         
         *
         *  @param rootViewController:childView
         *
         *  @return   有旋转  弹跳  翻转
         */
        
        vcItem.animation = RAMBounceAnimation()
        childView.tabBarItem = vcItem
        
        let navigationVC = BaseNaVgationController(rootViewController:childView)
        addChildViewController(navigationVC)
    }
}


