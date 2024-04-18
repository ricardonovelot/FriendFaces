//
//  ContentView.swift
//  FriendFaces
//
//  Created by Ricardo on 18/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationStack{
            List(users){ user in
                NavigationLink(value: user){
                    HStack{
                        Text(user.name)
                        Spacer()
                        Circle()
                            .fill(user.isActive ? Color(UIColor.systemGreen) : Color(UIColor.systemGray6))
                            .frame(width: 10, height: 10)
                    }
                }
            }
            .navigationDestination(for: User.self, destination: {user in
                UserDetailView(user: user)
            })
            .navigationTitle("Contacts")
        }
        .task {
            if users.isEmpty {
                await loadData()
            } else {
            }
        }
    }
    
    
    func loadData() async {
        // Step 1: Build URL
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }

        do {
            // Step 2: Fetch Data
            let (data, _) = try await URLSession.shared.data(from: url)

            // Step 3: Configure decoder for ISO 8601 date format
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601

            // Decode and map the results to our Model
            let decodedResponse = try decoder.decode([User].self, from: data)

            users = decodedResponse

        } catch {
            // Improved error handling
            print("Fetch or Decode Error: \(error.localizedDescription)")
        }
    }
    
    
}

#Preview {
    ContentView()
}

