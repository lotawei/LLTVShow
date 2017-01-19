//
//  LLLoginViewController.swift
//  LLTVShow
//
//  Created by lotawei on 17/1/13.
//  Copyright © 2017年 lotawei. All rights reserved.
//

import UIKit

class LLLoginViewController: BaseViewController {

    var   lview:LLLoginView?
    convenience init() {
        
        var nibNameOrNil = String?("LLLoginViewController")
        
        //考虑到xib文件可能不存在或被删，故加入判断
        
        if Bundle.main.path(forResource: nibNameOrNil, ofType: "xib") == nil
            
        {
            
            nibNameOrNil = nil
            
        }
        
        self.init(nibName: nibNameOrNil, bundle: Bundle.main)
        
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //加载自定义的登录view
        layview()
    }
     func layview(){
      let    lview = LLLoginView.newInstance()
      view = lview!
      view.backgroundColor = UIColor.black
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.backgroundColor = lgbackcolor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
