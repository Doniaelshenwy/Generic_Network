//
//  ResponseModel.swift
//  Generic_Network
//
//  Created by Donia Elshenawy on 23/07/2022.
//

import Foundation

struct ResponseModel<T : Codable> : Codable{
    
    var page : Int
    var per_page : Int
    var total : Int
    var total_pages : Int
    var data : T?
    
}
