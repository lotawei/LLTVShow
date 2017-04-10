//
//  LLContenCategory.swift
//  LLTVShow
//
//  Created by lotawei on 17/3/16.
//  Copyright © 2017年 lotawei. All rights reserved.
//

import UIKit

class LLContenCategory: NSObject {
    // {
//    "status": "200",
//    "message": "success",
//    "data": [
//    {
//    "icon": "http://www.moretv.com.cn/img/icon/movie.jpg",
//    "code": "movie",
//    "link_data": "page=list&contentType=movie&type=0",
//    "title": "电影"
//    }
//   }
//
    
   
    
    
    typealias CategoryResult = (_ categories:[LLContenCategory]?) ->  Void
    var   iconurl:String = ""
    var   code:String!
    var  link_data:String!
    var   title:String!
    func  changeicon(){
        switch title {
        case "电影":
           iconurl = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1491497438224&di=b0262eeb0e6d93c2e664a2012da041fc&imgtype=0&src=http%3A%2F%2Fbbs.fevte.com%2Fdata%2Fattachment%2Fforum%2F201403%2F31%2F155419ta744mxemnmmwle7.jpg"
            break;
        case "电视剧":
            iconurl = "https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1491646722&di=a725343a137d7c3fce10aec37c6503cc&src=http://z.k1982.com/design_img/201307/20130723184653233.jpg"
             break;
        case  "综艺":
            iconurl = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1491497357257&di=072046ea07680ecff5e579575b2c321a&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F14%2F60%2F99%2F52Z58PICb8u_1024.jpg"
             break;
        case  "少儿":
            iconurl = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1491497506254&di=9b9e6d629957cb35edcea7967dcc855f&imgtype=0&src=http%3A%2F%2Fpic16.photophoto.cn%2F20100921%2F0020033064277064_b.jpg"
            break;
        case  "动漫":
            iconurl = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1491497548473&di=2b7ee7fd637ac12965c482d0fea3a236&imgtype=0&src=http%3A%2F%2Fi0.hdslb.com%2Fbfs%2Farchive%2F9f69b5018757c77db8d95fb0d541c3d401b47aa4.jpg"
            break;
        case  "戏曲":
            iconurl = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1492092316&di=3ce4201af5d9d6476e75711a1d470b60&imgtype=jpg&er=1&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01e0a5566d819a6ac7256b29f9c52f.jpg"
            break;
        case  "热门视频":
           iconurl = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1491497641248&di=a9464b47748594386cbe6bd04fcedf56&imgtype=0&src=http%3A%2F%2F91.gdown.baidu.com%2Fimg%2F0%2F512_512%2Ffcfcbb7752e9703ce197400ebfe0b7b2.png"
            break;
        case  "纪实":
            iconurl = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1491497674323&di=60cba9ce6ea7157dc46f12520076fce0&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F14%2F60%2F65%2F37358PICmU6_1024.jpg"
            break;
        case  "音乐":
            iconurl = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1491497706943&di=3faa7fa973e9aa19b11fe19d8750ae53&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F14%2F86%2F05%2F81B58PICpvI_1024.jpg"
            break;
            
        case  "直播":
            iconurl = "http://img.25pp.com/uploadfile/soft/images/2015/0724/20150724031211421.jpg@140w_140h"
              title = "直播"
            break;
        default:
           title = "其他"
            iconurl = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1492092471&di=297a66ebe07ab99bd4d6435df04df630&imgtype=jpg&er=1&src=http%3A%2F%2Fimg1.qq.com%2Fjoke%2Fpics%2F12712%2F12712548.jpg"
            break;
            
        }
        
        
    }
    
    static  func  GetContenCategory(_ data:DataResponse<Any>,_  result:@escaping CategoryResult){
   
        let   jsondata  =  JSON(data: data.data!)

        var   categeries:[LLContenCategory] = [LLContenCategory]()
        
        //快速解析
        let    arr = jsondata["data"].array
        for  ar  in arr! {
            let   dic = ar.dictionary
            let   categery = LLContenCategory()
            categery.code = dic?["code"]?.string
          
            categery.link_data = dic?["link_data"]?.string
            categery.title = dic?["title"]?.string
            categery.changeicon()
            categeries.append(categery)
            
            
        }
        
        result(categeries)
        
        
        
    }
    
}
//  按 接口分类解析 数据
