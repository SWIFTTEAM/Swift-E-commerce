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
    @IBOutlet weak var ok: UIButton!
    
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
    
    @objc func okbutton(){
        
        if(Account == "" || Email == "" || Id == ""){
            
            //要記得跳視窗防呆
            print("輸入得值不完整");
            
        } else{
            
            //這邊要傳送新密碼的信
            newpassword = newnumber(len: 8);
            
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
    
    //未做資料庫連線.傳送email 連線問題 防呆
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
}
