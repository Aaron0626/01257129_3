import SwiftUI

struct PublishModalView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .leading, spacing: 20) {
                // 標題與關閉按鈕
                HStack {
                    Text("發表").font(.title2).bold()
                    Spacer()
                    Button(action: { isPresented = false }) {
                        Image(systemName: "xmark.circle.fill").foregroundColor(.gray).font(.title)
                    }
                }
                
                // 4個主要功能圖示
                HStack(spacing: 0) {
                    PublishIcon(icon: "doc.text.image", color: .green, title: "圖文")
                    Spacer()
                    PublishIcon(icon: "photo", color: .blue, title: "圖片")
                    Spacer()
                    PublishIcon(icon: "star.fill", color: .yellow, title: "奇才專欄")
                    Spacer()
                    PublishIcon(icon: "video.fill", color: .orange, title: "影片")
                }
                
                Text("熱門範本").font(.headline).padding(.top)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<4) { _ in
                            RoundedRectangle(cornerRadius: 8).fill(Color.orange.opacity(0.2)).frame(width: 100, height: 60)
                                .overlay(Text("遊戲日記").font(.caption).bold())
                        }
                    }
                }
                
                Text("熱門話題").font(.headline).padding(.top)
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image(systemName: "number").foregroundColor(.white).padding(6).background(Color.blue).clipShape(Circle())
                        VStack(alignment: .leading) {
                            Text("GenshinImpact").bold()
                            Text("1.4萬 篇文章").font(.caption).foregroundColor(.gray)
                        }
                    }
                    Divider()
                    HStack {
                        Image(systemName: "number").foregroundColor(.white).padding(6).background(Color.blue).clipShape(Circle())
                        VStack(alignment: .leading) {
                            Text("月之四").bold()
                            Text("8.2萬 篇文章").font(.caption).foregroundColor(.gray)
                        }
                    }
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 10)
        }
        .background(Color.black.opacity(0.4).onTapGesture { isPresented = false }) // 點擊背景關閉
        .ignoresSafeArea()
    }
}

struct PublishIcon: View {
    let icon: String; let color: Color; let title: String
    var body: some View {
        VStack {
            Circle().fill(color.opacity(0.1)).frame(width: 60, height: 60)
                .overlay(Image(systemName: icon).font(.title2).foregroundColor(color))
            Text(title).font(.caption)
        }
    }
}
