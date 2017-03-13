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
 
    
    func cleancahe()  {
//         取出cache文件夹路径
        let cachePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first
        let testpath  = cachePath?.appending("/test.data")
        
       
        
        //  为了测试呢 就随便写点东西
        let   astrdata = "测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据测试缓存数据"
        let    data = astrdata.data(using: .utf8)
        
        try!  data?.write(to: URL(fileURLWithPath: testpath!))
    
        let files = FileManager.default.subpaths(atPath:cachePath!)
        
        var big = Double();
//         快速枚举取出所有文件名
            for p in files!{
            // 把文件名拼接到路径中
            let path = cachePath!.appendingFormat("/\(p)")
                if  path != userAccountPath  {
            // 取出文件属性
            let floder = try! FileManager.default.attributesOfItem(atPath: path)
            // 用元组取出文件大小属性
            for (abc,bcd) in floder {
            // 只去出文件大小进行拼接
            if abc == FileAttributeKey.size{
              big += (bcd as AnyObject).doubleValue
            }
            }
            }
        }
         let message = String.transformedValue(big as AnyObject)
        SweetAlert().showAlert("确定要删除?", subTitle: message, style: AlertStyle.warning, buttonTitle:"取消", buttonColor:btncolor , otherButtonTitle:  "删除", otherButtonColor: btncolor) { (isOtherButton) -> Void in
            if isOtherButton == true {
                
                
            }
            else {
                for p in files!{
                                // 拼接路径
                                let path = cachePath!.appendingFormat("/\(p)")
                                if  path != userAccountPath {
                                // 判断是否可以删除
                                if(FileManager.default.fileExists(atPath:path)){
                                    // 删除
                                    do{
                                    try FileManager.default.removeItem(atPath: path)
                                     _ =   SweetAlert().showAlert("Deleted!", subTitle: "清理成功", style: AlertStyle.success)
                                    }catch{
                                        
                                    }
                                }
                            }
                }

                
            
            }
        }
        

        
        
        
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
