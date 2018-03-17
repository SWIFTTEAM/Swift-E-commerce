//
//  shopcart.swift
//  Ecommerce
//
//  Created by 黃仕杰 on 2017/12/20.
//  Copyright © 2017年 Ecommerce. All rights reserved.
//

import UIKit

class shopcart: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!;
    var values: NSArray = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        phpconnect();
    }
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData();
    }
    
    func phpconnect() -> Void{
        let phpsql = E_Main();
        
        let setIP = NSGetValue.IP.ip;
        let setFile =  NSGetValue.Php_Files.index;
        
        phpsql.PHP_CONNECTION(IP: setIP, FileName: setFile) { (json) in
            self.values = json;
            print("self.values");
            print(self.values);
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("aaaaaaa")
        return 1;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {        
        let cell: UITableViewCell!;
        
        if(indexPath.row==0){
            cell = tableView.dequeueReusableCell(withIdentifier: "customerCell", for: indexPath) as! CustomerViewCell;
     
        }else{
            cell = tableView.dequeueReusableCell(withIdentifier: "contentCell", for: indexPath) as! ContentViewCell;
           
        }
         return cell;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func unwind(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
