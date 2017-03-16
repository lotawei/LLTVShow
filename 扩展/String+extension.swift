//
//  String+extension.swift
//  爱鲜蜂仿2次
//
//  Created by lotawei on 16/8/13.
//  Copyright © 2016年 lotawei. All rights reserved.
//

import Foundation
extension String {
    
    /// 清除字符串小数点末尾的0
    func cleanDecimalPointZear() -> String {
        
        let newStr = self as NSString
        var s = NSString()
        
        var offset = newStr.length - 1
        while offset > 0 {
            s = newStr.substring(with: NSMakeRange(offset, 1)) as NSString
            if s.isEqual(to: "0") || s.isEqual(to: ".") {
                offset-=1
            } else {
                break
            }
        }
        
        return newStr.substring(to: offset + 1)
    }
    
    //md5
    var MD5: String {
        let cString = self.cString(using: .utf8)
        let length = CUnsignedInt(
            self.lengthOfBytes(using: .utf8)
        )
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(
            capacity: Int(CC_MD5_DIGEST_LENGTH)
        )
        
        CC_MD5(cString!, length, result)
        
        return String(format:
            "%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                      result[0], result[1], result[2], result[3],
                      result[4], result[5], result[6], result[7],
                      result[8], result[9], result[10], result[11],
                      result[12], result[13], result[14], result[15])
    }
    
    // 转为kb g mb 
    static func transformedValue(_ value:AnyObject) -> String {
    var    multiplyFactor = 0
    var convertedValue = value.doubleValue
        
        let   tokens = ["字节","KB","MB"]
        while (convertedValue! > Double(1024.0)){
        
//            convertedValue /=  Double(1024.0)
            convertedValue  =  convertedValue!  / Double(1024)
        
            multiplyFactor += 1
            
            }
        return "\(String.init(format:"%0.2f",convertedValue!))\(tokens[multiplyFactor])"
    }
    //因为服务器后台的关系暂时先采用这种方式吧
    func   tranimgurl() -> String{
        
        return  self
    }
    
    
    
    
}
extension UITextField{
    
   
    
    
    func validate(value: String) -> Bool{
        
        let predicate = NSPredicate(format: " SELF MATCHES %@" , value)
        
        return predicate.evaluate(with: self.text)
        
    }
    
    
    func validateEmail() -> Bool{
        
        return self.validate( value: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9,-]+\\.[A-Za-z]{2,6}")
        
    }
    
    
    func validatePhoneNumer() -> Bool{
        
        return self.validate(value:"^\\d{11}$")
        
    }
    
    
    func validatePassword() -> Bool {
        
        return self.validate(value: "^[A-Z0-9a-z]{6,18}")
        
    }
    
    
}
