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
        
        
    }
}
