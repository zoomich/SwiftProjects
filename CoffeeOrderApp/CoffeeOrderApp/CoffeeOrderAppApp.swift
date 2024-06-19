//
//  CoffeeOrderAppApp.swift
//  CoffeeOrderApp
//
//  Created by Anton Kramarenko on 6/18/24.
//

import SwiftUI

@main
struct CoffeeOrderAppApp: App {
    
    @StateObject private var model: CoffeeModel
    
    init() {
        let webservice = Webservice()
        _model = StateObject(wrappedValue: CoffeeModel(webservice: webservice))
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(model)
        }
    }
}
