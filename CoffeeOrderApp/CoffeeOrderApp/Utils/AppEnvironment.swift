//
//  AppEnvironment.swift
//  CoffeeOrderApp
//
//  Created by Anton Kramarenko on 6/18/24.
//

import Foundation

enum EndPoints {
    case allOrders
    
    var path: String {
        switch self {
        case .allOrders:
            return "/test/orders"
        }
    }
}

struct Configuration {
    
    lazy var environment: AppEnvironment = {

        //read value from environment variable
        guard let env = ProcessInfo.processInfo.environment["ENV"] else {
            return AppEnvironment.dev
        }
        
        if env == "TEST" {
            return AppEnvironment.test
        }
        
        return AppEnvironment.dev
    }()
}

enum AppEnvironment: String {
    case dev
    case test
    
    var baseURL: URL {
        switch self {
        case .dev:
            return URL(string: "https://island-bramble.glitch.me/test/orders")!
        case .test:
            return URL(string: "https://island-bramble.glitch.me/test/orders")!

        }
    }
}
