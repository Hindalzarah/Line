//
//  Fpage.swift
//  Line
//
//  Created by Raniyah Alotaibi on 26/07/1444 AH.
//

import SwiftUI

struct Fpage: View {
    var body: some View {
        
        GroupBox() {
            ZStack{
                
                Button("User") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    
                }
                .frame(width: 320, height: 60)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.265, green: 0.275, blue: 0.439)/*@END_MENU_TOKEN@*/)
                .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                Spacer(minLength: 80)
                    .padding(.leading, -100.0)
                
            }
            ZStack{
                Button("Company") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    
                }
                .frame(width: 320, height: 60)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.265, green: 0.275, blue: 0.439)/*@END_MENU_TOKEN@*/)
                .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                Spacer(minLength: 80)
                    .padding(.leading, -100.0)
            }
        }
    }
}


struct Fpage_Previews: PreviewProvider {
    static var previews: some View {
        Fpage()
    }
}
