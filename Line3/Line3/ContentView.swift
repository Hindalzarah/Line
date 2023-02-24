//
//  ContentView.swift
//  Line3
//
//  Created by Sara bayan alharbi on 01/08/1444 AH.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Image("BackGround")
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 340, height: 87)
                        .foregroundColor(Color(red: 0.937, green: 0.937, blue: 0.937))
                    HStack{
                        Image("Ellipse 1.png")
                            .resizable()
                            .frame(width: 64.86, height: 64.86)
                        VStack{
                            Text("brewwell | برويل ")
                                .foregroundColor(Color(red: 0.09, green: 0.302, blue: 0.481))
                            ZStack{
                                Rectangle()
                                    .frame(width: 100, height: 20)
                                    .foregroundColor(Color(red: 0.898, green: 0.898, blue: 0.898))
                                Text("order #190")
                                    .foregroundColor(Color(red: 0.09, green: 0.302, blue: 0.481))
                                
                            }
                        }
                    }
                    .padding(.trailing, 100.0)
                } .padding(.bottom, 550)
                
                //                NavigationLink {
                //                    //  RepresentedMyView()
                //                } label: {
                //                    Text("Click to play while you’re waiting")
                //                        .font(.body)
                //                        .fontWeight(.semibold)
                //                        .foregroundColor(Color(red: 0.226, green: 0.187, blue: 0.726))
                //                        .multilineTextAlignment(.leading)
                //                        .padding(.bottom, 500)
                //                }
                
                    .toolbar{
                        ToolbarItem(placement: .navigationBarTrailing){
                            Button {
                                print("Done")
                            } label: {
                                NavigationLink(destination: Settings(), label: {
                                    Image(systemName: "gearshape.fill")
                                        .resizable()
                                        .foregroundColor(Color(red: 0.226, green: 0.187, blue: 0.726))
                                        .frame(width: 31, height: 31)
                                })
                            }
                        }
                    }
                    .navigationTitle("Hello...")
            } //.....
        }
        }.accentColor(Color(red: 0.226, green: 0.187, blue: 0.726))
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
}
