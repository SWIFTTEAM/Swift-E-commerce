//
//  ViewController.swift
//  Ecommerce
//
//  Created by 黃仕杰 on 2017/10/26.
//  Copyright © 2017年 Ecommerce. All rights reserved.
//

import UIKit

//-------------------------------------------------------------------------------
/// Get Value
public class NSGetValue {
    struct IP {
        static let ip: String = "192.168.1.103";
        static let ip2: String = "192.168.9.129";//zinfu
    }
    
    struct Php_Files {
        static let login: String = "login.php";
        static let register: String = "registered2.php";//zinfu
    }
}

//-------------------------------------------------------------------------------
/// NSPHP
class E_Main: PHPSQL{
    var postContent: String = "";
};

