//
//  UserNetwork.swift
//  Generic_Network
//
//  Created by Donia Elshenawy on 23/07/2022.
//

import Foundation
import Alamofire

enum UserNetwork{
    case getUser
    
    case createUser(name : String, job : String)
}

extension UserNetwork : TargetType{
    
    var baseURL: String {
        switch self{
        default:
            return "https://reqres.in/api"
        }
    }
    
    var path: String {

        switch self {
        case .getUser:
            return "/users"
        case .createUser:
            return "/users"
        
        }
    }
    
    var task: Task {
        switch self {
        case .getUser:
            return .requestPlain
        case .createUser(name: let name, job: let job):
            return .reqestParamter(parameters: [name: name,job: job], encoding: JSONEncoding.default)
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getUser:
            return .get
        case .createUser(name: let name, job: let job):
            return .post
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
      
        }
    }
    
    
    
}
