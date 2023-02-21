//
//  LineApp.swift
//  Line
//
//  Created by Hind on 14/07/1444 AH.
//

//2
//import SwiftUI
//import Firebase
//import FirebaseCore
//import FirebaseMessaging
//
//@main
//struct LineApp: App {
//
////    init () {
////        FirebaseApp.configure()
////    }
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}
//
//
//// MARK: Setting Up Firebase
//class AppDelegate: NSObject,UIApplicationDelegate{
//    let gemMessageIDKey = "gcm.Message_ID"
//
//
//func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//    FirebaseApp.configure()
//
//    //push notification
//
//    UNUserNotificationCenter.current().delegate = self
//
//    let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
//    UNUserNotificationCenter.current().requestAuthorization(
//      options: authOptions,
//      completionHandler: { _, _ in }
//    )
//
//    application.registerForRemoteNotifications()
//    //messaging delegate
//    Messaging.messaging().delegate = self
//
//
//
//    //kkkkkkkkkkk
//    return true
//}
//// MARK: Setting Up Firebase
//
//
//    // Since OTP requires Remote Notification
//    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) async ->
//    UIBackgroundFetchResult {
//        return .noData
//    }
//}
//
////extension AppDelegate : UNUserNotificationCenterDelegate{
////
////}
//
//extension AppDelegate: UNUserNotificationCenterDelegate {
//  // Receive displayed notifications for iOS 10 devices.
//  func userNotificationCenter(_ center: UNUserNotificationCenter,
//                              willPresent notification: UNNotification) async
//    -> UNNotificationPresentationOptions {
//    let userInfo = notification.request.content.userInfo
//
//    // With swizzling disabled you must let Messaging know about the message, for Analytics
//    // Messaging.messaging().appDidReceiveMessage(userInfo)
//
//    // ...
//
//    // Print full message.
//    print(userInfo)
//
//    // Change this to your preferred presentation option
//    return [[.alert, .sound]]
//  }
//
//  func userNotificationCenter(_ center: UNUserNotificationCenter,
//                              didReceive response: UNNotificationResponse) async {
//    let userInfo = response.notification.request.content.userInfo
//
//    // ...
//
//    // With swizzling disabled you must let Messaging know about the message, for Analytics
//    // Messaging.messaging().appDidReceiveMessage(userInfo)
//
//    // Print full message.
//    print(userInfo)
//  }
//
//    func application(_ application: UIApplication,
//                     didReceiveRemoteNotification userInfo: [AnyHashable: Any]) async
//      -> UIBackgroundFetchResult {
//      // If you are receiving a notification message while your app is in the background,
//      // this callback will not be fired till the user taps on the notification launching the application.
//      // TODO: Handle data of notification
//
//      // With swizzling disabled you must let Messaging know about the message, for Analytics
//      // Messaging.messaging().appDidReceiveMessage(userInfo)
//
//      // Print message ID.
//      if let messageID = userInfo[gcmMessageIDKey] {
//        print("Message ID: \(messageID)")
//      }
//
//      // Print full message.
//      print(userInfo)
//
//      return UIBackgroundFetchResult.newData
//    }
//
//
//
//
//}
//
//extension AppDelegate: MeesagingDelegate {
//    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
//      print("Firebase registration token: \(String(describing: fcmToken))")
//
//      let dataDict: [String: String] = ["token": fcmToken ?? ""]
//      NotificationCenter.default.post(
//        name: Notification.Name("FCMToken"),
//        object: nil,
//        userInfo: dataDict
//      )
//      // TODO: If necessary send token to application server.
//      // Note: This callback is fired at each app startup and whenever a new token is generated.
//    }
//
//}


//3
//import SwiftUI
//import Firebase
//import FirebaseCore
//import FirebaseMessaging
//@main
//struct LineApp: App {
//
////    init () {
////        FirebaseApp.configure()
////    }
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}
//
//
//// MARK: Setting Up Firebase
//class AppDelegate: NSObject,UIApplicationDelegate{
//
//    let gomMessageIDKey = "gcm.Message_ID"
//
//    func application(_ application: UIApplication,
//        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//      Messaging.messaging().apnsToken = deviceToken;
//    }
//
//
//func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//    FirebaseApp.configure()
//
//
//    UNUserNotificationCenter.current().delegate = self
//
//    let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
//    UNUserNotificationCenter.current().requestAuthorization(
//      options: authOptions,
//      completionHandler: { _, _ in }
//    )
//
//    application.registerForRemoteNotifications()
//
//    Messaging.messaging().delegate = self
//
//
//    return true
//}
//// MARK: Setting Up Firebase
//
//
//    // Since OTP requires Remote Notification
//    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) async ->
//    UIBackgroundFetchResult {
//        return .noData
//    }
//}
//
//extension AppDelegate: UNUserNotificationCenterDelegate {
//  // Receive displayed notifications for iOS 10 devices.
//  func userNotificationCenter(_ center: UNUserNotificationCenter,
//                              willPresent notification: UNNotification) async
//    -> UNNotificationPresentationOptions {
//    let userInfo = notification.request.content.userInfo
//
//    // With swizzling disabled you must let Messaging know about the message, for Analytics
//    // Messaging.messaging().appDidReceiveMessage(userInfo)
//
//    // ...
//
//    // Print full message.
//    print(userInfo)
//
//    // Change this to your preferred presentation option
//    return [[.alert, .sound]]
//  }
//
//  func userNotificationCenter(_ center: UNUserNotificationCenter,
//                              didReceive response: UNNotificationResponse) async {
//    let userInfo = response.notification.request.content.userInfo
//
//    // ...
//
//    // With swizzling disabled you must let Messaging know about the message, for Analytics
//    // Messaging.messaging().appDidReceiveMessage(userInfo)
//
//    // Print full message.
//    print(userInfo)
//  }
//
//     func applicationn(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) async
//      -> UIBackgroundFetchResult {
//      // If you are receiving a notification message while your app is in the background,
//      // this callback will not be fired till the user taps on the notification launching the application.
//      // TODO: Handle data of notification
//
//      // With swizzling disabled you must let Messaging know about the message, for Analytics
//      // Messaging.messaging().appDidReceiveMessage(userInfo)
//
//      // Print message ID.
//      if let messageID = userInfo[gcmMessageIDKey] {
//        print("Message ID: \(messageID)")
//      }
//
//      // Print full message.
//      print(userInfo)
//
//      return UIBackgroundFetchResult.newData
//    }
//
//
//}
//extension AppDelegate: MessagingDelegate {
//    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
//      print("Firebase registration token: \(String(describing: fcmToken))")
//
//      let dataDict: [String: String] = ["token": fcmToken ?? ""]
//      NotificationCenter.default.post(
//        name: Notification.Name("FCMToken"),
//        object: nil,
//        userInfo: dataDict
//      )
//      // TODO: If necessary send token to application server.
//      // Note: This callback is fired at each app startup and whenever a new token is generated.
//    }
//
//}








//final--------
//import SwiftUI
//import Firebase
////import FirebaseCore
////import FirebaseMessaging
//@main
//struct LineApp: App {
//
////    init () {
////        FirebaseApp.configure()
////    }
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}
//
//
//// MARK: Setting Up Firebase
//class AppDelegate: NSObject,UIApplicationDelegate{
//
//func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//    FirebaseApp.configure()
//    return true
//}
//// MARK: Setting Up Firebase
//
//
//    // Since OTP requires Remote Notification
//    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) async ->
//    UIBackgroundFetchResult {
//        return .noData
//    }
//}
//-----------------------



//
//import SwiftUI
//import Firebase
//import UserNotifications
//import FirebaseMessaging
//@main
//struct LineApp: App {
//
////    init () {
////        FirebaseApp.configure()
////    }
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}
//
//
//// MARK: Setting Up Firebase
//class AppDelegate: NSObject,UIApplicationDelegate{
//    let gemMessageIDKey = "gcm.message_id"
//func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//    FirebaseApp.configure()
//
//    Messaging.messaging().delegate = self
//
//    UNUserNotificationCenter.current().delegate = self
//
//    let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
//    UNUserNotificationCenter.current().requestAuthorization(
//      options: authOptions,
//      completionHandler: { _, _ in }
//    )
//
//    application.registerForRemoteNotifications()
//
//    return true
//}
//// MARK: Setting Up Firebase
//
//    // Since OTP requires Remote Notification
//    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) async ->
//    UIBackgroundFetchResult {
//        return .noData
//
//        // Print message ID.
//        if let messageID = userInfo[gcmMessageIDKey] {
//          print("Message ID: \(messageID)")
//        }
//
//        // Print full message.
//        print(userInfo)
//
//        return UIBackgroundFetchResult.newData
//    }
//
//}
//
//extension AppDelegate: MessagingDelegate{
//    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
//     // print("Firebase registration token: \(String(describing: fcmToken))")
//
//      let dataDict: [String: String] = ["token": fcmToken ?? ""]
//        print(dataDict)
////      NotificationCenter.default.post(
////        name: Notification.Name("FCMToken"),
////        object: nil,
////        userInfo: dataDict )
//      // TODO: If necessary send token to application server.
//      // Note: This callback is fired at each app startup and whenever a new token is generated.
//    }
//
//}
//extension AppDelegate: UNUserNotificationCenterDelegate{}





import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseMessaging
import UserNotificationsUI
@main
struct LineApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


// MARK: Setting Up Firebase
class AppDelegate: NSObject,UIApplicationDelegate{
       let gcmMessageIDKey = "gcm.message_id"

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    Messaging.messaging().delegate = self
    
    if #available(iOS 10.0, *) {
    // For iOS 10 display notification (sent via APNS)
    UNUserNotificationCenter.current().delegate = self
    let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
    UNUserNotificationCenter.current().requestAuthorization(
    options: authOptions,
    completionHandler: {_, _ in })
    } else {
    let settings: UIUserNotificationSettings =
    UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
    application.registerUserNotificationSettings(settings)
    }
    application.registerForRemoteNotifications()

    
    return true
}
// MARK: Setting Up Firebase


    // Since OTP requires Remote Notification
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) async ->
    UIBackgroundFetchResult {
        return .noData
        
        if let messageID = userInfo[gcmMessageIDKey] {
        print("Message ID: \(messageID)")
        }
        // Print full message.
        print(userInfo)
    }
    //________________________________________________________
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken
                     deviceToken: Data) {
        let deviveTokenString = deviceToken.hexString
        print (deviveTokenString)
        UserDefaults.standard.set(deviveTokenString, forKey: "TokenUser")
//        let userToken = UserDefaults.standard.string(forKey: "TokenUser")
    }
    //________________________________________________________

    
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        if Auth.auth().canHandle(url) {
            return true
        }
        return false
    }
    
}
extension AppDelegate: MessagingDelegate{
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
      //  print("Firebase registration token: \(String(describing: fcmToken))")
        let dataDict:[String: String] = ["token": fcmToken ?? ""]
        print (dataDict)
        
  //  NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
    // TODO: If necessary send token to application server.
    // Note: This callback is fired at each app startup and whenever a new token is generated.
    }
}

@available(iOS 10, *)
extension AppDelegate : UNUserNotificationCenterDelegate {
// Receive displayed notifications for iOS 10 devices.
func userNotificationCenter(_ center: UNUserNotificationCenter,
willPresent notification: UNNotification,
withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
let userInfo = notification.request.content.userInfo
// With swizzling disabled you must let Messaging know about the message, for Analytics
// Messaging.messaging().appDidReceiveMessage(userInfo)
// Print message ID.
if let messageID = userInfo[gcmMessageIDKey] {
print("Message ID: \(messageID)")
}
// Print full message.
print(userInfo)
// Change this to your preferred presentation option
completionHandler([[.alert, .sound,.badge]])
}
func userNotificationCenter(_ center: UNUserNotificationCenter,
didReceive response: UNNotificationResponse,
withCompletionHandler completionHandler: @escaping () -> Void) {
let userInfo = response.notification.request.content.userInfo
// Print message ID.
if let messageID = userInfo[gcmMessageIDKey] {
print("Message ID: \(messageID)")
}
// Print full message.
print(userInfo)
completionHandler()
}
}

extension Data{
    var hexString : String {
        let hexString = map { String(format: "%0.2hhx", $0)}.joined()
        return hexString
    }
}
