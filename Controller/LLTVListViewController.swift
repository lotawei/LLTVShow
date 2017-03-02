//
//  LLTVListViewController.swift
//  LLTVShow
//
//  Created by lotawei on 17/2/10.
//  Copyright © 2017年 lotawei. All rights reserved.
//

import UIKit

class LLTVListViewController: BaseViewController {
    
    
    var   img = UIImageView(frame: CGRect(x:100,y:200,width:80,height:90))
    //  搜索条
    lazy   var  searchbar:UISearchBar = {
       let     searchbar = UISearchBar(frame: CGRect(x: 0, y: 20, width: ScreenWidth, height: 30))
       
        
        return   searchbar
    }()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(self.img)
        let   manager = LLAuthManager.init("http://open.moretv.com.cn/moviesite", .get, nil)
        
        
       
    }
    
//    func  test(){
//     let  sem =    DispatchSemaphore.init(value: 0)
//        
//     let   quene = DispatchQueue.init(label: "one")
//        quene.async {
//            for    i in  0...10{
//                print(i)
//            }
//            sem.signal()
//        }
//        sem.wait()
//        for    i in  11...21{
//            print(i)
//        }
//    }
}


