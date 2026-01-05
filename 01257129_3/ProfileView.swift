import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // 1. 背景圖：提瓦特風格 (天空藍)
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.cyan]), startPoint: .top, endPoint: .bottom))
                    .frame(height: 150)
                    .frame(maxWidth: .infinity)
                    .overlay(
                        // 模擬元素圖標背景
                        HStack(spacing: 30) {
                            Image(systemName: "wind").opacity(0.2)
                            Image(systemName: "drop.fill").opacity(0.2)
                            Image(systemName: "leaf.fill").opacity(0.2)
                        }
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                    )
                
                VStack(alignment: .leading) {
                    // 2. 頭像
                    HStack(alignment: .bottom) {
                        ZStack {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 84, height: 84)
                            
                            // 這裡可以用你的相簿照片，暫時用圖標代替
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .foregroundColor(Color(red: 0.2, green: 0.6, blue: 0.8)) // 原神藍
                        }
                        .offset(y: -40)
                        
                        Spacer()
                        
                        Button(action: {}) {
                            HStack {
                                Image(systemName: "square.and.pencil")
                                Text("編輯")
                            }
                            .font(.caption).bold()
                            .foregroundColor(Color(red: 0.2, green: 0.6, blue: 0.8))
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Capsule().stroke(Color(red: 0.2, green: 0.6, blue: 0.8).opacity(0.5)))
                        }
                        .padding(.bottom, 10)
                    }
                    .padding(.horizontal)
                    .frame(height: 40)
                    
                    // 3. 個人資訊 (原神梗)
                    VStack(alignment: .leading, spacing: 8) {
                        Text("西風騎士團榮譽騎士") // 假暱稱
                            .font(.title2).bold()
                        
                        HStack {
                            Label("Lv.60", systemImage: "star.fill") // 滿等
                                .font(.caption2)
                                .padding(4)
                                .background(Color.yellow.opacity(0.3))
                                .cornerRadius(4)
                            
                            Text("IP屬地：提瓦特大陸")
                                .font(.caption2)
                                .foregroundColor(.gray)
                        }
                        
                        Text("UID: 100000001") // 開服大佬 ID
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Text("向著星辰與深淵！✨ 派蒙真的不是應急食品啦！😤") // 經典台詞
                            .font(.caption)
                            .foregroundColor(.primary)
                            .padding(.top, 4)
                    }
                    .padding(.horizontal)
                    
                    // 4. 社群數據
                    HStack(spacing: 0) {
                        StatItem(count: "58", label: "文章")
                        StatItem(count: "1.2k", label: "追蹤")
                        StatItem(count: "8.8萬", label: "粉絲")
                        StatItem(count: "10萬+", label: "獲讚")
                    }
                    .padding(.vertical)
                    
                    // 5. 創作中心
                    HStack(spacing: 12) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("創作者實驗室").bold()
                                Text("Lv.8 提瓦特攝影師").font(.caption2).opacity(0.8)
                            }
                            Spacer()
                            Image(systemName: "camera.fill").font(.title2)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 0.2, green: 0.6, blue: 0.8)) // 藍色
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("簽到中心").bold()
                                Text("今日已簽到").font(.caption2).opacity(0.8)
                            }
                            Spacer()
                            Image(systemName: "calendar.badge.checkmark").font(.title2)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                    
                    // 6. 遊戲資料卡片 (深境螺旋 & 成就)
                    VStack(spacing: 16) {
                        // 卡片頂部
                        HStack {
                            // 模擬神之眼圖示
                            Image(systemName: "circle.circle.fill")
                                .padding(8)
                                .background(Color.white.opacity(0.2))
                                .clipShape(Circle())
                                .foregroundColor(.cyan) // 風/水屬性色
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("旅行者").foregroundColor(.white).bold()
                                    Text("AR 60").font(.caption2).foregroundColor(.black).padding(2).background(Color.yellow).cornerRadius(2)
                                }
                                Text("Asia Server").font(.caption).foregroundColor(.white.opacity(0.7))
                            }
                            Spacer()
                            Image(systemName: "chevron.right").foregroundColor(.white.opacity(0.5))
                        }
                        
                        Divider().background(Color.white.opacity(0.2))
                        
                        // 卡片數據區
                        HStack {
                            GameStatItem(value: "1250", label: "活躍天數")
                            Spacer()
                            GameStatItem(value: "1350", label: "成就達成")
                            Spacer()
                            GameStatItem(value: "82", label: "獲得角色")
                            Spacer()
                            GameStatItem(value: "12-3", label: "深境螺旋") // 滿星
                        }
                    }
                    .padding()
                    .background(
                        // 模擬原神名片背景色 (深藍色漸層)
                        LinearGradient(gradient: Gradient(colors: [Color(red: 0.1, green: 0.1, blue: 0.3), Color(red: 0.1, green: 0.2, blue: 0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .cornerRadius(16)
                    .padding(.horizontal)
                    
                    Spacer(minLength: 50)
                }
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}

// 輔助元件 (如果你已經在其他檔案定義過，這部分可以不用重複貼)
// 為了確保 ProfileView 獨立運作，這裡保留一份
struct StatItem: View {
    let count: String
    let label: String
    
    var body: some View {
        VStack(spacing: 4) {
            Text(count).font(.title3).bold()
            Text(label).font(.caption).foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
    }
}

struct GameStatItem: View {
    let value: String
    let label: String
    
    var body: some View {
        VStack(spacing: 4) {
            Text(value).foregroundColor(.white).font(.headline).bold()
            Text(label).font(.caption2).foregroundColor(.white.opacity(0.6))
        }
    }
}

#Preview {
    ProfileView()
}
