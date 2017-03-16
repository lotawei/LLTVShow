//
//  LLSelctAddressViewController.swift
//  LLTVShow
//
//  Created by lotawei on 17/3/15.
//  Copyright © 2017年 lotawei. All rights reserved.
//

import UIKit
class LLSelctAddressViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildNavigationItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
       
    }
    
    // MARK: - Build UI
    private func buildNavigationItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem.barButton(title: "扫一扫", titleColor: UIColor.black,
                                                                     image: UIImage(named: "icon_black_scancode")!, hightLightImage: nil,
                                                                     target: self, action: #selector(LLSelctAddressViewController.leftItemClick), type: ItemButtonType.Left)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.barButton(title: "搜 索", titleColor: UIColor.black,
                                                                      image: UIImage(named: "icon_search")!,hightLightImage: nil,
                                                                      target: self, action: #selector(LLSelctAddressViewController.rightItemClick), type: ItemButtonType.Right)
        
       
       
    }
    
    // MARK:- Action
    // MARK: 扫一扫和搜索Action
    func leftItemClick() {
        
    }
    
    func rightItemClick() {
        // 搜索
        
    }
    
    func titleViewClick() {
       
    }
}
