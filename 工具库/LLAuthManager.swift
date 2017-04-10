//
//  LLAuthManager.swift
//  LLTVShow
//
//  Created by lotawei on 17/2/27.
//  Copyright © 2017年 lotawei. All rights reserved.
//

import UIKit
protocol requestDataPro {
    func getdata(data:[String:Any])
    
}
//电视节目pai
private  let  tvappkey = "b199f821a6285e32761ae5d3fdfa77a3"
private  let  tvappurl = "http://japi.juhe.cn/tv/getCategory"




//电视猫api

private let Authcodeurl = "http://open.moretv.com.cn/authorize"
private let Tokenurl = "http://open.moretv.com.cn/get_access_token"
private let  appid = "6989a62a22ad4677d14e3159228d5348"
private let  scret = "f33abd6c0aaa453eaf170410113ede92"
typealias   DataBlock = (_ data:DataResponse<Any>) -> Void
class  LLAuthManager:NSObject{
    
//    以逃逸闭包的方式传出去

  
    
    //默认 一个静态 方法
    static   func  Authorizon(_ url:URLConvertible, datablock: DataBlock?) {
       
        
       
        
        
        if datablock  != nil {
            request(Authcodeurl,method:.get, parameters: ["appid":appid])
                .responseJSON {  (aJSON) in
                
                  
                    if   aJSON.result.value != nil{
                        
                        let   jsondata  = aJSON.result.value  as! [String:Any]
                        if   jsondata["status"] as! String == "200"{
                            //表示能拿到authcoe
                            let authcode = jsondata["authorize_code"] as!  String
                            //  获取token  appid   secrete   +  验证值
                            let  key = appid+"_"+scret+"_"+"\(authcode)"
                            let   md5key = String.MD5(str:key)
                            
                            
                            request(Tokenurl, method: .get, parameters:["authorize_code":authcode,"key":md5key])
                                .responseJSON {  (bJSON) in
                                  
                                    
                                    if   bJSON.result.value != nil{
                                        let   jsondata  = bJSON.result.value  as! [String:Any]
                                        let   strtoken =   jsondata["access_token"] as?  String
                                    
                                        
                                        
                                        if   strtoken != nil{
                                            
                                            request(url,method:.get, parameters:["access_token":strtoken!])
                                                .responseJSON {  (cJSON) in
                                                  
                                                  
                                                    datablock!(cJSON)
                                                    
                                                    
                                            }
                                            
                                        }
                                        else{
                                          print("获取token失败")
                                            
                                        }
                                    
                                    }
                                    else{
                                       print("你好像未连接网络")
                                    }
                                        
                                    
                            }
                            
                        }
                        else{
                            
                            print("服务器认证失败")
                            
                        }
                    }
                    else{
                        print("你可能需要检查网络或设置允许数据")
                    }
                        
                        
                    }
            

            
            
            
        }
        
        
    
    
    
    }
    
    
//    override init() {
//        
//        super.init()
////        authentication()
//        
//        
//    }
//    
//    // 认证
//    func authentication()  {
//        
//        
//        
//        request(Authcodeurl,method:.get, parameters: ["appid":appid])
//            .responseJSON {  (JSON) in
//                weak  var  temself = self
//                
//                if   JSON.result.value != nil{
//
//                let   jsondata  = JSON.result.value  as! [String:Any]
//                if   jsondata["status"] as! String == "200"{
//                    //表示能拿到authcoe
//                    let authcode = jsondata["authorize_code"] as!  String
//                    temself!.getjsondata(authcode: authcode)
//                }
//                else{
//                    
//                    _ =  SweetAlert().showAlert("服务器认证失败")
//                    
//                }
//                }
//                else{
//                     _ =  SweetAlert().showAlert("你好像未连接网络")
//                }
//        }
//    }
//    
//    
//    
//    //验证token
//      func   getjsondata(authcode:String){
// 
//        //  获取token  appid   secrete   +  验证值
//        let  key = appid+"_"+scret+"_"+"\(authcode)"
//        let   md5key = key.MD5
//        request(Tokenurl, method: .get, parameters:["authorize_code":authcode,"key":md5key])
//            .responseJSON {  (JSON) in
//                if   JSON.result.value != nil{
//                let   jsondata  = JSON.result.value  as! [String:Any]
//                let   strtoken =   jsondata["access_token"] as?  String
//                weak  var  tempself = self;
//                
//                
//                if   strtoken != nil{
//                    
//                    request(tempself!.cururl,method:tempself!.method!, parameters:["access_token":strtoken!])
//                        .responseJSON {  (JSON) in
//                            
//                            let   jsondata  = JSON.result.value  as! [String:Any]
//                            print(jsondata)
//                          
//                    }
//            
//                }
//                else{
//                    _ =  SweetAlert().showAlert("获取token失败")
//                    
//                }
//                }
//                else{
//                     _ =  SweetAlert().showAlert("你好像未连接网络")
//                }
//                
//        }
//    }
//    
    
    
    
    //                                        request("http://img7.moretv.com.cn/d.ifengimg.com/w200_h150/y0.ifengimg.com/image/2013/10/31/7eeb80c2-0d43-412c-88ce-ba130ca2980b.jpg",method:tempself!.method!, parameters:["access_token":strtoken!]).responseData(completionHandler: { (data) in
    //                                            let   img   = UIImage.init(data: data.result.value!)
    //                                        })
    ////                                            .responseJSON {  (JSON) in
    ////
    ////                                                let   jsondata  = JSON.result.value  as! [String:Any]
    ////                                                print(jsondata)
    ////
    ////
    ////
    ////                                        }
    deinit {
         print("LLaUTH  DE INIT")
    }
    
}


