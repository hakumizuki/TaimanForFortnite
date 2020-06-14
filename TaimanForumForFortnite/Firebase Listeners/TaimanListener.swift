//
//  TaimanListener.swift
//  TaimanForumForFortnite
//
//  Created by 増山太一 on 2020/06/11.
//  Copyright © 2020 Haku Mizuki. All rights reserved.
//

import Foundation
import Firebase

class TaimanListener: ObservableObject {
    
    @Published var taimans: [Taiman] = []
    
    init() {
        downloadTaimans()
    }
    
    func downloadTaimans() {
        taimans = []
        
        FirebaseReference(.Taiman).order(by: "createdAt", descending: true).addSnapshotListener { (snapshot, error) in
            
            guard let snapshot = snapshot else { return }
            
            if !snapshot.isEmpty {
                self.taimans = TaimanListener.taimanFromDictionary(snapshot)
            }
            
        }
    }
    
    static func taimanFromDictionary(_ snapshot: QuerySnapshot) -> [Taiman] {
        
        var allTaimans: [Taiman] = []
        
        for snapshot in snapshot.documents {
            
            let taimanData = snapshot.data()
            
            let timestamp = taimanData[kCREATEDAT] as! Timestamp
            
            allTaimans.append(Taiman(id: taimanData[kID] as? String ?? UUID().uuidString, createdAt: timestamp.dateValue(), ownerId: taimanData[kOWNERID] as? String ?? "", battleMode: taimanData[kBATTLEMODE] as? String ?? "", playerLevel: taimanData[kPLAYERLEVEL] as? String ?? "", weaponsRule: taimanData[kWEAPONSRULE] as? String ?? "", fallDamage: taimanData[kFALLDAMAGE] as? String ?? "", grappler: taimanData[kGRAPPLER] as? String ?? "", healItem: taimanData[kHEALITEM] as? String ?? "", isEntried: taimanData[kISENTRIED] as? Bool ?? false))
        }
        
        return allTaimans
    }
}
