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
        let tempButton : UIButton = UIButton.init(type: .system)
        tempButton.frame = CGRect.init(x: UIScreen.main.bounds.size.width * 0.5 * 0.5, y: 300, width: UIScreen.main.bounds.size.width * 0.5, height: 30)
        tempButton.setTitle("确定", for: .normal)
        tempButton.addTarget(self, action: #selector(click(sender:)), for: .touchUpInside)
        return tempButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        fuck = ZSPasswordView.init(frame: CGRect.init(x: 10, y: 200, width: UIScreen.main.bounds.size.width - 20, height: 35))
        self.view.addSubview(fuck!)
        self.view.addSubview(self.button)
    }
    
    @objc func click(sender:UIButton) {
        print((fuck?.textFiledString)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

