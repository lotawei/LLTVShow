//
//  UIButton+extension.swift
//  LLTVShow
//
//  Created by lotawei on 17/1/17.
//  Copyright © 2017年 lotawei. All rights reserved.
//

import UIKit
import CoreGraphics
import QuartzCore
import UIKit

class HamburgerButton : UIButton {
    var atop: CAShapeLayer! = CAShapeLayer()
    var abottom: CAShapeLayer! = CAShapeLayer()
    var amiddle: CAShapeLayer! = CAShapeLayer()
    let shortStroke: CGPath = {
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 2, y: 2))
        path.addLine(to: CGPoint(x: 28, y:2))
        
        return path
    }()
    
    let outline: CGPath = {
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 10, y: 27))
        path.addCurve(to: CGPoint(x: 40, y: 27), control1: CGPoint(x: 12, y: 27), control2: CGPoint(x: 28.02, y: 27))
        path.addCurve(to: CGPoint(x: 27, y: 02), control1: CGPoint(x: 55.92, y: 27), control2: CGPoint(x: 50.47, y: 2))
        path.addCurve(to: CGPoint(x: 2, y: 27), control1: CGPoint(x: 13.16, y: 2), control2: CGPoint(x: 2, y: 13.16))
        path.addCurve(to: CGPoint(x: 27, y: 52), control1: CGPoint(x: 2, y: 40.84), control2: CGPoint(x: 13.16, y: 52))
        path.addCurve(to: CGPoint(x: 52, y: 27), control1: CGPoint(x: 40.84, y: 52), control2: CGPoint(x: 52, y: 40.84))
        path.addCurve(to: CGPoint(x: 27, y: 2), control1: CGPoint(x: 52, y: 13.16), control2: CGPoint(x: 42.39, y: 2))
        path.addCurve(to: CGPoint(x: 2, y: 27), control1: CGPoint(x: 13.16, y: 2), control2: CGPoint(x: 2, y: 13.16))
        
        return path
    }()
    
    let menuStrokeStart: CGFloat = 0.325
    let menuStrokeEnd: CGFloat = 0.9
    
    let hamburgerStrokeStart: CGFloat = 0.028
    let hamburgerStrokeEnd: CGFloat = 0.111
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.atop.path = shortStroke
        self.amiddle.path = outline
        self.abottom.path = shortStroke
        
        for layer in [ self.atop, self.amiddle, self.abottom ] {
            layer?.fillColor = nil
            layer?.strokeColor = UIColor.white.cgColor
            layer?.lineWidth = 4
            layer?.miterLimit = 4
            layer?.lineCap = kCALineCapRound
            layer?.masksToBounds = true
            
            let strokingPath = CGPath(__byStroking: (layer?.path!)!, transform: nil, lineWidth: 4, lineCap: .round, lineJoin: .miter, miterLimit: 4)
            
            layer?.bounds = (strokingPath?.boundingBoxOfPath)!
            
            layer?.actions = [
                "strokeStart": NSNull(),
                "strokeEnd": NSNull(),
                "transform": NSNull()
            ]
            
            self.layer.addSublayer(layer!)
        }
        
        self.atop.anchorPoint = CGPoint(x: 28.0 / 30.0, y: 0.5)
        self.atop.position = CGPoint(x: 40, y: 18)
        
        self.amiddle.position = CGPoint(x: 27, y: 27)
        self.amiddle.strokeStart = hamburgerStrokeStart
        self.amiddle.strokeEnd = hamburgerStrokeEnd
        
        self.abottom.anchorPoint = CGPoint(x: 28.0 / 30.0, y: 0.5)
        self.abottom.position = CGPoint(x: 40, y: 36)
    }
    
    var showsMenu: Bool = false {
        didSet {
            let strokeStart = CABasicAnimation(keyPath: "strokeStart")
            let strokeEnd = CABasicAnimation(keyPath: "strokeEnd")
            
            if self.showsMenu {
                strokeStart.toValue = menuStrokeStart
                strokeStart.duration = 0.5
                strokeStart.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, -0.4, 0.5, 1)
                
                strokeEnd.toValue = menuStrokeEnd
                strokeEnd.duration = 0.6
                strokeEnd.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, -0.4, 0.5, 1)
            } else {
                strokeStart.toValue = hamburgerStrokeStart
                strokeStart.duration = 0.5
                strokeStart.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0, 0.5, 1.2)
                strokeStart.beginTime = CACurrentMediaTime() + 0.1
                strokeStart.fillMode = kCAFillModeBackwards
                
                strokeEnd.toValue = hamburgerStrokeEnd
                strokeEnd.duration = 0.6
                strokeEnd.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0.3, 0.5, 0.9)
            }
            
            self.amiddle.ocb_applyAnimation(strokeStart)
            self.amiddle.ocb_applyAnimation(strokeEnd)
            
            let atopTransform = CABasicAnimation(keyPath: "transform")
            atopTransform.timingFunction = CAMediaTimingFunction(controlPoints: 0.5, -0.8, 0.5, 1.85)
            atopTransform.duration = 0.4
            atopTransform.fillMode = kCAFillModeBackwards
            
            let abottomTransform = atopTransform.copy() as! CABasicAnimation
            
            if self.showsMenu {
                let translation = CATransform3DMakeTranslation(-4, 0, 0)
                
                atopTransform.toValue = NSValue(caTransform3D: CATransform3DRotate(translation, -0.7853975, 0, 0, 1))
                atopTransform.beginTime = CACurrentMediaTime() + 0.25
                
                abottomTransform.toValue = NSValue(caTransform3D: CATransform3DRotate(translation, 0.7853975, 0, 0, 1))
                abottomTransform.beginTime = CACurrentMediaTime() + 0.25
            } else {
                atopTransform.toValue = NSValue(caTransform3D: CATransform3DIdentity)
                atopTransform.beginTime = CACurrentMediaTime() + 0.05
                
                abottomTransform.toValue = NSValue(caTransform3D: CATransform3DIdentity)
                abottomTransform.beginTime = CACurrentMediaTime() + 0.05
            }
            
            self.atop.ocb_applyAnimation(atopTransform)
            self.abottom.ocb_applyAnimation(abottomTransform)
        }
    }
    
  
}

extension CALayer {
    func ocb_applyAnimation(_ animation: CABasicAnimation) {
        let copy = animation.copy() as! CABasicAnimation
        
        if copy.fromValue == nil {
            copy.fromValue = self.presentation()!.value(forKeyPath: copy.keyPath!)
        }
        
        self.add(copy, forKey: copy.keyPath)
        self.setValue(copy.toValue, forKeyPath:copy.keyPath!)
    }
}
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
