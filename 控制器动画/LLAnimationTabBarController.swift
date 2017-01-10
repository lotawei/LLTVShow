//
//  LLAnimationTabBarController.swift
//  LLTVShow
//
//  Created by lotawei on 17/1/10.
//  Copyright © 2017年 lotawei. All rights reserved.
//

import UIKit
//动画协议 用于tabbar动画
//------------------------------------------------------------------------------------------------
protocol RAMItemAnimationProtocol {
    //播放动画
    func playAnimation(_ icon : UIImageView, textLabel : UILabel)
    //选中的动画和渲染效果
    func deselectAnimation(_ icon : UIImageView, textLabel : UILabel, defaultTextColor : UIColor)
    //选中状态
    func selectedState(_ icon : UIImageView, textLabel : UILabel)
}
class RAMItemAnimation: NSObject, RAMItemAnimationProtocol {
    
    //   包括几种动画
    
    struct Constants {
        
        struct AnimationKeys {
            
            static let Scale     = "transform.scale"
            static let Rotation    = "transform.rotation"
            static let KeyFrame  = "contents"
            static let PositionY = "position.y"
            static let Opacity   = "opacity"
        }
        
    }
    
    var duration : CGFloat = 0.6
    var textSelectedColor: UIColor = UIColor.gray
    var iconSelectedColor: UIColor?
    
    func playAnimation(_ icon : UIImageView, textLabel : UILabel) {
    }
    
    func deselectAnimation(_ icon : UIImageView, textLabel : UILabel, defaultTextColor : UIColor) {
        
    }
    
    func selectedState(_ icon: UIImageView, textLabel : UILabel) {
    }
    func deselectAnimation(_ icon : UIImageView, textLabel : UILabel, defaultTextColor : UIColor, defaultIconColor : UIColor){
        
    }
    
    
}
//------------------------------------------------------------------------------------------------
//针对uitabbaritem   动画方式制定  这里有5 种
//方式一
class RAMAnimatedTabBarItem: UITabBarItem {
    
    var animation: RAMItemAnimation?
    
    var textColor = UIColor.gray
    
    func playAnimation(_ icon: UIImageView, textLabel: UILabel){
        guard let animation = animation else {
            print("add animation in UITabBarItem")
            return
        }
        animation.playAnimation(icon, textLabel: textLabel)
    }
    
    func deselectAnimation(_ icon: UIImageView, textLabel: UILabel) {
        animation?.deselectAnimation(icon, textLabel: textLabel, defaultTextColor: textColor)
    }
    
    func selectedState(_ icon: UIImageView, textLabel: UILabel) {
        animation?.selectedState(icon, textLabel: textLabel)
    }
}
//方式2：
class RAMBounceAnimation : RAMItemAnimation {
    
    override func playAnimation(_ icon : UIImageView, textLabel : UILabel) {
        playBounceAnimation(icon)
        textLabel.textColor = textSelectedColor
    }
    
    override func deselectAnimation(_ icon : UIImageView, textLabel : UILabel, defaultTextColor : UIColor) {
        textLabel.textColor = defaultTextColor
        
        if let iconImage = icon.image {
            let renderImage = iconImage.withRenderingMode(.alwaysOriginal)
            icon.image = renderImage
            icon.tintColor = defaultTextColor
            
        }
    }
    
    override func selectedState(_ icon : UIImageView, textLabel : UILabel) {
        textLabel.textColor = textSelectedColor
        
        if let iconImage = icon.image {
            let renderImage = iconImage.withRenderingMode(.alwaysOriginal)
            icon.image = renderImage
            icon.tintColor = textSelectedColor
        }
    }
    
    func playBounceAnimation(_ icon : UIImageView) {
        
        let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        bounceAnimation.values = [1.0 ,1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
        bounceAnimation.duration = TimeInterval(duration)
        bounceAnimation.calculationMode = kCAAnimationCubic
        
        icon.layer.add(bounceAnimation, forKey: "bounceAnimation")
        
        if let iconImage = icon.image {
            let renderImage = iconImage.withRenderingMode(.alwaysOriginal)
            icon.image = renderImage
            icon.tintColor = iconSelectedColor
        }
    }
    
}
//------------------------------------------------------------------------------------------------
//方式3:
class RAMFumeAnimation : RAMItemAnimation {
    
    /**
     Start animation, method call when UITabBarItem is selected
     
     - parameter icon:      animating UITabBarItem icon
     - parameter textLabel: animating UITabBarItem textLabel
     */
    override  func playAnimation(_ icon : UIImageView, textLabel : UILabel) {
        playMoveIconAnimation(icon, values:[icon.center.y as AnyObject, icon.center.y + CGFloat (4.0) as AnyObject])
        playLabelAnimation(textLabel)
        textLabel.textColor = textSelectedColor
        
        if let iconImage = icon.image {
            let renderImage = iconImage.withRenderingMode(.alwaysTemplate)
            icon.image = renderImage
            icon.tintColor = textSelectedColor
        }
    }
    /**
     Start animation, method call when UITabBarItem is unselected
     
     - parameter icon:      animating UITabBarItem icon
     - parameter textLabel: animating UITabBarItem textLabel
     - parameter defaultTextColor: default UITabBarItem text color
     - parameter defaultIconColor: default UITabBarItem icon color
     */
    override  func deselectAnimation(_ icon : UIImageView, textLabel : UILabel, defaultTextColor : UIColor, defaultIconColor : UIColor) {
        
        playMoveIconAnimation(icon, values:[icon.center.y + CGFloat( 4.0 ) as AnyObject, icon.center.y as AnyObject])
        playDeselectLabelAnimation(textLabel)
        textLabel.textColor = defaultTextColor
        
        if let iconImage = icon.image {
            let renderMode = defaultIconColor.cgColor.alpha == 0 ? UIImageRenderingMode.alwaysOriginal :
                UIImageRenderingMode.alwaysTemplate
            let renderImage = iconImage.withRenderingMode(renderMode)
            icon.image = renderImage
            icon.tintColor = defaultIconColor
        }
    }
    
    /**
     Method call when TabBarController did load
     
     - parameter icon:      animating UITabBarItem icon
     - parameter textLabel: animating UITabBarItem textLabel
     */
    override  func selectedState(_ icon : UIImageView, textLabel : UILabel) {
        
        playMoveIconAnimation(icon, values:[icon.center.y + CGFloat( 12.0) as AnyObject])
        textLabel.alpha = 0
        textLabel.textColor = textSelectedColor
        
        if let iconImage = icon.image {
            let renderImage = iconImage.withRenderingMode(.alwaysTemplate)
            icon.image = renderImage
            icon.tintColor = textSelectedColor
        }
    }
    
    func playMoveIconAnimation(_ icon : UIImageView, values: [AnyObject]) {
        
        let yPositionAnimation = createAnimation(Constants.AnimationKeys.PositionY, values:values, duration:duration / 2)
        
        icon.layer.add(yPositionAnimation, forKey: nil)
    }
    
    // MARK: select animation
    
    func playLabelAnimation(_ textLabel: UILabel) {
        
        let yPositionAnimation = createAnimation(Constants.AnimationKeys.PositionY, values:[textLabel.center.y as AnyObject, textLabel.center.y - CGFloat( 60.0) as AnyObject], duration:duration)
        yPositionAnimation.fillMode = kCAFillModeRemoved
        yPositionAnimation.isRemovedOnCompletion = true
        textLabel.layer.add(yPositionAnimation, forKey: nil)
        
        let scaleAnimation = createAnimation(Constants.AnimationKeys.Scale, values:[CGFloat( 1.0) as AnyObject ,CGFloat( 2.0) as AnyObject], duration:duration)
        scaleAnimation.fillMode = kCAFillModeRemoved
        scaleAnimation.isRemovedOnCompletion = true
        textLabel.layer.add(scaleAnimation, forKey: nil)
        
        let opacityAnimation = createAnimation(Constants.AnimationKeys.Opacity, values:[CGFloat( 1.0) as AnyObject ,CGFloat( 0.0) as AnyObject], duration:duration)
        textLabel.layer.add(opacityAnimation, forKey: nil)
    }
    
    func createAnimation(_ keyPath: String, values: [AnyObject], duration: CGFloat)->CAKeyframeAnimation {
        
        let animation = CAKeyframeAnimation(keyPath: keyPath)
        animation.values = values
        animation.duration = TimeInterval(duration)
        animation.calculationMode = kCAAnimationCubic
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        return animation
    }
    
    // MARK: deselect animation
    
    func playDeselectLabelAnimation(_ textLabel: UILabel) {
        
        let yPositionAnimation = createAnimation(Constants.AnimationKeys.PositionY, values:[textLabel.center.y + CGFloat( 15) as AnyObject, textLabel.center.y as AnyObject], duration:duration)
        textLabel.layer.add(yPositionAnimation, forKey: nil)
        
        let opacityAnimation = createAnimation(Constants.AnimationKeys.Opacity, values:[0 as AnyObject, 1 as AnyObject], duration:duration)
        textLabel.layer.add(opacityAnimation, forKey: nil)
    }
}
//------------------------------------------------------------------------------------------------
//方式4：旋转  分为顺时针  逆时针
class RAMRotationAnimation : RAMItemAnimation {
    
    /**
     Animation direction
     
     - Left:  left direction
     - Right: right direction
     */
    enum RAMRotationDirection {
        case left
        case right
    }
    /// Animation direction (left, right)
    var direction : RAMRotationDirection!
    
    /**
     Start animation, method call when UITabBarItem is selected
     
     - parameter icon:      animating UITabBarItem icon
     - parameter textLabel: animating UITabBarItem textLabel
     */
    override  func playAnimation(_ icon : UIImageView, textLabel : UILabel) {
        playRoatationAnimation(icon)
        textLabel.textColor = textSelectedColor
    }
    
    /**
     Start animation, method call when UITabBarItem is unselected
     
     - parameter icon:      animating UITabBarItem icon
     - parameter textLabel: animating UITabBarItem textLabel
     - parameter defaultTextColor: default UITabBarItem text color
     - parameter defaultIconColor: default UITabBarItem icon color
     */
    override  func deselectAnimation(_ icon : UIImageView, textLabel : UILabel, defaultTextColor : UIColor, defaultIconColor : UIColor) {
        textLabel.textColor = defaultTextColor
        
        if let iconImage = icon.image {
            let renderMode = defaultIconColor.cgColor.alpha == 0 ? UIImageRenderingMode.alwaysOriginal :
                UIImageRenderingMode.alwaysTemplate
            let renderImage = iconImage.withRenderingMode(renderMode)
            icon.image = renderImage
            icon.tintColor = defaultIconColor
        }
    }
    
    /**
     Method call when TabBarController did load
     
     - parameter icon:      animating UITabBarItem icon
     - parameter textLabel: animating UITabBarItem textLabel
     */
    override  func selectedState(_ icon : UIImageView, textLabel : UILabel) {
        textLabel.textColor = textSelectedColor
        
        if let iconImage = icon.image {
            let renderImage = iconImage.withRenderingMode(.alwaysTemplate)
            icon.image = renderImage
            icon.tintColor = textSelectedColor
        }
    }
    
    func playRoatationAnimation(_ icon : UIImageView) {
        
        let rotateAnimation = CABasicAnimation(keyPath: Constants.AnimationKeys.Rotation)
        rotateAnimation.fromValue = 0.0
        
        var toValue = CGFloat(M_PI * 2.0)
        if direction != nil && direction == RAMRotationDirection.left {
            toValue = toValue * -1.0
        }
        
        rotateAnimation.toValue = toValue
        rotateAnimation.duration = TimeInterval(duration)
        
        icon.layer.add(rotateAnimation, forKey: nil)
        
        if let iconImage = icon.image {
            let renderImage = iconImage.withRenderingMode(.alwaysTemplate)
            icon.image = renderImage
            icon.tintColor = iconSelectedColor
        }
    }
}
//左方旋转
class RAMLeftRotationAnimation : RAMRotationAnimation {
    
    override init() {
        super.init()
        direction = RAMRotationDirection.left
    }
}
//右方旋转
/// The RAMRightRotationAnimation class provides rigth rotation animation.
class RAMRightRotationAnimation : RAMRotationAnimation {
    
    override init() {
        super.init()
        direction = RAMRotationDirection.right
    }
}




//自定义tababrcontroller
class LLAnimationTabBarController: UITabBarController {

  

}
