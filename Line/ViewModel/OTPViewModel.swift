//
//  OTPViewModel.swift
//  Line
//
//  Created by Lujeen Alradhi on 22/07/1444 AH.
//
//
//import SwiftUI
//import Firebase
//class OTPViewModel: ObservableObject {
    //login data
   /* @Published var phoneNumber:String = ""
    @Published var code:String = "966"
    
    @Published var otpText : String = ""
    @Published var otpFields: [String] = Array(repeating: "", count: 6)
    
    //in case error occure
    @Published var showAlert: Bool = false
    @Published var errorMsg: String = ""
    
    //OTP credentials
    @Published var verificationCode: String = ""
    @Published var isLoading: Bool = false
    
    @Published var navigationTag: String?
    @AppStorage("log_status") var log_status = false */

//    // MARK: Login Data
//    @Published var number: String = ""
//    @Published var code: String = ""
//
//    @Published var otpText: String = ""
//    @Published var otpFields: [String] = Array(repeating: "", count: 6)
//
//    // MARK: Error
//    @Published var showAlert: Bool = false
//    @Published var errorMsg: String = ""
//
//    // MARK: OTP Credentials
//    @Published var verificationCode: String = ""
//
//    @Published var isLoading: Bool = false
//    @Published var log_status: Bool = false
//
//
//    @Published var navigationTag: String?
//
//
    
//    
//    //sending OTP
//    func sendOTP()async{
//        
//        //to enable tesing code, if u want to use real number u should make it false
//        Auth.auth().settings?.isAppVerificationDisabledForTesting = false
//        
//        if isLoading{return}
//        do{
//            isLoading = true
//            let result = try await
//            PhoneAuthProvider.provider().verifyPhoneNumber("+\(code)\(number)",uiDelegate: nil)
//            
//            DispatchQueue.main.async {
//                self.isLoading = false
//                self.verificationCode = result
//                //   self.verificationCode = "123456"
//                self.navigationTag = "VERIFICATION"
//              //  self.log_status = true
//                
//            }
//            
//        }
//        catch{
//            
//            handleError(error: error.localizedDescription)
//            
//        }
//        
//    }
//    
//    //error handler function
//    func handleError(error: String){
//        DispatchQueue.main.async {
//            self.isLoading = false
//            self.errorMsg = error
//            self.showAlert.toggle()
//        }
//    }
//    @MainActor func verifyOTP() async{
//    do{
//    self.otpText = self.otpFields.joined(separator: "")//print the array as string
//    self.isLoading = true
//    let credential = PhoneAuthProvider.provider().credential(withVerificationID: self.verificationCode, verificationCode: self.otpText)
//    let _ = try await Auth.auth().signIn(with: credential)
//    DispatchQueue.main.async {[self] in
//    self.isLoading = false
//        self.log_status = true
//
//            }
//        }catch{
//            handleError(error: error.localizedDescription)
//        }
//        
//    }
//
//}
//

import SwiftUI
import Firebase

class OTPViewModel: ObservableObject {
    // MARK: Login Data
    @Published var number: String = ""
    @Published var code: String = ""
    
    @Published var otpText: String = ""
    @Published var otpFields: [String] = Array(repeating: "", count: 6)
    
    // MARK: Error
    @Published var showAlert: Bool = false
    @Published var errorMsg: String = ""
    
    // MARK: OTP Credentials
    @Published var verificationCode: String = ""
    
    @Published var isLoading: Bool = false
    @Published var log_status: Bool = false
    
    
    @Published var navigationTag: String?
    
    // MARK: Sending OTP
    @MainActor  func sendOTP() async{
        // NEW to enable testing if you want to use real number!
        Auth.auth().settings?.isAppVerificationDisabledForTesting = false
        if isLoading{return}
        do{
            isLoading = true
            // NEW (to print array as string)
         //   otpText = otpFields.joined(separator: "")
    
            let result = try await
            PhoneAuthProvider.provider().verifyPhoneNumber("+\(code)\(number)",
            uiDelegate: nil)
            print(result)
            DispatchQueue.main.async {
                self.isLoading = false
                self.verificationCode = result
                self.navigationTag = "VERIFICATION"
            }
        }
        catch{
            handleError(error: error.localizedDescription)
        }
    }
    // store on firebase
    @MainActor func verifyOTP() async{
    do{
    self.otpText = self.otpFields.joined(separator: "")//print the array as string
    self.isLoading = true
    let credential = PhoneAuthProvider.provider().credential(withVerificationID: self.verificationCode, verificationCode: self.otpText)
    let _ = try await Auth.auth().signIn(with: credential)
    DispatchQueue.main.async {[self] in
    self.isLoading = false
        self.log_status = true

            }
        }catch{
            handleError(error: error.localizedDescription)
        }
        
    }
    func handleError(error: String){
        DispatchQueue.main.async {
            self.isLoading = false
            self.errorMsg = error
            self.showAlert.toggle()
        }
    }
}



