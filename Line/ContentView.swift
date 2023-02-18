//
//  ContentView.swift
//  Line
//
//  Created by Hind on 14/07/1444 AH.
//

import SwiftUI

struct ContentView: View {
   
    @AppStorage("log_statuse") var log_statuse = false
    var body: some View {
        NavigationView{
            if log_statuse{
                Text("Home")
                    .navigationTitle("Home")
            }
            else{
                CVSystem()
            }
            
        }
    }
    
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
