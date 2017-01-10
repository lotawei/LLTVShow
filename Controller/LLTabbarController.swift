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
    

}
