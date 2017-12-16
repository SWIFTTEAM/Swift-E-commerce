//
//  ViewController.swift
//  Ecommerce
//
//  Created by 黃仕杰 on 2017/10/26.
//  Copyright © 2017年 Ecommerce. All rights reserved.
//

import UIKit

///==================================Get Value=============================================
public class NSGetValue {
    struct IP {
        static let ip: String = "172.20.10.9";
    }
    
    struct Php_Files {
        static let login: String = "login.php";
    }
}

///==================================PHP=============================================
class E_Main: PHPSQL{
    var postContent: String = "";
};


///==================================showMessage=============================================

public func showMessage(UI: UIViewController, _ string: String) -> Void {
    
    let myAlert: UIAlertController = UIAlertController(title: "System Messgae", message: string, preferredStyle: .alert);
    let action = UIAlertAction(title: "關閉", style: UIAlertActionStyle.default, handler: {action in print("done")});
    myAlert.addAction(action);
    UI.present(myAlert, animated: true, completion: nil);
}



