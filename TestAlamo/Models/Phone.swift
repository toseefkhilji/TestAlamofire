//
//  Phone.swift
//  TestAlamo
//
//  Created by Toseefhusen Khilji on 9/22/17.
//  Copyright © 2017 Toseefhusen Khilji. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Phone{
    
    var home : String!
    var mobile : String!
    var office : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        home = dictionary["home"] as? String
        mobile = dictionary["mobile"] as? String
        office = dictionary["office"] as? String
    }
    
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        home = json["home"].stringValue
        mobile = json["mobile"].stringValue
        office = json["office"].stringValue
    }
    
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if home != nil{
            dictionary["home"] = home
        }
        if mobile != nil{
            dictionary["mobile"] = mobile
        }
        if office != nil{
            dictionary["office"] = office
        }
        return dictionary
    }
    
}
