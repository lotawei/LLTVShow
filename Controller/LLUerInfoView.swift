//
//  LLUerInfoView.swift
//  LLTVShow
//
//  Created by lotawei on 17/3/13.
//  Copyright © 2017年 lotawei. All rights reserved.
//

import UIKit

protocol   LLUerInfoViewProDelegate {
    //  0 看过  1  收藏 2 资料
    func  selectindexitem(index:Int)
    
    
}


class LLUerInfoView: UIView {
    var   delegate:LLUerInfoViewProDelegate?
    @IBOutlet weak var lblwatched: UILabel!
    @IBOutlet weak var lblcollected: UILabel!
    
    
    //点击观看的
    @IBAction func btnwatch(_ sender: Any) {
        if   delegate  != nil {
            
            self.delegate?.selectindexitem(index: 0)
            
        }
        
    }
    //点击收藏的
    
    @IBAction func btnlistcollect(_ sender: Any) {
        
        if   delegate  != nil {
            
            self.delegate?.selectindexitem(index: 1)
            
        }
        
    }
    @IBAction func btnaccountinfo(_ sender: Any) {
        if   delegate  != nil {
            
            self.delegate?.selectindexitem(index: 2)
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if    LLCurrentUser.currentuser.user == nil {
            
            lblwatched.text  = "0"
            
            lblwatched.text = "0"
            
        }
        
    }
    
    
}
