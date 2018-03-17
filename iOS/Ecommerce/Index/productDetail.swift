//
//  productDetail.swift
//  Ecommerce
//
//  Created by 黃仕杰 on 2018/3/15.
//  Copyright © 2018年 Ecommerce. All rights reserved.
//

import UIKit

class productDetail: UIViewController {
    
    @IBOutlet var productName: UILabel!;
    
    var PD_id: Int = 0; //產品編號
    var values: NSArray = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()

        phpConnect();
    }
    
    func phpConnect() -> Void{
        let phpsql = E_Main();
        
        var postarray: [String] = [];
        postarray.append("PD_id=\(PD_id)");
        let poststring = phpsql.postArrToStr(postarray); // return post
        phpsql.postContent = poststring;
        
        let setIP = NSGetValue.IP.ip;
        let setFile =  NSGetValue.Php_Files.productDetail;
        
        phpsql.PHP_CONNECTION(IP: setIP, FileName: setFile) { (json) in
            var ToObjectArray: [String: AnyObject] = [:];
            ToObjectArray = json[0] as! [String : AnyObject] ;
            self.productName.text = ToObjectArray["Name"] as? String;
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
