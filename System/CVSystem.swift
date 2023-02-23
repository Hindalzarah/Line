//
//  CVSystem.swift
//  Line
//
//  Created by Raniyah Alotaibi on 26/07/1444 AH.
//

import SwiftUI
import UserNotifications
import Firebase

struct CVSystem: View {
   
    var body: some View {
        Home()
    }
}

struct CVSystem_Previews: PreviewProvider {
    static var previews: some View {
        CVSystem()
    }
}
//struct Home: View{
//    @State var titleText = ""
//    @State var bodyText = ""
//    // Fetch from Fires=""
//    @State var deviceToken = ""
//
//    var body: some View{
//        NavigationView{
//            List{
//                Section{
//                    TextField("", text: $titleText)
//                } header: {
//                    Text("Message Title")
//                }
//                Section{
//                    TextField("", text: $bodyText)
//                } header: {
//                    Text("Message Body")
//                }
//                Section{
//                    TextField("", text: $deviceToken)
//                } header: {
//                    Text("Device Token")
//                }
//
//
//                Button{
//                    sendMessageToDevice()
//                } label: {
//                    Text("send push notification")
//                }
//            }
//            .listStyle(.insetGrouped)
//            .navigationTitle("Push Notification")
//        }
//
//
//    }
//    func sendMessageToDevice (){
//
//
//        guard let url = URL(string: "https://fcm.googleapis.com/fcm/send") else{
//            return
//        }
//        let json: [String: Any] = [
//
//            "to": deviceToken,
//            "notification":[
//
//            "title": titleText,
//            "body": bodyText
//        ],
//        "data": [
//
//            "user_name": "ijustine"
//
//        ]
//            ]
//        let serverKey = "AAAAfcZecZo:APA91bHVNoJen1MGaL_Z7LFj3Q9gs-6CgxkXgFBu-YotGlOdP71FJVFwaNB4hV3re68Xyir-FkCO2_As0mt08qfPR_HCsGoC9bgwEc_mboQ7mYQDCbbv0ylV-szTfXinEXaiWGz0c_tj"
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.httpBody = try? JSONSerialization.data(withJSONObject: json, options:[.prettyPrinted])
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//      request.setValue("key=\(serverKey)", forHTTPHeaderField:"Authorization")
//        let session = URLSession(configuration: .default)
//
//        session.dataTask(with: request) { _, _, err in
//            if let err = err{
//                print(err.localizedDescription)
//                 return
//
//            }
//
//            print("Success")
//            DispatchQueue.main.async {[self] in
//                titleText = ""
//                bodyText = ""
//                deviceToken = ""
//
//            }
//        }
//        .resume()
//    }
//}









//struct Home: View{
//    var body: some View{
//        ZStack{
//            Button(action: {
//                self.send()
//            }){
//                Text("send notification")
//            }
//        }
//    }
//    func send(){
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (_, _) in
//        }
//        let content = UNMutableNotificationContent ()
//        content.title = "Message"
//        content.body = "New Tutorial From Kavsoft !!!"
//
//        let trigger = UNTimeIntervalNotificationTrigger (timeInterval: 5, repeats: false)
//        let req = UNNotificationRequest(identifier: "req", content: content, trigger: trigger)
//        UNUserNotificationCenter.current () .add(req, withCompletionHandler: nil)
//    }
//
//}




struct Home: View{

    //self.sendPushNotification(payloadDict: notifPayload)

    var body: some View{

        ZStack{

            Button(action: {
                let userToken = UserDefaults.standard.string(forKey: "TokenUser")
                self.sendPushNotification(to: userToken ?? "", title: "You got a new meassage.", message: "This message is sent for you")
            }){
                Text("send notification")
            }
        }
    }
    func sendPushNotification(to: String,title: String, message:String) {
        let notifPayload: [String: Any] =
        ["to": to,"notification": ["title":title,"body":message,"badge":1,"sound":"default"]]
       let url = URL(string: "https://fcm.googleapis.com/fcm/send")!
       var request = URLRequest(url: url)
       request.setValue("application/json", forHTTPHeaderField: "Content-Type")
       // get your **server key** from your Firebase project console under **Cloud Messaging** tab
       request.setValue("AAAAfcZecZo:APA91bHVNoJen1MGaL_Z7LFj3Q9gs-6CgxkXgFBu-YotGlOdP71FJVFwaNB4hV3re68Xyir-FkCO2_As0mt08qfPR_HCsGoC9bgwEc_mboQ7mYQDCbbv0ylV-szTfXinEXaiWGz0c_tj", forHTTPHeaderField: "Authorization")
       request.httpMethod = "POST"
       request.httpBody = try? JSONSerialization.data(withJSONObject: notifPayload, options: [])
       let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data, error == nil else {
            print(error ?? "")
            return
          }
          if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
            print("statusCode should be 200, but is \(httpStatus.statusCode)")
            print(response ?? "")
          }
          print("Notfication sent successfully.")
          let responseString = String(data: data, encoding: .utf8)
          print(responseString ?? "")
       }
       task.resume()
    }
   
}



//
//struct Home: View{
//
//    var body: some View{
//        ZStack{
//
//            Button(action: {
//                self.send()
//            }){
//                Text("send notification")
//            }
//        }
//    }
//        func send(){
//            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (_, _) in
//            }
//            let content = UNMutableNotificationContent ()
//            content.title = "Message"
//            content.body = "New Tutorial From Kavsoft !!!"
//
//            let trigger = UNTimeIntervalNotificationTrigger (timeInterval: 5, repeats: false)
//            let req = UNNotificationRequest(identifier: "req", content: content, trigger: trigger)
//            UNUserNotificationCenter.current () .add(req, withCompletionHandler: nil)
//        }
//}
