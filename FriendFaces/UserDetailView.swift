//
//  UserDetailView.swift
//  Friendfaces
//
//  Created by Ricardo on 18/04/24.
//

import SwiftUI
import Flow

struct UserDetailView: View {
    var user: User
    
    init(user: User){
        self.user = user
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = UIColor.red
        UIScrollView.appearance().backgroundColor = UIColor.systemGroupedBackground
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment:.leading, spacing: 24) {
                
                // Information Section
                VStack(alignment:.leading){
                    SectionHeaderView(text: "Details")
                    SectionCardView {
                        VStack(alignment: .leading) {
                            Text("Email")
                                .font(.callout)
                                .foregroundStyle(Color(UIColor.secondaryLabel))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom, 0.2)
                            Text(user.email)
                                .foregroundColor(.blue)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        Divider()
                        ContactInfoView(title: "Address", icon: "mappin.and.ellipse", text: user.address)
                    }
                }

                // About Section
                VStack(alignment:.leading){
                    SectionHeaderView(text: "About")
                    
                    SectionCardView {
                            Text(user.about)
                                .font(.body)
                                .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                

                // Tags Section
                if !user.tags.isEmpty {
                    VStack(alignment: .leading){
                        SectionHeaderView(text: "Tags")
                        SectionCardView {
                            VStack(alignment: .leading, spacing: 10) {
                                TagsView(tags: user.tags)
                            }
                        }
                    }
                }

                // Friends Section
                if !user.friends.isEmpty {
                    VStack(alignment:.leading){
                        SectionHeaderView(text: "Friends")
                        SectionCardView {
                            VStack(alignment: .leading, spacing: 10) {
                                ForEach(Array(user.friends.enumerated()), id: \.element.id) { index, friend in
                                    NavigationLink(destination: FriendDetailView(friend: friend)) {
                                        Text(friend.name)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                    if index < user.friends.count - 1 {
                                                Divider()
                                            }
                                }
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .navigationTitle(Text(user.name))
        .navigationBarTitleDisplayMode(.large)
    }
    
    
}


struct ContactInfoView: View {
    let title: String
    let icon: String
    let text: String
    
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text(title)
                    .font(.callout)
                    .foregroundStyle(Color(UIColor.secondaryLabel))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 3.0)
                    .padding(.bottom, 0.2)
                Text(text)
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            if !icon.isEmpty {
                Image(systemName: icon)
                    .renderingMode(.template)
                    .foregroundColor(.blue)
                    .font(.headline)
                    .padding(10)
                    .background(Circle()
                        .fill(Color(UIColor.quaternarySystemFill)))
            }
        }
        
    }
}

struct SectionHeaderView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.headline)
            .padding(.leading, 4)
        
    }
}

struct TagsView: View {
    let tags: [String]
    
    var body: some View {
        HFlow {
            ForEach(tags, id: \.self) { tag in
                Text(tag + (tag != tags.last ? "," : ""))
                    .foregroundStyle(.link)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// Placeholder for friend detail view
struct FriendDetailView: View {
    let friend: Friend
    
    var body: some View {
        Text("Empty")
    }
}


// A generic card view modifier to apply to each section
struct SectionCardView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
                    content
                }
                .padding() // Apply internal padding for content
                .background(RoundedRectangle(cornerRadius: 15).fill(Color(.systemBackground)))
    }
}

#Preview {
    let friend1 = Friend(id: "1221092", name: "Hawkins Patel")
    let friend2 = Friend(id: "1221093", name: "Jewel Sexton")
    

    let user = User(
        id: "1221091",
        isActive: false,
        name: "Alford Rodriguez",
        age: 21,
        company: "Imkan",
        email: "alfordrodriguez@imkan.com",
        address: "907 Nelson Street, Cotopaxi, South Dakota, 5913",
        about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore.",
        registered: Date(),
        tags: ["cillum", "consequat", "deserunt", "dcillum", "conseqdfuat", "desedrunt","cillugm", "consehdgquat", "deserhunt"],
        friends: [friend1, friend2]
    )
    
    return NavigationStack{UserDetailView(user: user)   }
}

