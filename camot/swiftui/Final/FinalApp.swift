//
//  FinalApp.swift
//  Final
//
//  Created by error on 2020/11/18.
//

import SwiftUI

@main
struct FinalApp: App {
    var cart = Cart()
    var categories = Categories()
    var valid = validCheckout()
    var user = UserAccount()
    var orderhistroy = OrderHistory()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(cart)
                .environmentObject(categories)
                .environmentObject(valid)
                .environmentObject(user)
                .environmentObject(orderhistroy)
        }
    }
}
