//
//  LLCurrentUser.swift
//  LLTVShow
//
//  Created by lotawei on 16/12/15.
//  Copyright © 2016年 lotawei. All rights reserved.
//

import UIKit
 
class LLCurrentUser: NSObject {
    static  var   currentuser:LLCurrentUser!
    //归档路径
  
       var    user:LLUser!
       class   func    shareuser() -> LLCurrentUser{
        
        
        if   currentuser == nil{
            
            currentuser = LLCurrentUser()
            
//             NSKeyedArchiver.archiveRootObject(userModel!, toFile:userAccountPath) //guidang
            //解档  先拿用户
            
            if NSKeyedUnarchiver.unarchiveObject(withFile:userAccountPath) != nil {
                
                
                
                currentuser.user = NSKeyedUnarchiver.unarchiveObject(withFile:userAccountPath) as?  LLUser
                
                
                
                
            }
            
            
            
            return   currentuser
        }
        return  currentuser
    }

}
