//
//  LLLoginView.swift
//  LLTVShow
//
//  Created by lotawei on 17/1/18.
//  Copyright © 2017年 lotawei. All rights reserved.
//

import UIKit



class LLLoginView: UIView {
    @IBOutlet weak var txtlogin: TextFieldEffects!
    @IBOutlet weak var txtpwd: TextFieldEffects!
    
    @IBOutlet weak var gologin: UIButton!
    @IBAction func goLogin(_ sender: Any) {
        
    }
   static  func newInstance() -> LLLoginView? {
        let nibView = Bundle.main.loadNibNamed("LLLoginView", owner: nil, options: nil);
        if let view = nibView?.first as? LLLoginView {
            return view
        }
        
        return nil
    }
    override func awakeFromNib() {
        super.awakeFromNib()
   
        
    }
    
    
    
  


}
