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
        Song(name:"While Your Lips Are Still Red",capo:"1",sheet: "sheet-While Your Lips Are Still Red", sheetNumber:5),
        Song(name:"HotelCalifornia",capo:"0",sheet: "sheet-HotelCalifornia", sheetNumber:1),
        Song(name:"YouSayGoodbyeEasily",capo:"0",sheet: "sheet-YouSayGoodbyeEasily", sheetNumber:1),
        Song(name:"煙幕",capo:"0",sheet: "sheet-煙幕", sheetNumber:1),
        Song(name:"說好的幸福呢",capo:"0",sheet: "sheet-說好的幸福呢", sheetNumber:1),
        Song(name:"刻在我心底的名字",capo:"1",sheet: "sheet-刻在我心底的名字", sheetNumber:1),
        Song(name:"不是因為天氣晴朗才愛你",capo:"2",sheet: "sheet-不是因為天氣晴朗才愛你", sheetNumber:2)
    ]
    
    let songStyle = ["loveSongs","rockSongs","jazzSongs"]
    let songVideos = [
        
        Video(name: "HotelCalifornia", url: "https://redirector.googlevideo.com/videoplayback?expire=1637746000&ei=8LCdYa2jLMPL7QTMyKP4BQ&ip=45.137.189.179&id=o-AOO9EQRkATtDGFJBXHTSeyedzFIWNP_6PTOaO9fYBkbA&itag=18&source=youtube&requiressl=yes&mh=0T&mm=31%2C26&mn=sn-n8v7znlk%2Csn-c0q7lns7&ms=au%2Conr&mv=m&mvi=1&pl=24&gcr=ru&initcwndbps=6357500&vprv=1&mime=video%2Fmp4&ns=3pueGSc1gZurfG2ZVYbNxAwG&gir=yes&clen=19340238&ratebypass=yes&dur=390.420&lmt=1598077993341988&mt=1637723586&fvip=1&fexp=24001373%2C24007246&c=WEB&txp=5531422&n=JyOGPMISjv-Ynt1w&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cgcr%2Cvprv%2Cmime%2Cns%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRQIgEji1bFobFMEjq3h9d7Rls4rPRCn_P7rRk1I9AQezxdkCIQDJRDxWOBscXWf4Holazy7s0oZo4vGQeRf5kukmRnVXqA%3D%3D&sig=AOq0QJ8wRgIhAI6Y2Qb-g_raNu9dq4cSKmSP3cnQCLG1mopbu8h_gteQAiEA0ivir31BvUvg8ZfyMfghorwZ3-zvj8mhrdbGb3xy9bo=&title=Eagles_-_Hotel_California"),
        Video(name: "煙幕", url: "https://bit.ly/3FHHLHP"),
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
    
    @State private var opacity: Double = 1
    @State private var scale: CGFloat = 1
    @State private var button = false
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                Button(action: {
                    button.toggle()
                    
                    if button == true{
                        opacity = 0.8
                        scale = 1.5
                    }else{
                        opacity = 1
                        scale = 1
                    }
                }, label: {
                    Image("首頁圖")
                        .resizable()
                        .frame(width: 450, height: 300)
                        .animation(.default, value: opacity)
                        .animation(.default, value: scale)
                })
                
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
