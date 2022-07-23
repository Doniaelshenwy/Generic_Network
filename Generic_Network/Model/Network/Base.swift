//
//  Base.swift
//  Generic_Network
//
//  Created by Donia Elshenawy on 23/07/2022.
//

import Foundation
import Alamofire


class Base<T : TargetType>{
    
    let statusCode = [] + (200 ..< 300).reversed() + (400 ..< 500).reversed()
    
    func fetchData< M : Decodable >(target : T, response : M.Type, Completion: @escaping (Result<M?,NSError>)-> Void){
        
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        let params = buildParameter(task: target.task)
        
        AF.request(target.baseURL + target.path, method: method, parameters: params.0, encoding: params.1, headers: headers).validate(statusCode: statusCode).responseJSON { response in
            
            guard let statusCode = response.response?.statusCode else {
                let message = "Error Parse from Back End"
                let error = NSError(domain: target.baseURL, code: 0, userInfo: [NSLocalizedDescriptionKey : message])
                
                Completion(.failure(error))
                return  }
            
            if statusCode == 200{
                 
                if let data = response.data{
                    let decodedData = try?JSONDecoder().decode(M.self, from: data)
                    
                    Completion(.success(decodedData))
                }
                
                if let error = response.error{
                    let nsError = NSError(domain: target.baseURL, code: 0, userInfo: [NSLocalizedDescriptionKey: ErrorHandeling().errorMessage])
                }
            }
            
            
        }
        
    }
    
    private func buildParameter(task : Task) -> ([String : Any], ParameterEncoding){
        
        switch task {
        case .requestPlain:
            return ([:], URLEncoding.default)
        case .reqestParamter(let parameters, let encoding):
            return (parameters,encoding)
        }
    }
    
}
