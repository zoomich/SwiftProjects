//
//  ContentView.swift
//  CoffeeOrderApp
//
//  Created by Anton Kramarenko on 6/18/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var model: CoffeeModel
    
    private func populateOrders() async {
        do {
            try await model.pupulateOrders()
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        VStack {
            List(model.orders) {order in
                OrderCellView(order: order)
            }
        }.task {
            await populateOrders()
        }
    }
}

#Preview {
    ContentView().environmentObject(CoffeeModel(webservice: Webservice()))
}
