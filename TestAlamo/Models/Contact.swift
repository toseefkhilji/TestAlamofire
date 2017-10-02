//
//  Contact.swift
//  TestAlamo
//
//  Created by Toseefhusen Khilji on 9/22/17.
//  Copyright © 2017 Toseefhusen Khilji. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Contact{
    
    var address : String!
    var email : String!
    var gender : String!
    var id : String!
    var name : String!
    var phone : Phone!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        address = dictionary["address"] as? String
        email = dictionary["email"] as? String
        gender = dictionary["gender"] as? String
        id = dictionary["id"] as? String
        name = dictionary["name"] as? String
        if let phoneData = dictionary["phone"] as? [String:Any]{
            phone = Phone(fromDictionary: phoneData)
        }
    }
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        address = json["address"].stringValue
        email = json["email"].stringValue
        gender = json["gender"].stringValue
        id = json["id"].stringValue
        name = json["name"].stringValue
        let phoneJson = json["phone"]
        if !phoneJson.isEmpty{
            phone = Phone(fromJson: phoneJson)
        }
    }

    
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if address != nil{
            dictionary["address"] = address
        }
        if email != nil{
            dictionary["email"] = email
        }
        if gender != nil{
            dictionary["gender"] = gender
        }
        if id != nil{
            dictionary["id"] = id
        }
        if name != nil{
            dictionary["name"] = name
        }
        if phone != nil{
            dictionary["phone"] = phone.toDictionary()
        }
        return dictionary
    }
    
}
