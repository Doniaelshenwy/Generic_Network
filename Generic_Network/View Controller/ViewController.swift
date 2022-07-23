//
//  ViewController.swift
//  Generic_Network
//
//  Created by Donia Elshenawy on 23/07/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let api = UserAPI()
        
        api.getUser { result in
            
            switch result {
            case .success(let response):
                if let data = response?.data{
                    for user in data{
                        print("\(user.first_name) \(user.last_name)")
                    }
                }
                
            case .failure(let error):
                print(error)
            
            
            }
        }
        
    }


}

