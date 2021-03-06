//
//  EntriedTaimanListener.swift
//  TaimanForumForFortnite
//
//  Created by 増山太一 on 2020/06/17.
//  Copyright © 2020 Haku Mizuki. All rights reserved.
//

import Foundation
import Firebase

class EntriedTaimanListener: ObservableObject {
    
    @Published var taiman: Taiman = Taiman(id: "", createdAt: Date(), ownerId: "", battleMode: "", playerLevel: "", weaponsRule: "", fallDamage: "", grappler: "", healItem: "", isEntried: false, entriedPlayer: "")
    
    init() {
        self.downloadTaiman()
    }
    
    func downloadTaiman() {
        
        if FUser.currentUser()?.isPlaying == true {
            FirebaseReference(.Taiman).whereField(kENTRIEDPLAYER, isEqualTo: FUser.currentUser()!.fortniteId).addSnapshotListener { (snapshot, error) in
                
                guard let snapshot = snapshot else { return }
                
                if !snapshot.isEmpty {
                    self.taiman = EntriedTaimanListener.taimanFromDictionaryA(snapshot)
                }
            }
        } else if FUser.currentUser()?.isRecruiting == true {
            FirebaseReference(.Taiman).document(FUser.currentId()).addSnapshotListener { (snapshot, error) in
                
                guard let snapshot = snapshot else { return }
                
                self.taiman = EntriedTaimanListener.taimanFromDictionaryB(snapshot)
            }
        }
        
    }
    
    // isPlaying == true
    static func taimanFromDictionaryA(_ snapshot: QuerySnapshot) -> Taiman {
        
        let taimanData = snapshot.documents[0].data()
        
        let timestamp = taimanData[kCREATEDAT] as! Timestamp
        
        let taiman = Taiman(id: taimanData[kID] as? String ?? UUID().uuidString, createdAt: timestamp.dateValue(), ownerId: taimanData[kOWNERID] as? String ?? "", battleMode: taimanData[kBATTLEMODE] as? String ?? "", playerLevel: taimanData[kPLAYERLEVEL] as? String ?? "", weaponsRule: taimanData[kWEAPONSRULE] as? String ?? "", fallDamage: taimanData[kFALLDAMAGE] as? String ?? "", grappler: taimanData[kGRAPPLER] as? String ?? "", healItem: taimanData[kHEALITEM] as? String ?? "", isEntried: taimanData[kISENTRIED] as? Bool ?? false, entriedPlayer: taimanData[kENTRIEDPLAYER] as? String ?? "")
        
        return taiman
    }
    
    // isRecruiting == true
    static func taimanFromDictionaryB(_ snapshot: DocumentSnapshot) -> Taiman {
        var taiman = Taiman(id: "", createdAt: Date(), ownerId: "", battleMode: "", playerLevel: "", weaponsRule: "", fallDamage: "", grappler: "", healItem: "", isEntried: false, entriedPlayer: "")

        if let taimanData = snapshot.data() {
            let timestamp = taimanData[kCREATEDAT] as! Timestamp
            
            taiman = Taiman(id: taimanData[kID] as? String ?? UUID().uuidString, createdAt: timestamp.dateValue(), ownerId: taimanData[kOWNERID] as? String ?? "", battleMode: taimanData[kBATTLEMODE] as? String ?? "", playerLevel: taimanData[kPLAYERLEVEL] as? String ?? "", weaponsRule: taimanData[kWEAPONSRULE] as? String ?? "", fallDamage: taimanData[kFALLDAMAGE] as? String ?? "", grappler: taimanData[kGRAPPLER] as? String ?? "", healItem: taimanData[kHEALITEM] as? String ?? "", isEntried: taimanData[kISENTRIED] as? Bool ?? false, entriedPlayer: taimanData[kENTRIEDPLAYER] as? String ?? "")
        }
        return taiman
    }
}

