//
//  LLWeatherInfo.swift
//  LLTVShow
//
//  Created by lotawei on 17/4/7.
//  Copyright © 2017年 lotawei. All rights reserved.
//

import UIKit

class LLWeatherInfo: NSObject {
    
    typealias WeatherBlock  = (_ result:LLWeatherInfo) -> Void
    var   img1:String!
    var   city:String!
    //温度
    var  temp1:String!
   
    //天气描述
    var   wetherdisc:String!
    
    static   func    getweather(_  result:@escaping WeatherBlock){
        //新浪http://www.bejson.com/tools/tianqi.html
        
        request("https://api.seniverse.com/v3/weather/now.json?key=nieue2vqqgzc5dup&location=chengdu&language=zh-Hans&unit=c",method:.get, parameters:nil).responseJSON { (data) in
            
            let  jsondata =  JSON(data: data.data! )
            
            //阴   多云  阵雨   默认
            
            
            
            let   weather = LLWeatherInfo()
            if  let  acity = jsondata[0]["location"]["name"].string {
                weather.city = acity
                
            }
            if  let  atemp = jsondata[0]["now"]["temperature"].string {
                weather.temp1 = atemp + "℃"
                
                
            }
            if   let  awetherdisc  = jsondata[0]["now"]["text"].string{
                
                weather.wetherdisc = awetherdisc
            }
            result(weather)
            
            
            
            
        }
        
    }
    
    

}
