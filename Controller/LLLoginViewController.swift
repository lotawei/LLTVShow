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
        
  
     
        
       
    }
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
        createbandanimation()
        
    }
    
  
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden   =  false
    }
    //创建动画
   private func createbandanimation()  {
    for lay in self.view.layer.sublayers! {
        if lay.isKind(of: ZYAnimationLayer.classForCoder()) {
            lay.removeFromSuperlayer()
        }
    }
    let   logview = self.view  as!  LLLoginView
    ZYAnimationLayer.createAnimationLayer(with: "welcome", andRect: logview.brandanimationview.bounds, andView: logview.brandanimationview, andFont: UIFont.systemFont(ofSize: 15), andStroke: fontcolor)
    }
 
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
