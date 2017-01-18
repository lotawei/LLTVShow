//
//  UIButton+extension.swift
//  LLTVShow
//
//  Created by lotawei on 17/1/17.
//  Copyright © 2017年 lotawei. All rights reserved.
//

import UIKit

//上图下点击
class UpImageDownTextButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel?.sizeToFit()
        titleLabel?.frame = CGRect(x: 0, y: height - 15, width: width, height: (titleLabel?.height)!)
        titleLabel?.textAlignment = .center
        
        imageView?.frame = CGRect(x: 0, y: 0, width: width, height: height - 15)
        imageView?.contentMode = UIViewContentMode.center
    }
    
}

class ItemLeftButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let Offset: CGFloat = 15
        
        titleLabel?.sizeToFit()
        titleLabel?.frame = CGRect(x: -Offset, y: height - 15, width: width - Offset, height: (titleLabel?.height)!)
        titleLabel?.textAlignment = .center
        
        imageView?.frame = CGRect(x: -Offset, y: 0, width: width - Offset, height: height - 15)
        imageView?.contentMode = UIViewContentMode.center
    }
}

class ItemRightButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let Offset: CGFloat = 15
        
        titleLabel?.sizeToFit()
        titleLabel?.frame = CGRect(x: Offset, y: height - 15, width: width + Offset, height: (titleLabel?.height)!)
        titleLabel?.textAlignment = .center
        
        imageView?.frame = CGRect(x: Offset, y: 0, width: width + Offset, height: height - 15)
        imageView?.contentMode = UIViewContentMode.center
    }
}

class ItemLeftImageButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView?.frame = bounds
        imageView?.frame.origin.x = -15
    }
    
}
