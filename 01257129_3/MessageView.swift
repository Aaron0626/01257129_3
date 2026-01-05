import SwiftUI

struct MessageView: View {
    let notifications = [
        NotificationItem(icon: "speaker.wave.3.fill", color: .blue, title: "系統通知", time: "3天前", preview: "「月之四」版本預告", badgeCount: 18),
        NotificationItem(icon: "book.closed.fill", color: Color.blue.opacity(0.7), title: "玩轉HoYoLAB", time: "", preview: "沒有新通知", badgeCount: 0),
        NotificationItem(icon: "calendar", color: .orange, title: "活動通知", time: "2天前", preview: "千星奇城新增自機角色模式！", badgeCount: 51),
        NotificationItem(icon: "lightbulb.fill", color: .yellow, title: "創作者小助手", time: "5小時前", preview: "今天是和你 @zoey_涵 互加好友的一週...", badgeCount: 8),
        NotificationItem(icon: "gift.fill", color: .pink, title: "獎勵通知", time: "12-23", preview: "獲獎通知", badgeCount: 8),
        NotificationItem(icon: "person.2.fill", color: .purple, title: "社群管理員", time: "11-08", preview: "「千星奇城」圈子正式開放！", badgeCount: 1),
        NotificationItem(icon: "drop.fill", color: .blue, title: "BottleMi", time: "", preview: "今日還有6個漂流瓶待打開哦>>", badgeCount: 0)
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            
            ZStack {
                Text("訊息通知")
                    .font(.headline)
                    .bold()
                
                HStack {
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "gearshape")
                            .font(.system(size: 18))
                            .foregroundColor(.black)
                    }
                    .padding(.trailing, 20)
                }
            }
            .frame(height: 44)
            .background(Color.white)
            
            ScrollView {
                HStack(spacing: 0) {
                    ActionIcon(icon: "bubble.left.fill", color: .green, text: "評論&標記")
                    Spacer()
                    ActionIcon(icon: "hand.thumbsup.fill", color: .red, text: "讚數")
                    Spacer()
                    ActionIcon(icon: "heart.fill", color: .yellow, text: "粉絲")
                }
                .padding(.horizontal, 40)
                .padding(.vertical, 20)
                
                VStack(spacing: 0) {
                    ForEach(notifications) { item in
                        HStack(spacing: 16) {
                            ZStack {
                                Circle()
                                    .fill(Color.white)
                                Circle()
                                    .stroke(item.color.opacity(0.3), lineWidth: 1)
                                Image(systemName: item.icon)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(item.color)
                            }
                            .frame(width: 48, height: 48)
                            
                            // 右側文字內容
                            VStack(alignment: .leading, spacing: 4) {
                                HStack {
                                    Text(item.title)
                                        .font(.body)
                                        .foregroundColor(.primary)
                                    Spacer()
                                    // 紅點通知
                                    if item.badgeCount > 0 {
                                        Text("\(item.badgeCount)")
                                            .font(.caption2)
                                            .foregroundColor(.white)
                                            .padding(.horizontal, 6)
                                            .padding(.vertical, 2)
                                            .background(Capsule().fill(Color.red))
                                    }
                                }
                                
                                HStack {
                                    if !item.time.isEmpty {
                                        Text(item.time).foregroundColor(.gray)
                                        Text("•").foregroundColor(.gray)
                                    }
                                    Text(item.preview)
                                        .foregroundColor(.gray)
                                        .lineLimit(1)
                                }
                                .font(.caption)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 12)
                        
                        Divider()
                            .padding(.leading, 80)
                    }
                }
                
                Spacer(minLength: 80)
            }
        }
    }
}

struct ActionIcon: View {
    let icon: String
    let color: Color
    let text: String
    
    var body: some View {
        VStack(spacing: 8) {
            Circle()
                .fill(color.opacity(0.1))
                .frame(width: 50, height: 50)
                .overlay(Image(systemName: icon).foregroundColor(color))
            Text(text)
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    MessageView()
}
