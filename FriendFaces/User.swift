//
//  User.swift
//  FriendFaces
//
//  Created by Ricardo on 18/04/24.
//

import Foundation

struct User: Codable, Hashable,Identifiable {
    var id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
}
