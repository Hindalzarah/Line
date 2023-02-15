//
//  LoginView.swift
//  Line
//
//  Created by Hind on 14/07/1444 AH.
//

//import SwiftUI
//
//struct LoginView: View {
//    @StateObject var otpModel: OTPViewModel = .init()
//
//    var body: some View {
//
//        VStack{
//            Spacer()
//            //user phone nymber
//            HStack(alignment: .center){
//
//                Text("+966")
//                    .foregroundColor(Color.blue)
//                    .font(.system(size: 17))
//                VStack{
//                    TextField("  51 234 5678", text: $otpModel.phoneNumber)
//                        .keyboardType(.numberPad)
//
//                    Rectangle()
//                        .fill(otpModel.phoneNumber == "" ? .gray.opacity(0.35) : .gray)
//                        .frame(height: 1)
//                }
//                .frame(width:207 , height:25 )
//                .padding(.top, 8.0)
//
//            }
//            .padding(.vertical)
//
//            Button{
//                Task{await otpModel.sendOTP()}
//
//            } label: {
//                Text("Login")
//                    .fontWeight(.semibold)
//                    .foregroundColor(.white)
//                    .padding(.vertical,12)
//                    .frame(maxWidth: .infinity)
//                    .background{
//                        RoundedRectangle(cornerRadius: 10,style: .continuous)
//                            .fill(.blue)
//                            .opacity(otpModel.isLoading ? 0 : 1)
//
//                    }
//                    .overlay{
//                        ProgressView()
//                            .opacity(otpModel.isLoading ? 1:0)
//                    }
//            }
//            .disabled(otpModel.code == "" || otpModel.phoneNumber == "" )
//            .opacity(otpModel.code == "" || otpModel.phoneNumber == "" ? 0.4 : 1)
//        }
//        .navigationTitle("Login")
//        .padding()
//        .frame(maxHeight: .infinity,alignment: .top)
//        .background{
//            NavigationLink(tag: "VERIFICATION", selection: $otpModel.navigationTag){
//                VerificationView()
//                    .environmentObject(otpModel)
//            } label: {}
//                .labelsHidden()
//        }
//        .alert(otpModel.errorMsg,isPresented: $otpModel.showAlert){}
//    }
//
//}
//
//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}


import SwiftUI

struct LoginView: View {
    @StateObject var otpModel: OTPViewModel = .init()
    var body: some View {
        VStack{
            Spacer()
            VStack(){
                Text("Please Enter your mobile number ")
            }.padding(.bottom,80)
                .foregroundColor(.black)

            HStack(spacing: 10){
                VStack(spacing: 8){
                    TextField("966", text: $otpModel.code)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.center)
                    
                    Rectangle()
                        .fill(otpModel.code == "" ? .gray.opacity(0.35) : .blue)
                        .frame(width: 35, height: 2)
                }
                .frame(width: 40)
                VStack(spacing: 8){
                    TextField("  51 234 5678", text: $otpModel.number)
                        .keyboardType(.numberPad)
                    
                    Rectangle()
                        .fill(otpModel.number == "" ? .gray.opacity(0.35) : .gray)
                        .frame(width: 200, height: 2)
                }
            }
         //   .padding(.bottom,300)
            
            Button{
                Task{await otpModel.sendOTP()}
            } label: {
                Text("Login")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical,12)
                    .frame(maxWidth: .infinity)
                    .background{
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.blue)
                            .opacity(otpModel.isLoading ? 0 : 1)
                    }
                
                    .overlay{
                        ProgressView()
                            .opacity(otpModel.isLoading ? 1 : 0)
                    }
            }
            .disabled(otpModel.code == "" || otpModel.number == "" )
                        .opacity(otpModel.code == "" || otpModel.number == "" ? 0.4 : 1)
        }
        .padding(.bottom,300)

        
        
        .navigationTitle("Login")
        .foregroundColor(.blue)
        .padding()
        .frame(maxHeight: .infinity,alignment: .top)
        .background{
            if (!otpModel.verificationCode.isEmpty){
                NavigationLink(tag: "VERIFICATION", selection: $otpModel.navigationTag){
                  VerificationView()
                    .environmentObject(otpModel)
                } label: {}
                    .labelsHidden()
            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
