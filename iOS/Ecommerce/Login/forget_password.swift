//
//  forget_password.swift
//  Ecommerce
//
//  Created by YU on 2017/11/23.
//  Copyright © 2017年 Ecommerce. All rights reserved.
//
import UIKit
import GameKit

class forget_password: UIViewController,UITextFieldDelegate{
    
    @IBOutlet weak var account: UITextField!
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var get_newpassword: UIButton!
    
    var Account : String = "";
    var Email : String = "";
    var Id : String = "";
    var number : Int = 0;
    var newpassword : String = "";
    var str : String = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AllDelegate();
        AllTag();
        
    }
    
    //===================================================
    // 委任
    
    func AllDelegate() {
        
        account.delegate = self;
        id.delegate = self;
        email.delegate = self;
    }
    
    //===================================================
    
    func AllTag() {
        
        account.tag = 1;
        email.tag = 2;
        id.tag = 3;
    }
    
    //===================================================
    //顯示訊息
    
    func showMessage(_ string: String) -> Void {
        
        let myAlert: UIAlertController = UIAlertController(title: "System Messgae", message: string, preferredStyle: .alert);
        let action = UIAlertAction(title: "關閉", style: UIAlertActionStyle.default, handler: {action in print("done")});
        myAlert.addAction(action);
        self.present(myAlert, animated: true, completion: nil);
        
    }
    
    //===================================================
    // 觸控到螢幕,鍵盤控制
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true);
    }
    
    //===================================================
    // 觸控到鍵盤return,鍵盤控制
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        account.resignFirstResponder();
        email.resignFirstResponder();
        id.resignFirstResponder();
        
        return(true);
    }
    
    //===================================================
    // 使用者輸入後抓值
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if(textField.tag == 1){
            
            textField.text = Account;
            
        } else if(textField.tag == 2){
            
            textField.text = Email;
            
        } else if(textField.tag == 3){
            
            textField.text = Id;
            
        } else {
            return;
        }
        
    }
    
    //===================================================
    // 確定要發送認證信

    @IBAction func get_newpassword(_ sender: Any) {
        
        if(Account.isEmpty == true || Email.isEmpty == true || Id.isEmpty == true){
            
            self.showMessage("輸入值不完整");
            print("NONO");
            
        } else{
            
            confirm(); //驗證身份
            print("OKOK")
            
        }
    }
    
    
    //===================================================
    // 產生亂數密碼
    
    func newnumber(len:Int) ->String {
        
        str = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
        var c = Array(str);
        var s : String = "";
        
        for _ in (1...len){
            s.append(c[Int(arc4random()) % c.count]);
        }
        
        return s;
        
    }
    
    //===================================================
    // 資料庫連線判斷資料完整
    
    private func confirm() -> Void{
        let phpsql = E_Main();
        
        var postarray: [String] = [];
        postarray.append("account=\(Account)");
        postarray.append("email=\(Email)");
        postarray.append("id=\(Id)");
        
        let poststring = phpsql.postArrToStr(postarray); // return post
        phpsql.postContent = poststring;
        
        let setIP = Get_IP.ip; // 抓IP位置
        let setFile = Get_Php_Files.forget_password //get php login file
        
        phpsql.PHP_CONNECTION(IP: setIP, FileName: setFile) { (json) in
            let errorStatus = Int(json["errorStatus"]!)!;
            
            if (errorStatus == 1){
                
                self.showMessage("身份確認成功！");
                self.newpassword = self.newnumber(len: 8); //身份驗證成功後產生一組亂碼
                print(self.newpassword);
                
            }else if(errorStatus == 2){
                
                self.showMessage("輸入資料有誤，請重新輸入");
                
            }else if(errorStatus == 3){
                
                self.showMessage("POST錯誤");
            }
        }
    }
    
    
    //未做傳送email 防呆
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
}
