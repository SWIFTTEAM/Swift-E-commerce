//
//  ViewController.swift
//  Ecommerce
//
//  Created by 黃仕杰 on 2017/10/26.
//  Copyright © 2017年 Ecommerce. All rights reserved.
//

import UIKit

//-------------------------------------------------------------------------------
struct Get_IP {
    static let ip: String = "192.168.1.136";
}

//-------------------------------------------------------------------------------
struct Get_Php_Files {
    static let login: String = "login.php";
    static let forget_password: String = "forget_password.php";
}

//-------------------------------------------------------------------------------
/// NSPHP
class E_Main: PHPSQL{
    var postContent: String = "";
};

