//
//  productDetail.swift
//  Ecommerce
//
//  Created by 黃仕杰 on 2018/3/15.
//  Copyright © 2018年 Ecommerce. All rights reserved.
//

import UIKit

class productDetail: UIViewController {
    
    var PD_id: Int = 0; //產品編號
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("PD_id = \(PD_id)");
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
