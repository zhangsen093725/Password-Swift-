//
//  ZSPasswordView.swift
//  Password(Swift)
//
//  Created by 张森 on 15/12/14.
//  Copyright © 2015年 张森. All rights reserved.
//
import UIKit

class ZSPasswordView: UIView,UITextFieldDelegate {
    
    let passwordLength : NSInteger=6
    static let space : CGFloat = 10
    let space : CGFloat = 10
    
    var textFiledString : String {
        get{
            return self.textFiled.text ?? ""
        }
    }
    
    var _frame : CGRect?
    override var frame : CGRect {
        get{
            return _frame!
        }
        set{
            _frame = newValue
            super.frame = _frame!
            self.createUI(frame: _frame!)
        }
    }
    
    lazy var textFiled:UITextField = {
        let tempTextFiled : UITextField = UITextField.init()
        tempTextFiled.backgroundColor = UIColor.white
        tempTextFiled.layer.masksToBounds = true
        tempTextFiled.layer.borderColor = UIColor.gray.cgColor
        tempTextFiled.layer.borderWidth = 1
        tempTextFiled.layer.cornerRadius = space * 0.5
        tempTextFiled.isSecureTextEntry = true
        tempTextFiled.delegate = self
        tempTextFiled.tintColor = .clear
        tempTextFiled.textColor = .clear
        tempTextFiled.font = UIFont.systemFont(ofSize: 30)
        tempTextFiled.keyboardType = .numberPad
        tempTextFiled.addTarget(self, action: #selector(textFiledEdingChanged), for: .editingChanged)
        return tempTextFiled
    }()
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if (range.location >= passwordLength){
            return false
        }
        return true
    }
    
    @objc func textFiledEdingChanged() {
        let length : NSInteger = (self.textFiled.text ?? "").count
        for i in 0..<passwordLength {
            let dotLabel : UILabel? = (self.viewWithTag(i + 1) as! UILabel)
            if(dotLabel != nil){
                self.bringSubviewToFront(dotLabel!)
                dotLabel!.isHidden = length <= i
            }
        }
        self.textFiled.sendActions(for: .valueChanged)
    }
    
    func createUI(frame:CGRect){
        self.addSubview(self.textFiled)
        self.textFiled.frame = CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        let perWidth:CGFloat = (frame.size.width - (CGFloat)(passwordLength) + 1) / CGFloat(passwordLength)
        for i in 0..<passwordLength {
            if (i < passwordLength - 1){
                let lineLabel:UILabel = UILabel.init()
                lineLabel.backgroundColor = UIColor.lightGray
                lineLabel.frame = CGRect.init(x: CGFloat(i + 1) * frame.size.width / CGFloat (passwordLength) + 1, y: 0, width: 1, height: frame.height)
                self.addSubview(lineLabel)
            }
            
            var dotLabel:UILabel? = self.viewWithTag(i+1) as? UILabel
            if (dotLabel == nil){
                dotLabel = UILabel.init()
                dotLabel!.tag = i + 1
                self.addSubview(dotLabel!)
            }
            dotLabel?.frame = CGRect.init(x: (perWidth + 1) * CGFloat (i) + (perWidth - space) * 0.5, y: (frame.size.height - space) * 0.5, width: space, height: space)
            dotLabel?.layer.masksToBounds = true
            dotLabel?.layer.cornerRadius = space * 0.5
            dotLabel?.backgroundColor = UIColor.black
            dotLabel?.isHidden = true
        }
    }
}
