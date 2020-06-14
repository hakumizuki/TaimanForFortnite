//
//  Taiman.swift
//  TaimanForumForFortnite
//
//  Created by 増山太一 on 2020/06/06.
//  Copyright © 2020 Haku Mizuki. All rights reserved.
//

import Foundation
import SwiftUI

struct Taiman: Identifiable, Equatable {
    var id: String
    var createdAt: Date
    var ownerId: String
    var battleMode: String
    var playerLevel: String
    var weaponsRule: String
    var fallDamage: String
    var grappler: String
    var healItem: String
    var isEntried: Bool
}
