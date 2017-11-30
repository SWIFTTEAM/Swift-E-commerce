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
    @IBOutlet weak var rName: UITextField!
    @IBOutlet weak var rMail: UITextField!
    @IBOutlet weak var rID: UITextField!
    @IBOutlet weak var rPhone: UITextField!
    @IBOutlet weak var rBirth: UIDatePicker!
    //@IBOutlet weak var rSex: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad();
        
        anyClass = self;
        
        buildingDelegate();
        print("build ok")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "1to2"{
                print("abc")
                let vc = segue.destination as! registered2
                vc.rAccount = rAccountText.text!
                vc.rPasswordText = rPasswordText.text!
                vc.rName = rName.text!
                vc.rMail = rMail.text!
                vc.rID = rID.text!
                vc.rPhone = rPhone.text!
            }
        
    }
    
    @IBAction func regtestclick(_ sender: UIButton) {
        print("go")
    }
    
    //--------------------------------------------------------------------
    
    func buildingDelegate() -> Void {
        self.rAccountText.delegate = self;
        self.rPasswordText.delegate = self;
        self.rName.delegate = self;
        self.rMail.delegate = self;
        self.rID.delegate = self;
        self.rPhone.delegate = self;
        
        
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
        rName.resignFirstResponder();
        rMail.resignFirstResponder();
        rID.resignFirstResponder();
        rPhone.resignFirstResponder();

        return(true);
    }
    
  
    
}

