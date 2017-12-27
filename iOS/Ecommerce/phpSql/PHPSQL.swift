//
//  PHPSQL.swift
//  Ecommerce
//
//  Created by 黃仕杰 on 2017/12/7.
//  Copyright © 2017年 Ecommerce. All rights reserved.
//

import Foundation
import UIKit

protocol PHPSQL {
    var postContent: String { get set };
    func postArrToStr(_ postArray: [String]) -> String;
    func PHP_CONNECTION(IP: String , FileName: String , content:@escaping (_ json: NSArray) -> Void) -> Void;
}
extension PHPSQL{
    func postArrToStr(_ postArray: [String]) -> String{
        var str: String = "";
        let ArrayCount: Int = postArray.count;
        for i in 0..<ArrayCount{
            if(i==0){
                str = postArray[0];
            }else{
                str += "&"+postArray[i];
            }
        }
        print(str);
        return str;
    }
    
    func PHP_CONNECTION(IP: String , FileName: String , content:@escaping (_ json: NSArray) -> Void) -> Void {
        
        let url = URL(string: "http://\(IP):8080/E-iOSphp/\(FileName)");
        var request = URLRequest(url: url!);
        request.httpMethod = "POST";
        request.httpBody = postContent.data(using: .utf8);
        
        let task = URLSession.shared.dataTask(with: request){
            data , response , error in
            
            guard let data = data else {
                print(error!);
                return ;
            }
        
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: []) as! NSArray;
                DispatchQueue.main.async {
                    content(json);
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


