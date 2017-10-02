//
//  APIManger.swift
//  TestAlamo
//
//  Created by Toseefhusen Khilji on 9/22/17.
//  Copyright © 2017 Toseefhusen Khilji. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias ContactCompletion = (Bool, [Contact]) -> Void
typealias Completion = (Bool, Any?) -> Void

class APIManager {
    
    class func getContacts(_ completionHandler : @escaping ContactCompletion) {
        Alamofire.request(APIRouter.getAllContacts()).print()
            .validate()
            .responseJSON { (response) in
                response.print()
                switch response.result{
                case .success(let data):
                    let json = JSON(data)
                    let arrayNames =  json["contacts"].arrayValue.map({Contact.init(fromJson: $0)})
                    completionHandler(true,arrayNames)
                case .failure(let error):
                    debugPrint(error)
                    completionHandler(false,[])
                }
        }
    }
}
