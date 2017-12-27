//
//  index.swift
//  Ecommerce
//
//  Created by 黃仕杰 on 2017/12/14.
//  Copyright © 2017年 Ecommerce. All rights reserved.
//

import UIKit

class index: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var searchBar: UISearchBar!;
    @IBOutlet var tableView: UITableView!;
    
    var dataArray: [String : String] = [:];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self;
        tableView.delegate = self;
        tableView.dataSource = self;
        phpconnect();
    }
    
    func phpconnect() -> Void{
        let phpsql = E_Main();
        
        let setIP = NSGetValue.IP.ip;
        let setFile =  NSGetValue.Php_Files.index;
        phpsql.PHP_CONNECTION(IP: setIP, FileName: setFile) { (json) in
            print(json)
        }
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text="";
        searchBar.showsCancelButton = false;
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.showsCancelButton = true;
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return self.dataArray.count ;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "prodctCellLeft", for: indexPath) as! indexCustomCell;
        
        return cell;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

}
