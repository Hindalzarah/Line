//
//  Settings.swift
//  Line
//
//  Created by Sara bayan alharbi on 29/07/1444 AH.

//

import SwiftUI


struct Settings: View {
    var body: some View {
            ZStack{
                Image("BackGround")
               
                VStack{
                    Text("Settings")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.226, green: 0.187, blue: 0.726))
                        .padding(.bottom, 750.0)

                }
                
                VStack(spacing: 16){
                    
                    
                    HStack(spacing: 165){
                        Text("Phone Number")
                            .font(.title2)
                       // Image(systemName: "chevron.down")
                    }
                    
                    HStack(spacing: 200){
                        Text("""
                             Contact Us:
                             sbalharbi22@twq.idserve.net
                             """)
                            .font(.title2)
                       // Image(systemName: "chevron.down")
                        
                    }
                }.padding(.bottom, 200)
            
            }
 
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
