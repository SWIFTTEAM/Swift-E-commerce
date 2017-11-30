//
//  registered2.swift
//  Ecommerce
//
//  Created by zinfu on 2017/11/29.
//  Copyright © 2017年 Ecommerce. All rights reserved.
//

import UIKit

class registered2: UIViewController ,UITextFieldDelegate{

    var rAccount:String!;
    var rPasswordText:String!;
    var rName:String!;
    var rMail:String!;
    var rID:String!;
    var rPhone:String!;
    @IBOutlet weak var rAdrress: UITextField!
    @IBOutlet weak var rMAdrress: UITextField!
    @IBOutlet weak var rCountry: UITextField!
    @IBOutlet weak var rCompany: UITextField!
    
    //var str:String!;
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        anyClass = self;
        
        buildingDelegate();
        print("build ok");
        print(rAccount);
        print(rPasswordText);
        print(rName);
        print(rMail);
        print(rID);
        print(rPhone);
        print("copy");
    }
    
    func buildingDelegate() -> Void {
        
        self.rAdrress.delegate = self;
        self.rMAdrress.delegate = self;
        self.rCountry.delegate = self;
        self.rCompany.delegate = self;
        
    }
    @IBAction func RegisterClick(_ sender: UIButton) {
        print("reg");
        Register("registered2")
        print("reg2");
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
    
    //--------------------------------------------------------------------
    
    func showMessage(_ string: String) -> Void {
        
        let myAlert: UIAlertController = UIAlertController(title: "System Messgae", message: string, preferredStyle: .alert);
        let action = UIAlertAction(title: "關閉", style: UIAlertActionStyle.default, handler: {action in print("done")});
        myAlert.addAction(action);
        self.present(myAlert, animated: true, completion: nil);
        
    }
    
    
    
     func Register(_ file: String ) -> Void{
     
         let postString = "account=\(rAccount)&password=\(rPasswordText)&name=\(rName)&mail=\(rMail)&identity=\(rID)&phone=\(rPhone)&residenaddress=\(rAdrress.text!)&mailingaddress=\(rMAdrress.text!)&country=\(rCountry.text!)&company=\(rCompany.text!)";
         let url = URL(string: "http://192.168.9.129:8080/swiftProject/\(file).php");
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
     

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
