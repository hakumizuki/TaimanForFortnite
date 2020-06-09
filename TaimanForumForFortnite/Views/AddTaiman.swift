//
//  AddTaiman.swift
//  TaimanForumForFortnite
//
//  Created by 増山太一 on 2020/06/08.
//  Copyright © 2020 Haku Mizuki. All rights reserved.
//

import SwiftUI

struct AddTaiman: View {
    
    @State private var selectedBattleMode = 0
    @State private var selectedPlayerLevel = 0
    @State private var selectedWeaponsRule = 0
    @State private var selectedFallDamage = 0
    @State private var selectedGrappler = 0
    @State private var selectedHealItem = 0
    
    
    var battleMode = ["建築バトル", "ボックスファイト", "ZoneWar", "RealBattle", "その他1v1", "話し合って決める"]
    var weaponsRule = ["青ポンプと青ARのみ", "青武器のみ", "青ポンプと紫スカー", "話し合って決める"]
    var playerLevel = ["誰でもOK！", "初心者同士で！", "上級者求む！"]
    var fallDamage = ["あり", "なし", "おまかせ"]
    var grappler = ["あり", "なし", "おまかせ"]
    var healItem = ["あり", "なし", "おまかせ"]
    
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            
            Text("1v1の設定を決めてください")
                .font(.custom("NotoSansJP-Bold", size: 25))
                .padding()
            
            VStack {
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    
                    Section(header: Text("対戦モード").foregroundColor(Color(#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1))).font(.custom("NotoSansJP-Bold", size: 17))) {
                        
                        Picker(selection: $selectedBattleMode, label: Text("")) {
                            
                            ForEach(0 ..< battleMode.count) {
                                
                                Text(self.battleMode[$0])
                                
                            }
                            
                        }
                        .pickerStyle(WheelPickerStyle())
                        .background(Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)))
                        .cornerRadius(10)
                        
                    } //End of Section 0
                    
                    Section(header: Text("武器ルール").foregroundColor(Color(#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1))).font(.custom("NotoSansJP-Bold", size: 17))) {
                        
                        Picker(selection: $selectedWeaponsRule, label: Text("")) {
                            
                            ForEach(0 ..< weaponsRule.count) {
                                
                                Text(self.weaponsRule[$0])
                                
                            }
                            
                        }
                        .pickerStyle(WheelPickerStyle())
                        .background(Color(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)))
                        .cornerRadius(10)
                        
                    } //End of Section 1
                    
                    Section(header: Text("プレイヤーレベル").foregroundColor(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))).font(.custom("NotoSansJP-Bold", size: 17))) {
                        
                        Picker(selection: $selectedPlayerLevel, label: Text("")) {
                            
                            ForEach(0 ..< playerLevel.count) {
                                
                                Text(self.playerLevel[$0])
                                
                            }
                            
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .background(Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)))
                        .cornerRadius(5)
                        
                    } //End of Section 2
                    
                    Section(header: Text("落下ダメージ").foregroundColor(Color(#colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1))).font(.custom("NotoSansJP-Bold", size: 17))) {
                        
                        Picker(selection: $selectedFallDamage, label: Text("")) {
                            
                            ForEach(0 ..< fallDamage.count) {
                                
                                Text(self.fallDamage[$0])
                                
                            }
                            
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .background(Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)))
                        .cornerRadius(5)
                        
                    } //End of Section 3
                    
                    Section(header: Text("グラップラー").foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))).font(.custom("NotoSansJP-Bold", size: 17))) {
                        
                        Picker(selection: $selectedGrappler, label: Text("")) {
                            
                            ForEach(0 ..< grappler.count) {
                                
                                Text(self.grappler[$0])
                                
                            }
                            
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .background(Color(#colorLiteral(red: 0.7724073096, green: 0.5585598921, blue: 0.978312017, alpha: 1)))
                        .cornerRadius(5)
                        
                    } //End of Section 4
                    
                    Section(header: Text("回復アイテム").foregroundColor(Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))).font(.custom("NotoSansJP-Bold", size: 17))) {
                        
                        Picker(selection: $selectedHealItem, label: Text("")) {
                            
                            ForEach(0 ..< healItem.count) {
                                
                                Text(self.healItem[$0])
                                
                            }
                            
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .background(Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)))
                        .cornerRadius(5)
                        
                    } //End of Section 5
                    
                } //End of child VStack
                .padding()
                
                
                //仮置き
                Button(action: {
                    
                    // Add to Firestore
                    
                }) {
                    Text("1v1を募集する")
                }
                .frame(width: 200, height: 50)
                .foregroundColor(.white)
                .font(.custom("NotoSansJP-Bold", size: 17))
                .background(Color(#colorLiteral(red: 0.06126286834, green: 0.1292148232, blue: 0.2266941071, alpha: 1)))
                .cornerRadius(10)
                .padding(.bottom, 20)
            } //End of VStack
            
        } //End of Scroll View
        
    }
}

struct AddTaiman_Previews: PreviewProvider {
    static var previews: some View {
        AddTaiman()
    }
}
