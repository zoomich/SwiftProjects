//
//  CoffeeModel.swift
//  CoffeeOrderApp
//
//  Created by Anton Kramarenko on 6/18/24.
//

import Foundation

@MainActor
class CoffeeModel: ObservableObject {
    let webservice: Webservice
    @Published private(set) var orders: [Order] = []
    
    init(webservice: Webservice) {
        self.webservice = webservice
    }
    
    func pupulateOrders() async throws {
        orders = try await webservice.getOrders()
    }
}
