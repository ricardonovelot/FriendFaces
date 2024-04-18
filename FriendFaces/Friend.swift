//
//  Friend.swift
//  FriendFaces
//
//  Created by Ricardo on 18/04/24.
//

import Foundation

struct Friend: Codable, Identifiable, Hashable {
    var id: UUID
    var name: String
}
