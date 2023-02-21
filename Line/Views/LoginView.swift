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
//-----------------------------------------------


import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

struct LoginView: View {
    //@EnvironmentObject var OTPViewModel = otpModel
    @StateObject var otpModel: OTPViewModel = .init()
    
  //  @State var isShowingHomeView: Bool = false
    //    @State var phoneNumber: String = ""
    
    
       // @StateObject var authManager = AuthManager()
    
    var body: some View {
        ZStack{
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
//                        let userToken = UserDefaults.standard.string(forKey: "TokenUser")
                        // Token for Notifications
                        // UUid : User from Auth
                        
                        //     .frame(width: 200,height: 22)
                        
                        Rectangle()
                            .fill(otpModel.code == "" ? .black.opacity(0.35) : .blue)
                            .frame(width: 40, height: 2)
                    }
                    .frame(width: 40)
                    VStack(spacing: 8){
                        TextField("  51 234 5678", text: $otpModel.phoneNumber)
                            .keyboardType(.numberPad)
                            .frame(width: 200,height: 22)
                        
                        Rectangle()
                            .fill(otpModel.phoneNumber == "" ? .black.opacity(0.35) : .gray)
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
                      //  .frame(minWidth: 140,minHeight: 44)
                        .frame(maxWidth: 255)
                        .background{
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(Color("Bluee"))
                                .opacity(otpModel.isLoading ? 0 : 1)
                        }
                    
                        .overlay{
                            ProgressView()
                                .opacity(otpModel.isLoading ? 1 : 0)
                        }
                }
                .disabled(otpModel.code == "" || otpModel.phoneNumber == "" )
                .opacity(otpModel.code == "" || otpModel.phoneNumber == "" ? 0.4 : 1)
                
                
            }
            ZStack{
                Circle( )
                .frame (width: 400, height: 400) .offset(x: 150, y: 630)
                .foregroundColor (Color("Bluee").opacity (0.5))
                
            }
            ZStack{
                Circle( )
                .frame (width: 650, height: 400) .offset(x: -100, y: 560)
                .foregroundColor (Color("Bluee").opacity (0.3))
                
            }
        }
        .padding(.bottom,300)

        
        
        .navigationTitle("Login")
        .foregroundColor(.blue)
        .padding()
        .frame(maxHeight: .infinity,alignment: .top)
        .background{
            if (!otpModel.verificationCode.isEmpty){
                NavigationLink(tag: "VERIFICATION", selection:
                                $otpModel.navigationTag){
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





struct User: Codable {
    let id: String
    let phoneNumber: String
}
class AuthManager: ObservableObject {
    @Published var verifyOTP: String?
    private let auth = Auth.auth()

        func createAccountWithPhoneNumber(phoneNumber: String, completion: @escaping ((Bool) -> () )){
            PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil){ [self] code , error in
                if let _ = error{
                    print("Error while getting sms code")
                    return
                }
                self.verifyOTP = verifyOTP
             //   self.verificationCode = verificationCode
              //  self.verificationId = verificationId
              //  self.otpText = self.otpFields
                
                
                
                completion(true)
            }
        }

}


//-----------------------------------------------


//func RegisterUser(urls:[String]){
//    let db = Firestore.firestore()
//    db.collection("Users").document(Auth.auth().currentUser!.uid).setData([
//        "phoneNumber": self.phoneNumber
//    ]) { (err) in
//        if err != nil{
//            print((err?.localizedDescription)!)
////            self.alertMsg = err!.localizedDescription
////            self.alert.toggle()
//            return
//        }
//        self.isLoading.toggle()
//        self.status = true
//    }
//}




//private func createUser() {
//    Auth.auth().createUser(withphoneNumber: phoneNumber, completion: { result, err in
//        if let err = err {
//            print("Failed due to error:", err)
//            return
//        }
//        print("Successfully created account with ID: \(result?.user.uid ?? "")")
//    })
//} not true


//func RegisterUser(urls:[String]){
//    let db = Firestore.firestore()
//    db.collection("Users").document(Auth.auth().currentUser!.uid).setData([
//        "phoneNumber": self.phoneNumber
//    ]) { (err) in
//        if err != nil{
//            print((err?.localizedDescription)!)
////            self.alertMsg = err!.localizedDescription
////            self.alert.toggle()
//            return
//        }
//        self.isLoading.toggle()
//        self.status = true
//    }
//}



//struct User: Codable {
//    let id: String
//    let name: String
//    let phoneNumber: String
//}

//class AuthManager : ObservableObject {
//  //  @Published var verificationId: String?
//    let auth = Auth.auth()
//
//    func createAccountWithPhoneNumber(phoneNumber: String, completion: @escaping ((Bool) -> () )){
//        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil){ code , error in
//            if let _ = error{
//                print("Error while getting sms code")
//                return
//            }
//           // self.OTPField =
//         //   self.verificationCode = verificationCode
//          //  self.verificationId = verificationId
//          //  self.otpText = self.otpFields
//            completion(true)
//        }
//    }
//
//}
//------------------//---------------------
