import SwiftUI

struct CircleView: View {
    // 頂部導覽分類
    let categories = ["官方", "酒館", "HoYoGuides", "角色", "求助"]
    @State private var selectedTab = "酒館"
    
    let posts: [Post] = [
        Post(
            author: "旁白觀察者",
            time: "5小時前",
            content: "#立本千爹的第一手情報 我只好寄點亮新地圖的靠風神神像嗎？問題我是風神瞳已經供奉滿了欸～",
            images: ["map.fill", "location.fill", "questionmark.folder.fill"],
            tags: ["原神", "立本"],
            likeCount: 6,
            commentCount: 3,
            viewCount: "113",
            isOfficial: false
        ),
        Post(
            author: "旅行×開拓",
            time: "6小時前",
            content: "【原神 & 6.3版本】快速理解\n原神 6.3版本 重點1。雙子（空 & 熒）維萊特和瑤瑤有新肌膚 其中 空 熒、瑤瑤 都能免費獲得。",
            images: ["doc.richtext.fill", "tshirt.fill", "gift.fill"],
            tags: ["海燈節", "版本總結"],
            likeCount: 12,
            commentCount: 0,
            viewCount: "139",
            isOfficial: false
        ),
        Post(
            author: "zephyrlight (val)",
            time: "1天前",
            content: "你在等哪5*?",
            images: ["list.star"],
            tags: ["萊歐斯利", "綠柯克", "愛可菲"],
            likeCount: 303,
            commentCount: 263,
            viewCount: "1.6萬",
            isOfficial: false
        ),
        Post(
            author: "迷忙",
            time: "1天前",
            content: "這像俱（椅子）真是擺對了",
            images: ["chair.lounge.fill", "chair.fill"],
            tags: ["原神", "GenshinImpact"],
            likeCount: 12,
            commentCount: 0,
            viewCount: "357",
            isOfficial: false
        ),
        Post(
            author: "★༄ Wanderer ...",
            time: "1小時前",
            content: "其他平臺的 Player 對這個阿龍試聽瘋狂了! 😆",
            images: ["headphones.circle.fill"],
            tags: ["月之三", "那維萊特", "(原神) 迷因"],
            likeCount: 3,
            commentCount: 1,
            viewCount: "29",
            isOfficial: false
        ),
        Post(
            author: "・yukii・",
            time: "1天前",
            content: "5* 角色 I 在 2025 年獲得 (從 5.8 開始)",
            images: ["person.3.sequence.fill", "calendar"],
            tags: ["GenshinImpact", "2025"],
            likeCount: 131,
            commentCount: 41,
            viewCount: "1.7萬",
            isOfficial: false
        ),
        Post(
            author: "Calisto505",
            time: "2天前",
            content: "最後,空終止運行成為一個男人,不再穿著修女的衣服 🥲",
            images: ["figure.stand", "tshirt", "face.smiling"],
            tags: ["空"],
            likeCount: 1148,
            commentCount: 231,
            viewCount: "3.9萬",
            isOfficial: false
        ),
        Post(
            author: "user_383202852",
            time: "1小時前",
            content: "請問這個是怎樣領取？",
            images: ["questionmark.square.fill"],
            tags: ["熱門評論"],
            likeCount: 21,
            commentCount: 512,
            viewCount: "10.3萬",
            isOfficial: false
        ),
        Post(
            author: "johann",
            time: "1天前",
            content: "準備好C6 columbina 😌✔️",
            images: ["circle.grid.hex.fill", "checkmark.circle.fill"],
            tags: ["GenshinImpact", "伊涅芙"],
            likeCount: 2675,
            commentCount: 22,
            viewCount: "9.4萬",
            isOfficial: false
        )
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            Color.blue.opacity(0.1).frame(height: 10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 24) {
                    ForEach(categories, id: \.self) { cat in
                        VStack(spacing: 6) {
                            Text(cat)
                                .font(.system(size: 16, weight: selectedTab == cat ? .bold : .regular))
                                .foregroundColor(selectedTab == cat ? .black : .gray)
                            
                            // 選中時的藍色底線
                            if selectedTab == cat {
                                Capsule()
                                    .frame(width: 20, height: 3)
                                    .foregroundColor(Color(red: 0.2, green: 0.5, blue: 1.0))
                            } else {
                                Capsule()
                                    .frame(width: 20, height: 3)
                                    .foregroundColor(.clear)
                            }
                        }
                        .onTapGesture { selectedTab = cat }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 8)
            }
            .background(Color.white)
            
            Divider()
            
            HStack {
                Text("文章")
                    .font(.subheadline)
                    .bold()
                Spacer()
                HStack(spacing: 4) {
                    Text("熱門")
                    Image(systemName: "chevron.down")
                }
                .font(.caption)
                .foregroundColor(.gray)
                .padding(6)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(4)
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(Color.white)
            
            ScrollView {
                LazyVStack(spacing: 8) {
                    ForEach(posts.prefix(6)) { post in
                        HoYoLABPostRow(post: post)
                    }
                    
                    HotTopicsSection()
                    
                    // 顯示剩餘的貼文
                    ForEach(posts.suffix(from: 6)) { post in
                        HoYoLABPostRow(post: post)
                    }
                }
                .background(Color(uiColor: .systemGroupedBackground))
                
                // 底部留白，避免被 TabBar 擋住
                Spacer(minLength: 80)
            }
        }
    }
}

struct HotTopicsSection: View {
    let topics = [
        ("節奏派對", "586 篇文章"),
        ("千星奇城", "1萬 篇文章"),
        ("奇匠論壇", "442 篇文章"),
        ("印章交換", "646 篇文章")
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("熱門話題")
                    .font(.headline)
                Spacer()
                HStack {
                    Text("查看更多話題")
                    Image(systemName: "chevron.right")
                }
                .font(.caption)
                .foregroundColor(.blue)
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(topics, id: \.0) { topic in
                        HStack {
                            Image(systemName: "number") // 模擬話題 icon
                                .padding(8)
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(8)
                                .foregroundColor(.blue)
                            
                            VStack(alignment: .leading) {
                                Text(topic.0)
                                    .font(.subheadline)
                                    .bold()
                                Text(topic.1)
                                    .font(.caption2)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(8)
                        .background(Color.white)
                        .cornerRadius(8)
                        .frame(width: 150, alignment: .leading)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 12)
            }
        }
        .background(Color.white)
    }
}
