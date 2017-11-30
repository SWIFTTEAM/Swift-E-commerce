//
//  PHPSQL.swift
//  Ecommerce
//
//  Created by 黃仕杰 on 2017/11/30.
//  Copyright © 2017年 Ecommerce. All rights reserved.
//

import UIKit
import Foundation


class PHPSQL: NSObject {
    public var postString: String = "";
    
    func PHP_CONNECTION(IP: String , FileName: String , content:@escaping (_ json: [String: String]) -> Void) -> Void {
        
        let url = URL(string: "http://\(IP):8080/E-iOSphp/\(FileName)");
        var request = URLRequest(url: url!);
        request.httpMethod = "POST";
        request.httpBody = postString.data(using: .utf8);
        
        let task = URLSession.shared.dataTask(with: request){
            data , response , error in
            
            guard let data = data else {
                print(error!);
                return;
            }
            
            do{
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: String]{
                    DispatchQueue.main.async {
                        content(json);
                    }
                }
            } catch let Error {
                print("PHP Connection error：\(Error)");
                let responseString = String(data: data, encoding: .utf8);
                print(responseString!);
            }
        }
        task.resume();
    }

}
