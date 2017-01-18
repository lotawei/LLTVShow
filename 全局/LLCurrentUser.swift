//
//  LLCurrentUser.swift
//  LLTVShow
//
//  Created by lotawei on 16/12/15.
//  Copyright © 2016年 lotawei. All rights reserved.
//
import UIKit
class LLCurrentUser: NSObject {
    static  var   currentuser:LLCurrentUser  = LLCurrentUser()
    var    user:LLUser!
    override init() {
        if NSKeyedUnarchiver.unarchiveObject(withFile:userAccountPath) != nil {
            self.user = NSKeyedUnarchiver.unarchiveObject(withFile:userAccountPath) as?  LLUser
        }
    }
    
}

