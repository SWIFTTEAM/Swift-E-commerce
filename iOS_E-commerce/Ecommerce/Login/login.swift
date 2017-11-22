//
//  login.swift
//  Ecommerce
//
//  Created by 黃仕杰 on 2017/10/26.
//  Copyright © 2017年 Ecommerce. All rights reserved.
//

import UIKit

class login: UIViewController, UITextFieldDelegate{
    
    let con = false;
    var count: Int = 0;
    
    @IBOutlet var rememberImg: UIImageView!;
    @IBOutlet var agreeImg: UIImageView!;
    
    @IBOutlet var img1: UIImageView!;
    @IBOutlet var img2: UIImageView!;
    @IBOutlet var img3: UIImageView!;
    @IBOutlet var img4: UIImageView!;
    
    @IBOutlet var accountText: UITextField!;
    @IBOutlet var pwText: UITextField!;
    @IBOutlet var codeText: UITextField!;
    
    var code: String = "";
    let internet = Internet();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        anyClass = self;
        internet.buildingVIEW(); //離線狀態時 秀出警告View
        
        showRandom(); //驗證碼
        buildingImg(); //產生ImgClick
        buildingDelegate();
    }
    
    //--------------------------------------------------------------------
    
    

    //--------------------------------------------------------------------
    
    func showRandom() -> Void {
        let show = random(4);
        
        for i in 0..<4 {
            code += show[i];
        }
        
        img1.image = UIImage(named: show[0]+".png");
        img2.image = UIImage(named: show[1]+".png");
        img3.image = UIImage(named: show[2]+".png");
        img4.image = UIImage(named: show[3]+".png");
    }
    
    func random(_ arraySize: Int) -> Array<String> {
        let letters: [String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
        var available = [String]();
        
        for _ in 0..<arraySize{
            let rand = Int(arc4random_uniform(UInt32(letters.count)));
            available.append(letters[rand]);
        }
        
        return available;
    }
    
    //--------------------------------------------------------------------
    
    func buildingImg() -> Void {
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(login.rememberPW));
        singleTap.numberOfTapsRequired = 1;
        
        rememberImg.isUserInteractionEnabled = true;
        rememberImg.addGestureRecognizer(singleTap);
        
        let singleTap_agree = UITapGestureRecognizer(target: self, action: #selector(login.agreePrivate));
        singleTap_agree.numberOfTapsRequired = 1;
        agreeImg.isUserInteractionEnabled = true;
        agreeImg.addGestureRecognizer(singleTap_agree);
    }
    
    //--------------------------------------------------------------------
    
    func buildingDelegate() -> Void {
        self.accountText.delegate = self;
        self.pwText.delegate = self;
        self.codeText.delegate = self;
    }
    
    //--------------------------------------------------------------------
    
    
    @objc func rememberPW() -> Void {
        
        let bool = ImageBool(rememberImg, index: 0);
        print(bool);
        
        if (bool == false){
            rememberImg.image = UIImage(named: "rememberOK.png");
        }else{
            rememberImg.image = UIImage(named: "rememberPassword.png");
        }
    }
    
    //--------------------------------------------------------------------
    
    @objc func agreePrivate() -> Void {
        
        let bool = ImageBool(agreeImg , index: 0);
        print(bool);
        
        if (bool == false){
            agreeImg.image = UIImage(named: "agreeOK.png");
        }else{
            agreeImg.image = UIImage(named: "agree.png");
        }
        
    }
    
    //--------------------------------------------------------------------
    
    func ImageBool(_ ImgName: UIImageView , index: Int) -> Bool {
        
        let ImgTag = ImgName.tag;
        var bool = Bool();
        
        if(ImgTag == 0){
            bool = false;
        }else{
            bool = true;
        }
        
        switch index {
        case 0:
            if(ImgTag == 0){
                ImgName.tag = 1;
            }else{
                ImgName.tag = 0;
            }
            break;
            
        case 1:
            print(index);
            break;
            
        default:
            break;
        }
        
        return bool;
    }
    
    //--------------------------------------------------------------------
    
    
    @IBAction func LogInClick(_ sender: Any) {
        let agreeBool = ImageBool(agreeImg, index: 1);
        if(agreeBool == true){
            
            Login("login");
            
        }else{
            
            showMessage("同意未勾選");
            return;
        }
    }
    
    func replacing(_ string: String) -> String {
        
        let stringTo = string.replacingOccurrences(of: " ", with: "");
        return stringTo;
        
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
        accountText.resignFirstResponder();
        pwText.resignFirstResponder();
        codeText.resignFirstResponder();
        
        return(true);
    }
    
    //--------------------------------------------------------------------
    //登入判斷
    
    func Login(_ file: String ) -> Void{
        
        let postString = "account=\(accountText.text!)&password=\(pwText.text!)";
        let url = URL(string: "http://172.20.10.3:8080/swiftProject/\(file).php");
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
                            let codeString = self.replacing(self.codeText.text!);
                            
                            if (codeString == self.code){
                                self.showMessage("登入成功");
                            }else{
                                self.showMessage("驗證碼錯誤");
                            }
                        }else if(errorStatus == 2){
                            self.showMessage("帳號或密碼有錯誤");
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
    
    //--------------------------------------------------------------------
    //PHP DATABASE CONNECTION
    
    
    
    
    
    //--------------------------------------------------------------------
    
    /* override func didReceiveMemoryWarning() {
     super.didReceiveMemoryWarning()
     // Dispose of any resources that can be recreated.
     } */
    
    
}
