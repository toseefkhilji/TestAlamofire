//
//  APIRouter.swift
//  TestAlamo
//
//  Created by Toseefhusen Khilji on 9/22/17.
//  Copyright © 2017 Toseefhusen Khilji. All rights reserved.
//

import Foundation
import Alamofire

struct BaseURL {
    static let Development = "https://api.androidhive.info"
    static let Staging = "http://stag.server.com"
    static let Production = "http://prod.server.com"
}

enum APIRouter: URLRequestConvertible {
    
    // Set Base URL
    static let baseURL = BaseURL.Development
    
    // Methods
    case login(param : Parameters)
    case createUser(parameters: Parameters)
    case getAllContacts()
    case getAboutUs()
    case searchProduct(search: String)

    // Set HTTP method type
    var method: HTTPMethod {
        switch self {
        case .login, .createUser, .searchProduct:
            return .post
            
        case .getAllContacts , .getAboutUs:
            return .get
        }
    }
    
    // set Path for API
    var path: String {
        switch self {
        case .login:
            return "users/login"
        case .createUser:
            return "users/create"
        case .searchProduct:
            return "product/search"
        case .getAllContacts:
            return "/contacts/"
        case .getAboutUs:
            return "/home/aboutUs"
        }
    }
    
    // MARK: URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        let url = try APIRouter.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .login(let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            
        case .createUser(let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
       
        default:
            break
        }
        return urlRequest
    }
}
