//
//  LineApp.swift
//  Line
//
//  Created by Hind on 14/07/1444 AH.
//

//import SwiftUI
//import Firebase
//@main
//struct LineApp: App {
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}
//// this will set up the  firebase
//class AppDelegate: NSObject,UIApplicationDelegate{
//
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        FirebaseApp.configure()
//        return true
//    }
//    // OTP remote notifications
//    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) async -> UIBackgroundFetchResult {
//        return .noData
//    }
//}


import SwiftUI
import Firebase
//import FirebaseCore
//import FirebaseMessaging


@main
struct LineApp: App {

//    init () {
//        FirebaseApp.configure()
//    }
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


// MARK: Setting Up Firebase
class AppDelegate: NSObject,UIApplicationDelegate{

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
}
// MARK: Setting Up Firebase
 
    
    // Since OTP requires Remote Notification
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) async ->
    UIBackgroundFetchResult {
        return .noData
    }
}
