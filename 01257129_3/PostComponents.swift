import SwiftUI

// 圖片網格元件 (自動判斷 1, 2, 3 張圖的排版)
struct PostImageGridView: View {
    let images: [String]
    
    var body: some View {
        if images.isEmpty {
            EmptyView()
        } else if images.count == 1 {
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .aspectRatio(1.6, contentMode: .fit)
                .overlay(Image(systemName: images[0]).resizable().scaledToFit().padding(30).foregroundColor(.gray))
                .cornerRadius(12)
        } else if images.count == 2 {
            HStack(spacing: 4) {
                ForEach(images, id: \.self) { img in
                    Rectangle().fill(Color.gray.opacity(0.2)).frame(height: 150)
                        .overlay(Image(systemName: img).foregroundColor(.gray))
                        .cornerRadius(8)
                }
            }
        } else {
            HStack(spacing: 4) {
                ForEach(images.prefix(3), id: \.self) { img in
                    Rectangle().fill(Color.gray.opacity(0.2)).frame(height: 110)
                        .overlay(Image(systemName: img).foregroundColor(.gray))
                        .cornerRadius(8)
                }
            }
        }
    }
}

// 單一貼文列 (Row)
struct HoYoLABPostRow: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Header
            HStack(alignment: .top) {
                Circle()
                    .fill(Color.orange.opacity(0.2))
                    .frame(width: 40, height: 40)
                    .overlay(Image(systemName: "person.fill").foregroundColor(.orange))
                
                VStack(alignment: .leading, spacing: 2) {
                    HStack {
                        Text(post.author)
                            .font(.headline)
                        if post.isOfficial {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.blue)
                                .font(.caption)
                        }
                    }
                    Text(post.time)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Button("追蹤") { }
                    .font(.caption).bold()
                    .foregroundColor(Color(red: 0.3, green: 0.4, blue: 0.9))
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Capsule().stroke(Color(red: 0.3, green: 0.4, blue: 0.9), lineWidth: 1))
            }
            
            // Content
            Text(post.content)
                .font(.body)
                .lineLimit(3)
            
            // Images
            PostImageGridView(images: post.images)
            
            // Tags
            if !post.tags.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(post.tags, id: \.self) { tag in
                            Text("# \(tag)")
                                .font(.caption)
                                .foregroundColor(Color(red: 0.3, green: 0.4, blue: 0.9))
                        }
                    }
                }
            }
            
            // Footer
            HStack(spacing: 20) {
                Label(post.viewCount, systemImage: "eye")
                Label("\(post.commentCount)", systemImage: "bubble.left")
                Spacer()
                HStack(spacing: 4) {
                    Image(systemName: "hand.thumbsup")
                    Text("\(post.likeCount)")
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
    }
}

// --- 自定義 TabBar 按鈕元件 ---
struct TabBarButton: View {
    let icon: String
    let text: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 24))
                    .foregroundColor(isSelected ? Color(red: 0.3, green: 0.3, blue: 0.8) : .gray)
                Text(text)
                    .font(.caption2)
                    .foregroundColor(isSelected ? Color(red: 0.3, green: 0.3, blue: 0.8) : .gray)
            }
        }
    }
}
