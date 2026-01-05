import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    @State private var showPublishModal = false // 控制彈窗顯示
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // 1. 主內容區 (根據 selectedTab 切換)
            Group {
                switch selectedTab {
                case 0: HomeView()
                case 1: CircleView()
                case 2: Color.white // 佔位，不會真的顯示
                case 3: MessageView()
                case 4: ProfileView()
                default: HomeView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            // 2. 自定義 Tab Bar (取代系統 TabView)
            VStack(spacing: 0) {
                Divider()
                HStack {
                    TabBarButton(icon: "house.fill", text: "首頁", isSelected: selectedTab == 0) { selectedTab = 0 }
                    Spacer()
                    TabBarButton(icon: "person.3.fill", text: "圈子", isSelected: selectedTab == 1) { selectedTab = 1 }
                    Spacer()
                    
                    // 中間的 (+) 按鈕
                    Button(action: {
                        withAnimation { showPublishModal = true }
                    }) {
                        Image(systemName: "plus")
                            .font(.title2.bold())
                            .foregroundColor(.white)
                            .frame(width: 48, height: 48)
                            .background(Color.black)
                            .clipShape(Circle())
                            .shadow(radius: 4)
                    }
                    .offset(y: 0) 
                    
                    Spacer()
                    TabBarButton(icon: "bubble.left.and.bubble.right.fill", text: "訊息", isSelected: selectedTab == 3) { selectedTab = 3 }
                    Spacer()
                    TabBarButton(icon: "person.crop.circle", text: "個人主頁", isSelected: selectedTab == 4) { selectedTab = 4 }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 10) // 避開 iPhone Home Indicator
                .background(Color.white)
            }
            
            // 3. 發佈彈窗 (覆蓋在最上層)
            if showPublishModal {
                PublishModalView(isPresented: $showPublishModal)
                    .transition(.move(edge: .bottom)) // 從底部滑入動畫
                    .zIndex(2)
            }
        }
    }
}

#Preview {
    ContentView()
}
