//
//  TargetType.swift
//  Generic_Network
//
//  Created by Donia Elshenawy on 23/07/2022.
//

import Foundation
import Alamofire


enum HTTPMethod : String{
    
   case get = "GET"
    
   case post = "POST"
    
   case put = "PUT"
    
   case delete = "DELETE"
    
}

enum Task{
    
    case requestPlain
    
    case reqestParamter(parameters: [String : Any], encoding: ParameterEncoding)
    
}

protocol TargetType{
    
    var baseURL : String {get}
    
    var path : String {get}
    
    var task : Task {get}
    
    var method : HTTPMethod {get}
    
    var headers : [String : String]? {get}
    
}

