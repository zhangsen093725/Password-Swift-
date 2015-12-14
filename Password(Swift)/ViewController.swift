//
//  ViewController.swift
//  Password(Swift)
//
//  Created by 张森 on 15/12/14.
//  Copyright © 2015年 张森. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var fuck : ZSPasswordView?
    
    lazy var button : UIButton = {
        let tempButton : UIButton = UIButton.init(type: UIButtonType.System)
        tempButton.frame = CGRectMake(UIScreen.mainScreen().bounds.size.width * 0.5 * 0.5, 300 , UIScreen.mainScreen().bounds.size.width * 0.5 , 30)
        tempButton.setTitle("确定", forState: UIControlState.Normal)
        tempButton.addTarget(self, action: "click:", forControlEvents: UIControlEvents.TouchUpInside)
        return tempButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        fuck = ZSPasswordView.init(frame: CGRectMake(10, 200, UIScreen.mainScreen().bounds.size.width - 20, 35))
        self.view.addSubview(fuck!)
        self.view.addSubview(self.button)
    }
    
    func click(sender:UIButton) {
        print((fuck?.textFiledString)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

