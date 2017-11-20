//
//  login.swift
//  Ecommerce
//
//  Created by 黃仕杰 on 2017/10/26.
//  Copyright © 2017年 Ecommerce. All rights reserved.
//

import UIKit

class login: UIViewController, UITextFieldDelegate{
    
    @IBOutlet var VIEW: UIView!;
    var DynamicView: UIView!;
    
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
    
    let reachability = Reachability()!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        buildingVIEW(); //離線狀態時 秀出警告View
        ReachabilityInternet(); //檢察網路狀態
        showRandom(); //驗證碼
        buildingImg(); //產生ImgClick
        buildingDelegate();
    }
    
    //--------------------------------------------------------------------
    
    func buildingVIEW() -> Void {
        DynamicView = UIView(frame: CGRect(x:0 ,y:-50 ,width:self.view.bounds.size.width ,height: 50));
        DynamicView.backgroundColor = UIColor.red;
        DynamicView.alpha = 0.8;
        self.view.addSubview(DynamicView);
    }
    
    func OnOffLine(_ status: Int) -> Void {
        print("OffOnline");
        
        if #available(iOS 10.0, *) {
            Timer.scheduledTimer(withTimeInterval: 0.01, repeats:
                true, block: {(timer) -> Void in
                    
                    switch(status){
                    case 0:
                        if self.DynamicView.frame.origin.y > 0 {
                            timer.invalidate();
                        } else {
                            self.DynamicView.frame = self.DynamicView.frame.offsetBy(dx: 0, dy: 1);
                        }
                        break;
                    case 1:
                        if self.DynamicView.frame.origin.y < -50 {
                            timer.invalidate();
                        } else {
                            self.DynamicView.frame = self.DynamicView.frame.offsetBy(dx: 0, dy: -1);
                        }
                        break;
                    default:
                        break;
                    }
                    
            })
        }
    }
    
    //--------------------------------------------------------------------
    
    func ReachabilityInternet() -> Void {
        reachability.whenReachable = { _ in
            DispatchQueue.main.async {
                print("green1");
                self.view.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1);
            }
        }
        reachability.whenUnreachable = { _ in
            DispatchQueue.main.async {
                print("red1");
                self.view.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1);
            }
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(internetChanged), name: ReachabilityChangedNotification, object: reachability);
        do{
            try reachability.startNotifier();
        }catch{
            print("could not start reachability");
            return;
        }
    }
    
    @objc func internetChanged(note: Notification) -> Void {
        let reachability = note.object as! Reachability;
        
        if reachability.isReachable {
            if reachability.isReachableViaWiFi{
                DispatchQueue.main.async {
                    print("green_wifi");
                    self.OnOffLine(1);
                    self.view.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1);
                }
            }else{
                DispatchQueue.main.async {
                    print("yello_internet");
                    self.OnOffLine(1);
                    self.view.backgroundColor = #colorLiteral(red: 0.9948318601, green: 0.9917954803, blue: 0, alpha: 1);
                }
            }
        }else{
            DispatchQueue.main.async {
                print("red");
                self.OnOffLine(0);
                self.view.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1);
            }
        }
    }
    
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
