//
//  registered.swift
//  Ecommerce
//
//  Created by Bei on 2017/11/17.
//  Copyright © 2017年 Ecommerce. All rights reserved.
//

import Foundation
import UIKit

class registered: UIViewController,UITextFieldDelegate,UIPickerViewDelegate{
    
    
    @IBOutlet weak var rAccount: UITextField!
    @IBOutlet weak var rPassword: UITextField!
    @IBOutlet weak var rNameChi: UITextField!
    @IBOutlet weak var rNameEng: UITextField!
    @IBOutlet weak var rEmail: UITextField!
    @IBOutlet weak var rIdentify: UITextField!
    @IBOutlet weak var rCellPhone1: UITextField!
    @IBOutlet weak var rCellPhone2: UITextField!
    @IBOutlet weak var rCellPhone3: UITextField!
    @IBOutlet weak var rCellPhone_Spare1: UITextField!
    @IBOutlet weak var rCellPhone_Spare2: UITextField!
    @IBOutlet weak var rCellPhone_Spare3: UITextField!
    @IBOutlet weak var rHomePhone: UITextField!
    @IBOutlet weak var rResidenceAddress1: UITextField!
    @IBOutlet weak var rResidenceAddress2: UITextField!
    @IBOutlet weak var rResidenceAddress3: UITextField!
    @IBOutlet weak var rMailingAddress1: UITextField!
    @IBOutlet weak var rMailingAddress2: UITextField!
    @IBOutlet weak var rMailingAddress3: UITextField!

    @IBOutlet weak var rAddressSame: UISwitch!
    
    @IBOutlet weak var Bdate: UIDatePicker!
    @IBOutlet weak var Spicker: UIPickerView!
    @IBOutlet weak var rCountryID: UIPickerView!
    @IBOutlet weak var rCompanyID: UIPickerView!
    
    var Birth:String?
    var Sex:String?
    var Country:String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        anyClass = self;
        setSex()
        setCountry()
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
        self.rCellPhone1.delegate = self;
        self.rCellPhone2.delegate = self;
        self.rCellPhone3.delegate = self;
        self.rCellPhone_Spare1.delegate = self;
        self.rCellPhone_Spare2.delegate = self;
        self.rCellPhone_Spare3.delegate = self;
        self.rHomePhone.delegate = self;
        self.rMailingAddress1.delegate = self;
        self.rMailingAddress2.delegate = self;
        self.rMailingAddress3.delegate = self;
        self.rResidenceAddress1.delegate = self;
        self.rResidenceAddress2.delegate = self;
        self.rResidenceAddress3.delegate = self;
        

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
        rCellPhone1.resignFirstResponder();
        rCellPhone2.resignFirstResponder();
        rCellPhone3.resignFirstResponder();
        rCellPhone_Spare1.resignFirstResponder();
        rCellPhone_Spare2.resignFirstResponder();
        rCellPhone_Spare3.resignFirstResponder();
        rHomePhone.resignFirstResponder();
        rResidenceAddress1.resignFirstResponder();
        rResidenceAddress2.resignFirstResponder();
        rResidenceAddress3.resignFirstResponder();
        rMailingAddress1.resignFirstResponder();
        rMailingAddress2.resignFirstResponder();
        rMailingAddress3.resignFirstResponder();

        return(true);
    }
    //--------------------------------------------------------------------
    //date
    private func DatetoStr() -> Void{
        let date = Bdate.date
        
        // 创建一个日期格式器
        let dformatter = DateFormatter()
        // 为日期格式器设置格式字符串
        dformatter.dateFormat = "dd/MM/yyyy"
        // 使用日期格式器格式化日期、时间
        Birth = dformatter.string(from: date)
        print(Birth!)
        //Birth=datestr
    }
    
    //--------------------------------------------------------------------
    //setSexPicker

    public func setSex() -> Void{
        
     // 用來實作委任模式的方法
     let MySexSelect = SexSelect()
     
     // 必須將這個 UIViewController 加入
     self.addChildViewController(MySexSelect)
     
     // 設定 UIPickerView 的 delegate 及 dataSource
     Spicker.delegate = MySexSelect
     Spicker.dataSource = MySexSelect
        
    }
    
    func getSexValue()->Void{
        let SSVC = SexSelect()
        
        Sex=SSVC.getSexNum()
        print("sex:"+Sex!)
        
    }
    //--------------------------------------------------------------------
    //setSexPicker
    
    public func setCountry() -> Void{
        
        // 用來實作委任模式的方法
        let MyCountrySelect = CountryIdSelect()
        
        // 必須將這個 UIViewController 加入
        self.addChildViewController(MyCountrySelect)
        
        // 設定 UIPickerView 的 delegate 及 dataSource
        rCountryID.delegate = MyCountrySelect
        rCountryID.dataSource = MyCountrySelect
        
    }
    
    func getCountryValue()->Void{
        let CSVC = CountryIdSelect()
        Country=CSVC.getCountryNum()
        print("country:"+Country!)
        
    }
    //--------------------------------------------------------------------
    //登入判斷
    private func register() -> Void{
        let phpsql = E_Main();
        
        DatetoStr()
        getSexValue()
        getCountryValue()
        
    
        var postarray: [String] = [];
        postarray.append("account=\(rAccount.text!)");
        postarray.append("password=\(rPassword.text!)");
        postarray.append("namechi=\(rNameChi.text!)");
        postarray.append("nameeng=\(rNameEng.text!)");
        postarray.append("email=\(rEmail.text!)");
        postarray.append("identify=\(rIdentify.text!)");
        postarray.append("birth=\(Birth!)");
        postarray.append("cellphone=\(rCellPhone1.text!+"-"+rCellPhone2.text!+"-"+rCellPhone3.text!)");
        postarray.append("cellphone_spare=\(rCellPhone_Spare1.text!+"-"+rCellPhone_Spare2.text!+"-"+rCellPhone_Spare3.text!)");
        postarray.append("homephone=\(rHomePhone.text!)");
        postarray.append("residenceaddress=\(rResidenceAddress1.text!+"-"+rResidenceAddress2.text!+"-"+rResidenceAddress3.text!)");
        postarray.append("mailingaddress=\(rMailingAddress1.text!+"-"+rMailingAddress2.text!+"-"+rMailingAddress3.text!)");
        
        postarray.append("countryid=\(Country!)");
        
        postarray.append("sex=\(Sex!)");
        //postarray.append("companyID=\(rCompanyID.text!)");
        
        print(postarray)
        
        let poststring = phpsql.postArrToStr(postarray); // return post
        phpsql.postContent = poststring;
        
        let setIP = NSGetValue.IP.ip; // get IP
        let setFile =  NSGetValue.Php_Files.register; //get php login file
        
        phpsql.PHP_CONNECTION(IP: setIP, FileName: setFile) { (json) in
            var ToObjectArray: [String: AnyObject] = [:];
            ToObjectArray = json[0] as! [String : AnyObject] ;
            let errorStatus = Int(ToObjectArray["errorStatus"]! as! String)!;
            
            
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

