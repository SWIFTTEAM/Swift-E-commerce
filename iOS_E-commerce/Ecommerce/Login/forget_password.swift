//
//  Forget_Password.swift
//  Ecommerce
//
//  Created by YU on 2017/11/18.
//  Copyright © 2017年 Ecommerce. All rights reserved.
//

import UIKit

class Forget_Password: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var ok: UIButton!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var ID: UITextField!
    @IBOutlet weak var Account: UITextField!
    
    var account : String = "";
    var email : String = "";
    var id : String = "";
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AllDelegate();
        AllTag();
        
        ok.addTarget(self, action:#selector(okbutton), for:.touchUpInside);
    }
    
    //-----------------------------------------------------------
    // 設置TAG
    
    func AllTag() -> Void {
        
        Account.tag = 1;
        Email.tag = 2;
        ID.tag = 3;
        
    }
    
    //-----------------------------------------------------------
    // 委任
    
    func AllDelegate() -> Void {
        
        Account.delegate = self;
        Email.delegate = self;
        ID.delegate = self;
    }
    
    //-----------------------------------------------------------
    // 觸控到螢幕,鍵盤控制
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true);
    }
    
    //-----------------------------------------------------------
    // 觸控到鍵盤return,鍵盤控制
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        Account.resignFirstResponder();
        Email.resignFirstResponder();
        ID.resignFirstResponder();
        
        return(true);
    }
    
    //-----------------------------------------------------------
    // 使用者輸入後抓值
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if(textField.tag == 1){
            
            textField.text = account;
            
        } else if(textField.tag == 2){
            
            textField.text = email;
            
        } else if(textField.tag == 3){
            
            textField.text = id;
            
        } else {
            return;
        }
       
    }
    
    
    @objc func okbutton(){
        
        if(account == "" || email == "" || id == ""){
            
            print("輸入得值不完整");
            
        } else{
            
        }
    }
    
    
    
    
    
    
    
    
    
    /*

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
     
    */

}
