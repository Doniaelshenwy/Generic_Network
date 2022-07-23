//
//  UserAPI.swift
//  Generic_Network
//
//  Created by Donia Elshenawy on 23/07/2022.
//

import Foundation


class UserAPI : Base<UserNetwork>{
    
    func getUser (compilation :@escaping (Result<ResponseModel<[UserModel]>?, NSError>) -> Void){
        
        self.fetchData(target: .getUser, response: ResponseModel<[UserModel]>.self) { result in
            compilation(result)
        }
        
    }
    
}
