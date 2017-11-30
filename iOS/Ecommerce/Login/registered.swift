//
//  registered.swift
//  Ecommerce
//
//  Created by Bei on 2017/11/17.
//  Copyright © 2017年 Ecommerce. All rights reserved.
//

import Foundation
import UIKit

class registered: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var rAccountText: UITextField!
    @IBOutlet weak var rPasswordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        anyClass = self;
        
        buildingDelegate();
        print("build ok")
    }
    
    
    @IBAction func regtestclick(_ sender: UIButton) {
        print("go")
        Register("registered");
        print("go1")
    }
    
    
    //--------------------------------------------------------------------
    
    func buildingDelegate() -> Void {
        self.rAccountText.delegate = self;
        self.rPasswordText.delegate = self;
        
    }
    //--------------------------------------------------------------------
    
    func showMessage(_ string: String) -> Void {
        
        let myAlert: UIAlertController = UIAlertController(title: "System Messgae", message: string, preferredStyle: .alert);
        let action = UIAlertAction(title: "關閉", style: UIAlertActionStyle.default, handler: {action in print("done")});
        myAlert.addAction(action);
        self.present(myAlert, animated: true, completion: nil);
        
    }
    
    //--------------------------------------------------------------------
    // 觸控到螢幕,超出keyboar
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
    }
    
    //--------------------------------------------------------------------
    // 觸控到鍵盤return,在keyboar內
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        rAccountText.resignFirstResponder();
        rPasswordText.resignFirstResponder();
        
        return(true);
    }
    
    //--------------------------------------------------------------------
    //登入判斷
    
    func Register(_ file: String ) -> Void{ 
        
        let postString = "account=\(rAccountText.text!)&password=\(rPasswordText.text!)";
        let url = URL(string: "http://172.20.10.3:8080/php/\(file).php");
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
                        let errorStatus = Int(json["errorStatus"]!)!;
                        
                        if (errorStatus == 1){
                            print("ok")
                            self.showMessage("註冊成功");
                        }else if(errorStatus == 2){
                            self.showMessage("帳號已被使用");
                        }else if(errorStatus == 3){
                            self.showMessage("post錯誤");
                        }
                    }
                }
            } catch let Error {
                print(Error);
                
                let responseString = String(data: data, encoding: .utf8);
                print(responseString!);
            }
        }
        task.resume();
    }
    
}

