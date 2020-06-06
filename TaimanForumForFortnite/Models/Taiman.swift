//
//  Taiman.swift
//  TaimanForumForFortnite
//
//  Created by 増山太一 on 2020/06/06.
//  Copyright © 2020 Haku Mizuki. All rights reserved.
//

import Foundation
import SwiftUI

enum PlayerLevel: String, Codable {
    case 誰でもオッケー！
    case 初心者同士で！
    case 上級者求む！
}

struct Taiman: Identifiable{
    var id: String
    var createdAt: String
    var ownerId: String
    var description: String
    var playerLevel: PlayerLevel
}
