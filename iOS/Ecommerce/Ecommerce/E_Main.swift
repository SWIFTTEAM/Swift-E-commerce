//
//  ViewController.swift
//  Ecommerce
//
//  Created by 黃仕杰 on 2017/10/26.
//  Copyright © 2017年 Ecommerce. All rights reserved.
//

import UIKit
import CoreData

///=================================Get Value=================================

public class NSGetValue {
    struct IP {
        static let ip: String = "172.20.10.9";
    }
    
    struct Php_Files {
        static let login: String = "login.php";
        static let register: String = "register.php";
        static let forget_password: String = "forget_password.php";
        static let checkpassword: String = "checkpassword.php";
        static let index: String = "Index/index.php";
    }
}

///=================================PHP=================================

class E_Main: PHPSQL{
    var postContent: String = "";
};

///=================================CoreData=================================

class E_CoreData: CoreDataConnect{
    var myContext: NSManagedObjectContext;
    required init(context:NSManagedObjectContext) {
        self.myContext = context;
    }
};

///=================================showMessage=================================

public func showMessage(UI: UIViewController, _ string: String) -> Void {
    
    let myAlert: UIAlertController = UIAlertController(title: "System Messgae", message: string, preferredStyle: .alert);
    let action = UIAlertAction(title: "關閉", style: UIAlertActionStyle.default, handler: {action in print("done")});
    myAlert.addAction(action);
    UI.present(myAlert, animated: true, completion: nil);
}



