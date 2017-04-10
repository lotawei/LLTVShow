//
//  LLContegeryRecItem.swift
//  LLTVShow
//
//  Created by lotawei on 17/4/6.
//  Copyright © 2017年 lotawei. All rights reserved.
//

import UIKit
//  不同类型的内容推荐
typealias MovieItemBlock = (_ result:[LLCategoryRecItem] ) -> Void
class LLCategoryRecItem: NSObject {

    var  item_director:[JSON]!//导演
    var   item_cast:[JSON]!//主演
    var   item_tag:[JSON]!//标签
    var   item_guest:[JSON]!
    var   item_host:[JSON]!
    var   item_area:String!//地区
    
    
    
    var item_contentType:String!//影片类型
    var   item_score:String! //评分
    
    var   link_data:String!
    
    
    var   item_episode:String!
    var   item_icon1:String! //影片图片
    
    var   item_isHd:String!
    var   item_year:String!//年份
    var   item_title:String!//名称
    func displaydirector() -> String{
        var   directors = ""
        for  str in item_director {
           
             directors.append(str.string!)
             directors.append(" ")
            
        }
        if  directors.characters.count == 0 {
            directors = "不详"
        }
        return  directors

    }
    
    func displaytag() -> String{
        var   tags = ""
        let   count  = item_tag.count
        if  count == 0 {
            
            return  "未知"
            
        }
        else {
            var   i = 0
            for  str in item_tag {
                tags.append(" ")
                tags.append(str.string!)
                
                i = i + 1
                if   i >= 3 {
                    tags.append(" ")
                    tags.append("其它")
                    break
                }
                
            }
            
        }
        
        
        return  tags
        
    }
    func displaycast() -> String{
        var   casts = ""
        let   count  = item_cast.count
        if  count == 0 {
            
            return  "不详"
            
        }
        else {
            var   i = 0
            for  str in item_cast {
            
                casts.append(str.string!)
                casts.append(" ")
                i = i + 1
                if   i >= 3 {
                     casts.append("更多")
                    break
                }
                
            }
            
        }
        
    
        return  casts
        
    }
    
    
    //http://open.moretv.com.cn/position/:code
    
    //    "item_contentType" : "movie",
    //    "item_director" : [
    //    "邓肯·琼斯"
    //    ],
    //    "item_score" : "7.8",
    //    "item_cast" : [
    //    "崔维斯·费米尔",
    //    "托比·凯贝尔",
    //    "宝拉·巴顿",
    //    "吴彦祖",
    //    "本·福斯特",
    //    "多米尼克·库珀",
    //    "鲁丝·内伽",
    //    "克兰西·布朗",
    //    "丹尼尔·库德摩尔",
    //    "罗伯特·卡辛斯基",
    //    "本·施耐泽",
    //    "格伦·克洛斯",
    //    "考乐姆·吉斯·雷尼",
    //    "泰瑞·诺塔里",
    //    "瑞安·罗宾斯",
    //    "博尔克利·杜菲尔德",
    //    "丹·佩恩",
    //    "迪伦·肖明",
    //    "唐尼·麦克尼尔",
    //    "迈克·安东纳科斯",
    //    "拉吉·拉尔"
    //    ],
    //    "link_data" : "page=detail&sid=fhu9stqtd4n8&contentType=movie",
    //    "item_guest" : [
    //
    //    ],
    //    "item_tag" : [
    //    "动作",
    //    "奇幻",
    //    "冒险"
    //    ],
    //    "item_episode" : "0",
    //    "item_icon1" : "http:\/\/img1.moretv.com.cn\/pic.tvmore.com.cn\/20161008\/20161008100314290.jpg",
    //    "item_host" : [
    //
    //    ],
    //    "item_episodeCount" : "99999999",
    //    "item_isHd" : "0",
    //    "item_sid" : "",
    //    "item_year" : "2016",
    //    "item_title" : "魔兽",
    //    "item_area" : "美国 | 中国大陆 | 加拿大"
    //}
 
    static  func GetMovieItems(_ data:DataResponse<Any>,_ result:@escaping MovieItemBlock){
        
    
         let   jsondata  =  JSON(data: data.data!)
        var   recitems:[LLCategoryRecItem] = [LLCategoryRecItem]()
        let   items = jsondata["position"]["positionItems"].array
        for  item in items!{
                
        let  aitem = LLCategoryRecItem()
                
                aitem.item_tag = item["item_tag"].array
                aitem.item_area = item["item_area"].string
                aitem.item_cast = item["item_cast"].array
                aitem.item_director = item["item_director"].array
            
            

                aitem.item_guest = item["item_guest"].array
                aitem.item_host = item["item_host"].array
                
                aitem.link_data = item["link_data"].string
                aitem.item_contentType = item["item_contentType"].string
                aitem.item_score = item["item_score"].string
                aitem.item_episode = item["item_episode"].string
                aitem.item_icon1 = item["item_icon1"].string
           
                aitem.item_year = item["item_year"].string == "0" ? "未知":item["item_year"].string
        
            
                aitem.item_isHd = item["item_isHd"].string
                aitem.item_title = item["item_title"].string
                
                recitems.append(aitem)
           }
            
            
            
            result(recitems)
        
        
        
        
        
    }
    
    
    
    
}
