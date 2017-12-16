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
    
    
    @IBOutlet weak var rAccount: UITextField!
    @IBOutlet weak var rPassword: UITextField!
    @IBOutlet weak var rNameChi: UITextField!
    @IBOutlet weak var rNameEng: UITextField!
    @IBOutlet weak var rEmail: UITextField!
    @IBOutlet weak var rIdentify: UITextField!
    @IBOutlet weak var rCellPhone: UITextField!
    @IBOutlet weak var rCellPhone_Spare: UITextField!
    @IBOutlet weak var rHomePhone: UITextField!
    @IBOutlet weak var rResidenceAddress: UITextField!
    @IBOutlet weak var rMailingAddress: UITextField!
    @IBOutlet weak var rDeliveryAddress: UITextField!
    @IBOutlet weak var rCountryID: UITextField!
    @IBOutlet weak var rCompanyID: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        anyClass = self;
        
        buildingDelegate();
        print("build ok")
    }
    
    
    @IBAction func regtestclick(_ sender: UIButton) {
        print("go")
        register();
        print("go1")
    }
    
    
    //--------------------------------------------------------------------
    
    func buildingDelegate() -> Void {
        self.rAccount.delegate = self;
        self.rPassword.delegate = self;
        self.rNameChi.delegate = self;
        self.rNameEng.delegate = self;
        self.rIdentify.delegate = self;
        self.rEmail.delegate = self;
        self.rCompanyID.delegate = self;
        self.rCountryID.delegate = self;
        self.rCellPhone.delegate = self;
        self.rCellPhone_Spare.delegate = self;
        self.rHomePhone.delegate = self;
        self.rMailingAddress.delegate = self;
        self.rDeliveryAddress.delegate = self;
        self.rResidenceAddress.delegate = self;

        
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
        rAccount.resignFirstResponder();
        rPassword.resignFirstResponder();
        rNameChi.resignFirstResponder();
        rNameEng.resignFirstResponder();
        rIdentify.resignFirstResponder();
        rEmail.resignFirstResponder();
        rCompanyID.resignFirstResponder();
        rCountryID.resignFirstResponder();
        rCellPhone.resignFirstResponder();
        rCellPhone_Spare.resignFirstResponder();
        rHomePhone.resignFirstResponder();
        rResidenceAddress.resignFirstResponder();
        rDeliveryAddress.resignFirstResponder();
        rMailingAddress.resignFirstResponder();
        
        
        return(true);
    }
    
    //--------------------------------------------------------------------
    //登入判斷
    private func register() -> Void{
        let phpsql = E_Main();
        
        var postarray: [String] = [];
        postarray.append("account=\(rAccount.text!)");
        postarray.append("password=\(rPassword.text!)");
        postarray.append("namechi=\(rNameChi.text!)");
        postarray.append("nameeng=\(rNameEng.text!)");
        postarray.append("email=\(rEmail.text!)");
        postarray.append("identify=\(rIdentify.text!)");
        postarray.append("cellphone=\(rCellPhone.text!)");
        postarray.append("cellphone_spare=\(rCellPhone_Spare.text!)");
        postarray.append("homephone=\(rHomePhone.text!)");
        postarray.append("residenceaddress=\(rResidenceAddress.text!)");
        postarray.append("mailingaddress=\(rMailingAddress.text!)");
        postarray.append("deliveryaddress=\(rDeliveryAddress.text!)");
        postarray.append("countryID=\(rCountryID.text!)");
        postarray.append("companyID=\(rCompanyID.text!)");
        
        print(postarray)
        
        let poststring = phpsql.postArrToStr(postarray); // return post
        phpsql.postContent = poststring;
        
        let setIP = NSGetValue.IP.ip; // get IP
        let setFile =  NSGetValue.Php_Files.register; //get php register file
        
        phpsql.PHP_CONNECTION(IP: setIP, FileName: setFile) { (json) in
            let errorStatus = Int(json["errorStatus"]!)!;
            
            if(errorStatus == 2){
                self.showMessage("帳號已被使用");
            }else if(errorStatus == 3){
                self.showMessage("post錯誤");
            }else if(errorStatus == 4){
                self.showMessage("註冊成功");
            }else if(errorStatus == 5){
                self.showMessage("信箱已被使用");
            }
            
            print(errorStatus)
        }
    }
    
    
    func Register(_ file: String ) -> Void{ 
        
        let postString = "account=\(rAccount.text!)&password=\(rPassword.text!)";
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

