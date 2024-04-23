//
//  Friend.swift
//  FriendFaces
//
//  Created by Ricardo on 18/04/24.
//

import Foundation
import SwiftData

//only the head of your schema needs the @Model macro
class Friend: Codable {

    var id: String
    var name: String
    
    init(id: String, name: String) {
            self.id = id
            self.name = name
    }
}
