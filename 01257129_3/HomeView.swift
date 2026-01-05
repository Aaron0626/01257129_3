import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    
    let topics = [
        ("# 瑪薇卡", "fire.fill", "6.7萬 篇文章/31萬 人加入"),
        ("# 希諾寧", "leaf.fill", "2.2萬 篇文章/23萬 人加入"),
        ("# 懸木人", "tree.fill", "1.7萬 篇文章/26萬 人加入")
    ]
    
    let posts: [Post] = [
        Post(
            author: "原神官方",
            time: "5小時前",
            content: "「月之四」版本「活動日曆」現已上線！點擊查看即時掌握版本福利 >>",
            images: ["calendar"],
            tags: [],
            likeCount: 1053,
            commentCount: 89,
            viewCount: "1.2萬",
            isOfficial: true
        ),
        Post(
            author: "原神官方",
            time: "5小時前",
            content: "雅珂達，生日快樂！",
            images: ["birthday.cake.fill"],
            tags: [],
            likeCount: 1621,
            commentCount: 155,
            viewCount: "6739",
            isOfficial: true
        ),
        Post(
            author: "原神官方",
            time: "6小時前",
            content: "🌕「去月的歸處」實體主題活動 旅程的神秘面紗，即刻緩緩掀開。旅行者，準備好迎接新版本《如果在冬夜，一個旅人》了嗎？",
            images: ["moon.stars.fill", "figure.walk", "party.popper.fill"],
            tags: [],
            likeCount: 118,
            commentCount: 19,
            viewCount: "1729",
            isOfficial: true
        ),
        Post(
            author: "璐洛洛",
            time: "14小時前",
            content: "【原神】少女來了！哥倫比亞/茲白💥「月之四」前瞻懶人包🎯‧全新「月結晶」反應是... 哈哈囉哈囉！我是虛擬YouTuber璐洛洛",
            images: ["video.fill"],
            tags: ["HoYoLAB創作計畫", "月之四前瞻", "月之四版本"],
            likeCount: 30,
            commentCount: 0,
            viewCount: "200",
            isOfficial: false
        ),
        Post(
            author: "璐洛洛",
            time: "16小時前",
            content: "【絕區零】萊瞬光&照💫2.5必抽人權！買一送一的超值代理人？‧全新危局BOSS「太初... 我是虛擬YouTuber璐洛洛 本次影片要帶來的《絕區零》2.5版本新登場",
            images: ["play.rectangle.fill"],
            tags: ["HoYoLAB創作計畫-ZZZero", "絕區零攻略站", "萊瞬"],
            likeCount: 24,
            commentCount: 0,
            viewCount: "94",
            isOfficial: false
        ),
        Post(
            author: "小可莉OuO",
            time: "17小時前",
            content: "‼️最新原神素材兌換碼‼️ (共1組) 可莉提醒榮譽騎士們記得領取✨ 🟦藍色連結可直接點擊兌換‼️若連結不能使用可到留言區置頂複製...",
            images: ["gift.fill"],
            tags: ["原神", "兌換碼", "兌換碼網址", "兌換碼傳送門"],
            likeCount: 216,
            commentCount: 8,
            viewCount: "3001",
            isOfficial: false
        ),
        Post(
            author: "Arbens",
            time: "19小時前",
            content: "凱亞 Hypercarry 單冰元素小隊構建",
            images: ["chart.bar.fill", "chart.pie.fill", "list.bullet.rectangle.fill"],
            tags: ["凱亞"],
            likeCount: 57,
            commentCount: 21,
            viewCount: "213",
            isOfficial: false
        ),
        Post(
            author: "Nonemii",
            time: "1天前",
            content: "HABBY BDAY WANDERER",
            images: ["paintpalette.fill"],
            tags: ["同人作品", "杜林", "流浪者"],
            likeCount: 30,
            commentCount: 0,
            viewCount: "164",
            isOfficial: false
        )
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 20) {
                VStack(spacing: 4) {
                    Text("追蹤")
                        .bold()
                        .foregroundColor(.black)
                        .font(.title3)
                    // 藍色底線
                    Rectangle()
                        .frame(width: 20, height: 3)
                        .foregroundColor(Color(red: 0.3, green: 0.4, blue: 0.9))
                        .cornerRadius(1.5)
                }
                Text("首頁")
                    .foregroundColor(.gray)
                    .font(.subheadline)
                Text("活動")
                    .foregroundColor(.gray)
                    .font(.subheadline)
                Spacer()
            }
            .padding(.horizontal)
            .padding(.bottom, 8)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("簽到", text: $searchText)
            }
            .padding(10)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(20)
            .padding(.horizontal)
            
            ScrollView {
                VStack(spacing: 0) {
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("已加入的話題")
                                .font(.headline)
                            Spacer()
                            HStack(spacing: 4) {
                                Text("查看更多")
                                Image(systemName: "chevron.right")
                            }
                            .font(.caption)
                            .foregroundColor(.blue)
                        }
                        .padding(.horizontal)
                        .padding(.top)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(topics, id: \.0) { topic in
                                    HStack(spacing: 12) {
                                        // 話題圖示
                                        Image(systemName: topic.1)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 24, height: 24)
                                            .padding(10)
                                            .background(Color.gray.opacity(0.1)) // 淺灰底
                                            .cornerRadius(8)
                                            .foregroundColor(.blue) // 預設藍色圖示
                                        
                                        // 話題文字
                                        VStack(alignment: .leading, spacing: 2) {
                                            Text(topic.0)
                                                .font(.subheadline)
                                                .bold()
                                            Text(topic.2)
                                                .font(.system(size: 10))
                                                .foregroundColor(.gray)
                                        }
                                        
                                        Spacer()
                                        
                                        Text("+99")
                                            .font(.system(size: 10, weight: .bold))
                                            .foregroundColor(.white)
                                            .padding(.horizontal, 6)
                                            .padding(.vertical, 2)
                                            .background(Capsule().fill(Color.red.opacity(0.8)))
                                    }
                                    .padding(8)
                                    .frame(width: 220, alignment: .leading)
                                    .background(Color.white)
                                    .cornerRadius(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.gray.opacity(0.1), lineWidth: 1)
                                    )
                                }
                            }
                            .padding(.horizontal)
                            .padding(.bottom, 12)
                        }
                    }
                    .background(Color.white)
                    .padding(.bottom, 8) // 與貼文列表的間距
                    
                    LazyVStack(spacing: 8) {
                        ForEach(posts) { post in
                            HoYoLABPostRow(post: post)
                        }
                    }
                    .background(Color(uiColor: .systemGroupedBackground))
                }
                
                Spacer(minLength: 80)
            }
            .background(Color(uiColor: .systemGroupedBackground))
        }
    }
}

#Preview {
    HomeView()
}
