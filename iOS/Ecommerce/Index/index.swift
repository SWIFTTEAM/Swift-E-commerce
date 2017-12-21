//
//  index.swift
//  Ecommerce
//
//  Created by 黃仕杰 on 2017/12/14.
//  Copyright © 2017年 Ecommerce. All rights reserved.
//

import UIKit

class index: UIViewController, UISearchBarDelegate {

    @IBOutlet var searchBar: UISearchBar!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self;
        
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text="";
        searchBar.showsCancelButton = false;
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.showsCancelButton = true;
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

}
