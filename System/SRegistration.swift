//
//  CVsystem.swift
//  Line
//
//  Created by Raniyah Alotaibi on 26/07/1444 AH.
//

import SwiftUI
import Firebase
struct SRegistration: View {
    @State var CName = ""
    @State var CEmail = ""
   // @State var CommercialRegister = ""
    @State var TaxNumber = ""
    
    var body: some View {
        ZStack{
            VStack(spacing:100){
                VStack{
                    Text("Registration")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0.265, green: 0.275, blue: 0.439))
                        .multilineTextAlignment(.center)
                        .padding(.top, 40.0)
                    
                }
                
                
                
                GroupBox() {
                    VStack{
                        TextField("Company Name", text: $CName)
                            .font(.title2)
                            .padding(11)
                            .font(.title2)
                            .frame(width: 500, height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color("Bluee"), lineWidth: 3)
                            )
                            .padding(.trailing, 600.0)
                            .padding()
                        
                        TextField("Company Email ", text: $CEmail)
                            .font(.title2)
                            .padding(11)
                            .font(.title2)
                            .frame(width: 500, height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color("Bluee"), lineWidth: 3)
                            )
                            .padding(.trailing, 600.0)
                            .padding()
                        
                        TextField("Tax Number", text: $TaxNumber)
                            .font(.title2)
                            .padding(11)
                            .font(.title2)
                            .frame(width: 500, height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color("Bluee"), lineWidth:3)
                            )
                            .padding(.trailing, 600.0)
                            .padding()
                        HStack{
                            photopicer()
                                .padding(.leading,200.0)
                                .padding(.top,-350.0)
                        }
                        
                    }
                    
                }
                
                .groupBoxStyle(TransparentGroupBox())
                .padding()
                .padding(.bottom, -40.0)
                
                
                HStack{
                    
                    Button("Submit") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        
                    }
                    .frame(width: 320, height: 60)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.265, green: 0.275, blue: 0.439)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                    Spacer(minLength: 80)
                    .padding(.leading, -100.0)
                    

                }
                .padding(.top,10)
                .padding(.bottom, 100)
                .frame(width: /*@START_MENU_TOKEN@*/250.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
                
                
                
                
                
            }
            
            
        }
}
struct TransparentGroupBox: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.content
        
            .padding()
            .overlay(configuration.label.padding(.leading, 4), alignment: .topLeading)
        
        
    }
}
}

struct SRegistration_Previews: PreviewProvider {
    static var previews: some View {
        SRegistration()
    }
}
