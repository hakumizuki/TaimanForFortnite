    //
    //  TaimanListsView.swift
    //  TaimanForumForFortnite
    //
    //  Created by 増山太一 on 2020/06/05.
    //  Copyright © 2020 Haku Mizuki. All rights reserved.
    //
    
    import SwiftUI
    
    struct TaimanListsView: View {
        
        @ObservedObject var entriedTaimanListener = EntriedTaimanListener()
        
        @State private var showLogin = false
        
        @State private var showingAlertConfirmingToFinish = false
        
        var taiman: Taiman {
            return self.entriedTaimanListener.taiman
        }
        
        var body: some View {
            NavigationView {
                
                ZStack {
                    Color(#colorLiteral(red: 0.06126286834, green: 0.1292148232, blue: 0.2266941071, alpha: 1))
                    
                    if FUser.currentUser()?.isPlaying == false && FUser.currentUser()?.isRecruiting == false {
                        ScrollView(showsIndicators: false) {
                            Text("まだ募集もエントリーもしていません。")
                                .font(.custom("NotoSansJP-Bold", size: 19))
                                .foregroundColor(Color.white)
                                .padding()
                            HStack {
                                Text("1v1掲示板の")
                                    .font(.custom("NotoSansJP-Bold", size: 17))
                                    .foregroundColor(Color.white)
                                Image(systemName: "plus.square.fill")
                                    .foregroundColor(Color(#colorLiteral(red: 0.3790057302, green: 0.882291019, blue: 0.902651906, alpha: 1)))
                                Text("から募集してみましょう！")
                                    .font(.custom("NotoSansJP-Bold", size: 17))
                                    .foregroundColor(Color.white)
                            }
                        }
                        .navigationBarTitle("エントリーした1v1", displayMode: .inline)
                        .sheet(isPresented: $showLogin) {
                            if FUser.currentUser() != nil  {
                                FinishRegistration()
                            } else {
                                LoginView()
                            }
                        }
                    } else if FUser.currentUser()?.isPlaying == true {
                        ScrollView(showsIndicators: false) {
                            VStack(alignment: .center) {
                                
                                Text("エントリーしました！")
                                    .font(.custom("NotoSansJP-Bold", size: 19))
                                    .foregroundColor(Color.white)
                                    .padding()
                                Text("ID: \(self.taiman.ownerId)")
                                    .font(.custom("NotoSansJP-Bold", size: 17))
                                    .foregroundColor(Color.white)
                                    .padding()
                                
                                // entriedPlayerがcurrentId()と同じTaimanを表示
                                TaimanRow(taiman: taiman)
                                
                                Text("ゲーム内でフレンドになり、1v1を開始しましょう！")
                                    .font(.custom("NotoSansJP-Bold", size: 17))
                                    .foregroundColor(Color.white)
                                    .padding()
                                
                                Button(action: {
                                    self.showingAlertConfirmingToFinish.toggle()
                                }) {
                                    Text("終了する")
                                        .frame(width: 160, height: 40, alignment: .center)
                                        .foregroundColor(Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)))
                                        .font(.custom("NotoSansJP-Bold", size: 17))
                                        .background(Color(#colorLiteral(red: 0.0650389716, green: 0.1292048097, blue: 0.2307234108, alpha: 0.8010755565)))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color(#colorLiteral(red: 0.8235294223, green: 0.0615534166, blue: 0, alpha: 1)), lineWidth: 4)
                                    )
                                        .cornerRadius(10)
                                        .shadow(radius: 10)
                                }
                                .alert(isPresented: $showingAlertConfirmingToFinish) {
                                    Alert(title: Text("確認"), message: Text("終了してよろしいですか？"), primaryButton: .destructive(Text("終了"), action: {
                                        
                                        // ゲームを終了して、1v1を削除、isPlaying&isRecruiting = false
                                        updateCurrentUser(withValues: [kISPLAYING: false]) { (error) in
                                            
                                            if error != nil {
                                                print("ユーザーを更新できませんでした: ", error!.localizedDescription)
                                            } else {
                                                // 削除
                                                FirebaseReference(.Taiman).document(self.taiman.id).delete()
                                                // ownerIdのUserのisRecruitingをローカルごとfalseにする
                                            }
                                        }
                                        
                                    }), secondaryButton: .default(Text("まだ続ける")))
                                }
                            }
                        }
                        .navigationBarTitle("エントリーした1v1", displayMode: .inline)
                        .sheet(isPresented: $showLogin) {
                            if FUser.currentUser() != nil  {
                                FinishRegistration()
                            } else {
                                LoginView()
                            }
                        }
                    } else if FUser.currentUser()?.isRecruiting == true {
                        ScrollView(showsIndicators: false) {
                            VStack(alignment: .center) {
                                Text("プレイヤーがエントリーしました！")
                                    .font(.custom("NotoSansJP-Bold", size: 19))
                                    .foregroundColor(Color.white)
                                    .padding()
                                Text("ID: \(self.taiman.entriedPlayer)")
                                    .font(.custom("NotoSansJP-Bold", size: 17))
                                    .foregroundColor(Color.white)
                                    .padding()
                                
                                // entriedPlayerがcurrentId()と同じTaimanを表示
                                TaimanRow(taiman: taiman)
                                
                                Text("ゲーム内でフレンドになり、1v1を開始しましょう！")
                                    .font(.custom("NotoSansJP-Bold", size: 17))
                                    .foregroundColor(Color.white)
                                    .padding()
                                
                                Button(action: {
                                    self.showingAlertConfirmingToFinish.toggle()
                                }) {
                                    Text("終了する")
                                        .frame(width: 160, height: 40, alignment: .center)
                                        .foregroundColor(Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)))
                                        .font(.custom("NotoSansJP-Bold", size: 17))
                                        .background(Color(#colorLiteral(red: 0.0650389716, green: 0.1292048097, blue: 0.2307234108, alpha: 0.8010755565)))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color(#colorLiteral(red: 0.8235294223, green: 0.0615534166, blue: 0, alpha: 1)), lineWidth: 4)
                                    )
                                        .cornerRadius(10)
                                        .shadow(radius: 10)
                                }
                                .alert(isPresented: $showingAlertConfirmingToFinish) {
                                    Alert(title: Text("確認"), message: Text("終了してよろしいですか？"), primaryButton: .destructive(Text("終了"), action: {
                                        
                                        // ゲームを終了して、1v1を削除、isPlaying&isRecruiting = false
                                        updateCurrentUser(withValues: [kISRECRUITING: false]) { (error) in
                                            
                                            if error != nil {
                                                print("ユーザーを更新できませんでした: ", error!.localizedDescription)
                                            } else {
                                                // 削除
                                                FirebaseReference(.Taiman).document(self.taiman.id).delete()
                                                // ownerIdのUserのisPlayingをローカルごとfalseにする
                                            }
                                        }
                                        
                                    }), secondaryButton: .default(Text("まだ続ける")))
                                }
                            }
                        }
                        .navigationBarTitle("エントリーした1v1", displayMode: .inline)
                        .sheet(isPresented: $showLogin) {
                            if FUser.currentUser() != nil  {
                                FinishRegistration()
                            } else {
                                LoginView()
                            }
                        }
                    } else {
                        ScrollView(showsIndicators: false) {
                            VStack(alignment: .center) {
                                Text("まだログインしていません。")
                                    .font(.custom("NotoSansJP-Bold", size: 19))
                                    .foregroundColor(Color.white)
                                    .padding()
                                
                                Button(action: {
                                    self.showLogin.toggle()
                                }) {
                                    Text("ログインする")
                                }
                                .frame(width: 160, height: 40, alignment: .center)
                                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                .font(.custom("NotoSansJP-Bold", size: 17))
                                .background(Color(#colorLiteral(red: 0.0650389716, green: 0.1292048097, blue: 0.2307234108, alpha: 0.8010755565)))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(#colorLiteral(red: 0.3790057302, green: 0.882291019, blue: 0.902651906, alpha: 1)), lineWidth: 4)
                                )
                                    .cornerRadius(10)
                            }
                        }
                        .navigationBarTitle("エントリーした1v1", displayMode: .inline)
                        .sheet(isPresented: $showLogin) {
                            if FUser.currentUser() != nil  {
                                FinishRegistration()
                            } else {
                                LoginView()
                            }
                        }
                    }
                }
            } //End of ZStack
            
        } //End of Navigation View
    }
    
    struct TaimanListsView_Previews: PreviewProvider {
        static var previews: some View {
            TaimanListsView()
        }
    }
