//
//  UserModel.swift
//  Generic_Network
//
//  Created by Donia Elshenawy on 23/07/2022.
//

import Foundation


struct UserModel : Codable{
    
    var id : Int
    var email : String
    var first_name : String
    var last_name : String
    var avatar : String
}
