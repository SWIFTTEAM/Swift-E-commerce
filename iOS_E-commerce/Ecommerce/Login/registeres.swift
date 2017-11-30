//
//  registeres.swift
//  Ecommerce
//
//  Created by zinfu on 2017/11/29.
//  Copyright © 2017年 Ecommerce. All rights reserved.
//

import Foundation

import UIKit

class registeres: UIViewController,UITextFieldDelegate {
    
    var str:String? = nil
    @IBOutlet weak var rAdrress: UITextField!
    @IBOutlet weak var rMAdrress: UITextField!
    @IBOutlet weak var rCountry: UITextField!
    @IBOutlet weak var rCompany: UITextField!
    
    //@IBOutlet weak var rSex: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad();
        
        anyClass = self;
        
        buildingDelegate();
        if let str = str{
            print(str)
        }
        print("build ok")
    }
    
    
    func buildingDelegate() -> Void {
        
        self.rAdrress.delegate = self;
        self.rMAdrress.delegate = self;
        self.rCountry.delegate = self;
        self.rCompany.delegate = self;
        
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        rAdrress.resignFirstResponder();
        rMAdrress.resignFirstResponder();
        rCountry.resignFirstResponder();
        rCompany.resignFirstResponder();
        
        return(true);
    }
    
    /*
    func Register(_ file: String ) -> Void{
        
        let postString = "account=\(rAccountText.text!)&password=\(rPasswordText.text!)&name=\(rName.text!)&mail=\(rMail.text!)&identity=\(rID.text!)&phone=\(rPhone.text!)&residenaddress=\(rAdrress.text!)&mailingaddress=\(rMAdrress.text!)&country=\(rCountry.text!)&company=\(rCompany.text!)";
        let url = URL(string: "\(file).php");
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
                        /*
                         if (errorStatus == 1){
                         print("ok")
                         self.showMessage("註冊成功");
                         }else */
                        if(errorStatus == 2){
                            self.showMessage("帳號已被使用");
                        }else if(errorStatus == 3){
                            self.showMessage("post錯誤");
                        }else if(errorStatus == 4){
                            self.showMessage("註冊成功");
                        }else if(errorStatus == 5){
                            self.showMessage("信箱已被使用");
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
    */
    
}
