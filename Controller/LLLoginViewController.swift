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
        
        navigationController?.navigationBar.isHidden = false
        view.backgroundColor = fontcolor
        if  navigationController != nil{
            title = "登录"
            tabBarController?.tabBar.isHidden =  true
        }
    }
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        createbandanimation()
    }
   
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
      tabBarController?.tabBar.isHidden =  false
         navigationController?.navigationBar.isHidden = true
    }
    //创建动画 默认时长  3.0
   private func createbandanimation()  {
    for lay in view.layer.sublayers! {
        if lay.isKind(of: ZYAnimationLayer.classForCoder()) {
            lay.removeFromSuperlayer()
        }
    }
    let   logview = view  as!  LLLoginView
    ZYAnimationLayer.createAnimationLayer(with: "welcome", andRect: logview.brandanimationview.bounds, andView: logview.brandanimationview, andFont: UIFont.systemFont(ofSize: 15), andStroke: fontcolor)
    }
 
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
