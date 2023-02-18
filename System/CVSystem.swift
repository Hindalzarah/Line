//
//  CVSystem.swift
//  Line
//
//  Created by Raniyah Alotaibi on 26/07/1444 AH.
//

import SwiftUI

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
struct Home: View{
    @State var titleText = ""
    @State var bodyText = ""
    // Fetch from Fires=""
    @State var deviceToken = ""
     
    var body: some View{
        NavigationView{
            List{
                Section{
                    TextField("", text: $titleText)
                } header: {
                    Text("Message Title")
                }
                Section{
                    TextField("", text: $bodyText)
                } header: {
                    Text("Message Body")
                }
                Section{
                    TextField("", text: $deviceToken)
                } header: {
                    Text("Device Token")
                }
                Button{
                    sendMessageToDevice()
                } label: {
                    Text("send push notification")
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Push Notification")
        }
    

    }
    func sendMessageToDevice (){
        guard let url = URL(string: "https://fcm.googleapis.com/fcm/send") else{
            return
        }
        let json: [String: Any] = [
            
            "to": deviceToken,
            "notification":[
            
            "title": titleText,
            "body": bodyText
        ],
        "data": [
            
            "user_name": "ijustine"
    
        ]
            ]
        let serverKey = "AAAAfcZecZo:APA91bHVNoJen1MGaL_Z7LFj3Q9gs-6CgxkXgFBu-YotGlOdP71FJVFwaNB4hV3re68Xyir-FkCO2_As0mt08qfPR_HCsGoC9bgwEc_mboQ7mYQDCbbv0ylV-szTfXinEXaiWGz0c_tj"
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: json, options:[.prettyPrinted])
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
      request.setValue("key=\(serverKey)", forHTTPHeaderField:"Authorization")
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: request) { _, _, err in
            if let err = err{
                print(err.localizedDescription)
                 return
                
            }
             
            print("Success")
            DispatchQueue.main.async {[self] in
                titleText = ""
                bodyText = ""
                deviceToken = ""
                 
            }
        }
        .resume()
    }
}


