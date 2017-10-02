//
//  Environment.swift
//  TestAlamo
//
//  Created by Toseefhusen Khilji on 9/22/17.
//  Copyright © 2017 Toseefhusen Khilji. All rights reserved.
//


internal enum Environment {
    case dev
    case staging
    case production

    fileprivate static let current: Environment = .dev
//    fileprivate static let current: Environment = .staging
//    fileprivate static let current: Environment = .production
    
}

internal extension Environment {
    static var baseAPI: String {
        switch Environment.current {
        case .dev: return "https://newsapi.org/v1"
        case .staging: return "https://newsapi.org/v1"
        case .production: return "https://newsapi.org/v1"
        }
    }

    static var apiToken: String {
        switch Environment.current {
        case .staging, .production , .dev : return "fa3b7ea95a604e62b3ef9f986daf4092"
        }
    }
}
