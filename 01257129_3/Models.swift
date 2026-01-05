import SwiftUI

struct Post: Identifiable {
    let id = UUID()
    let author: String
    let time: String
    let content: String
    let images: [String]
    let tags: [String]
    let likeCount: Int
    let commentCount: Int
    let viewCount: String
    let isOfficial: Bool
}

struct NotificationItem: Identifiable {
    let id = UUID()
    let icon: String
    let color: Color
    let title: String
    let time: String
    let preview: String
    let badgeCount: Int
}
