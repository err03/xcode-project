//
//  BiliBiliProject1App.swift
//  BiliBiliProject1
//
//  Created by error on 2022/4/19.
//

import SwiftUI
import UserNotifications

@main
struct BiliBiliProject1App: App {
    let persistenceController = PersistenceController.shared
    @Environment(\.scenePhase) var scenePhase

    init(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]) { success, error in
            if success{
                print("UserNotifications center success")
            }
            if error != nil{
                print("UserNotifications center fail:\(String(describing: error))")
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }.onChange(of: scenePhase) { newValue in
            switch newValue{
            case.active:
                print("App LifeCycle active")
            case .inactive:
                print("App LifeCycle inactive")
            case .background:
                print("App LifeCycle background")
            @unknown default:
                print("App LifeCycle unknown")
            }
        }//onChange
    }//body
}
