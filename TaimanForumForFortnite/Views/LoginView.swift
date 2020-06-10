//
//  LoginView.swift
//  TaimanForumForFortnite
//
//  Created by 増山太一 on 2020/06/09.
//  Copyright © 2020 Haku Mizuki. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @State var showingSignup = false
    @State var showingFinishReg = false
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var email = ""
    @State var password = ""
    @State var repeatPassword = ""
    
    var body: some View {
        
        
        VStack {
            Text(showingSignup ? "アカウントを作る" : "ログインする")
                .font(.custom("NotoSansJP-Bold", size: 30))
                .padding([.top, .bottom], 20)
            
            VStack(alignment: .leading) {
                
                Text("メールアドレス")
                    .font(.custom("NotoSansJP-Bold", size: 18))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.init(.label))
                    .opacity(0.75)
                
                TextField("メールアドレスを入力してください", text: $email)
                    .autocapitalization(.none)
                Divider()
                
                
                Text("パスワード")
                    .font(.custom("NotoSansJP-Bold", size: 18))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.init(.label))
                    .opacity(0.75)
                
                SecureField("パスワードを入力してください", text: $password)
                Divider()
                
                if showingSignup {
                    
                    Text("パスワード確認")
                        .font(.custom("NotoSansJP-Bold", size: 18))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.init(.label))
                        .opacity(0.75)
                    
                    SecureField("もう一度入力してください", text: $repeatPassword)
                    Divider()
                    
                } else {
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            
                            self.resetPassword()
                        }, label: {
                            Text("なんてこった、パスワードを忘れた")
                                .foregroundColor(Color.gray.opacity(0.5))
                                .padding(.top, 2)
                        })
                    }
                }
                
            } //End of VStack
                .padding()
                .animation(.easeOut(duration: 0.1))
            
            Button(action: {
                
                self.showingSignup ? self.signUpUser() : self.loginUser()
                
            }) {
                Text(showingSignup ? "サインアップ" : "サインイン")
                    .frame(width: 200, height: 50)
                    .foregroundColor(Color(#colorLiteral(red: 0.3790057302, green: 0.882291019, blue: 0.902651906, alpha: 1)))
                    .font(.custom("NotoSansJP-Bold", size: 17))
                    .background(Color(#colorLiteral(red: 0.06126286834, green: 0.1292148232, blue: 0.2266941071, alpha: 1)))
                    .cornerRadius(10)
                    .padding(.top, 45)
            }
            
            LoginViewFooter(showingSignup: $showingSignup)
            
        } //End of VStack
            .sheet(isPresented: $showingFinishReg) {
                
                FinishRegistration()
                
        }
        
    } //End of Body
    
    private func loginUser() {
        if email != "" && password != "" {
            
            FUser.loginUserWith(email: email, password: password) { (error, isEmailVerified) in
                
                if error != nil {
                    print("Error loging in the user: ", error!.localizedDescription)
                    return
                }
                    
                if FUser.currentUser() != nil && FUser.currentUser()!.onBoarding == true {
                    self.presentationMode.wrappedValue.dismiss()
                } else {
                    self.showingFinishReg.toggle()
                }
                
                
            }
            
        }
    }
    
    private func signUpUser() {
        if email != "" && password != "" && repeatPassword != "" {
            if password == repeatPassword {
                
                
                FUser.registerUserWith(email: email, password: password) { (error) in
                    if error != nil {
                        print("Error registering user: ", error!.localizedDescription)
                        return
                    }
                }
                
                
            } else {
                print("password dont match")
            }
        } else {
            print("enter password and email")
        }
        
        print("FUser has been created")
        
        // check if user onBoarding is done AND Go back to app
        
    }
    
    private func resetPassword() {
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct LoginViewFooter : View {
    @Binding var showingSignup: Bool
    
    var body: some View {
        
        VStack {
            Spacer()
            
            HStack {
                Text(showingSignup ? "アカウントをお持ちの方" : "初めての方はこちら！")
                
                Button(action: {
                    self.showingSignup.toggle()
                }, label: {
                    Text(showingSignup ? "ログインする" : "アカウントを作る")
                })
            }
        }
        .padding(.bottom, 50)
    }
}
