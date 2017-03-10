//
//  BaseViewController.swift
//  LLTVShow
//
//  Created by lotawei on 16/11/27.
//  Copyright © 2016年 lotawei. All rights reserved.
//


//  导航条需要隐藏的    就继承 base 下个页面有跳转的需要在界面消失让导航条显示  不需要隐藏的就继承uiviewcontroller
import UIKit

class BaseViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor =   LLCurrentUser.currentuser.user == nil  ?  normalcolor : LLCurrentUser.currentuser.user.substyle.substylecolor()
        
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        
        self.navigationController?.isNavigationBarHidden   =  false
        
    }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
