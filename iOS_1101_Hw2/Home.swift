//
//  Home.swift
//  iOS_1101_Hw2
//
//  Created by CK on 2021/11/12.
//音樂連結、我的最愛

import SwiftUI
import AVKit

struct Links:Identifiable{
    let id = UUID()
    let name:String
    let url :String
    
}
struct Video:Identifiable{
    let id = UUID()
    let name:String
    let url :String
    
}
struct VideoView: View{
    let video : Video
    var body: some View {
        VideoPlayer(player: AVPlayer(url: URL(string: video.url)!))
    }
}
struct Home: View {
    
    let allSongs = [
        
        Song(name:"HotelCalifornia",capo:"0",sheet: "sheet-HotelCalifornia", lyric: ""),
        Song(name:"YouSayGoodbyeEasily",capo:"0",sheet: "sheet-YouSayGoodbyeEasily", lyric: ""),
        Song(name:"煙幕",capo:"0",sheet: "sheet-煙幕", lyric: ""),
        Song(name:"說好的幸福呢",capo:"0",sheet: "sheet-說好的幸福呢", lyric: ""),
        Song(name:"刻在我心底的名字",capo:"1",sheet: "sheet-刻在我心底的名字", lyric: ""),
        Song(name:"不是因為天氣晴朗才愛你",capo:"2",sheet: "sheet-不是因為天氣晴朗才愛你", lyric: "")
    ]
    
    let songStyle = ["loveSongs","rockSongs","jazzSongs"]
    let songVideos = [
        
        Video(name: "HotelCalifornia", url: "https://youtu.be/EqPtz5qN7HM"),
        Video(name: "煙幕", url: "https://youtu.be/P8uJ4gFjJGE"),
        Video(name: "說好的幸福呢", url: "https://youtu.be/mLFhTFiX0uM"),
        Video(name: "刻在我心底的名字", url: "https://youtu.be/m78lJuzftcc"),
        Video(name: "不是因為天氣晴朗才愛你", url: "https://youtu.be/9_068Ekk_fs"),
    ]
    let learingLinks = [
        Links(name: "演奏技巧", url: "https://youtu.be/Dfcu1tVuYbI"),
        Links(name: "封閉和弦", url: "https://youtu.be/m78lJuzftcc"),
        Links(name: "如何更好聽", url: "https://youtu.be/B-sWwKnumV8"),
        Links(name: "刷弦技巧", url: "https://youtu.be/nQQcfsFhX_8"),
        Links(name: "指彈基本功", url: "https://youtu.be/DVTWSOgyrAM"),
    ]
        
    var body: some View {
        
        NavigationView{
            
            VStack{
                Image("首頁圖")
                    .resizable()
                    .frame(width: 450, height: 300)
                Section(header: Text("聽音樂囉")){
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(songVideos){
                                video in
                                NavigationLink(
                                    destination: VideoView(video: video),
                                    label: {
                                        VStack{
                                            Image(video.name)
                                                .resizable()
                                                .frame(width: 150, height: 100)
                                            Text(video.name)

                                        }
                                    })
                            }
                        }
                    }
                }
                
                Section(header: Text("如何練吉他")){
                    
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(learingLinks){
                                link in
                                Link(
                                    destination: URL(string: link.url)!,
                                    label: {
                                        VStack{
                                            Image("吉他學習")
                                                .resizable()
                                                .frame(width: 150, height: 100)
                                            Text(link.name)

                                        }
                                    }
                                )
                            }
                        }
                    }
                }
            }.navigationTitle("一起玩吉他")
        }
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
