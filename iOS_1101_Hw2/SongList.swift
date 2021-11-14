//
//  RestaurantList.swift
//  iOS_1101_Hw2
//
//  Created by CK on 2021/11/9.
//

import SwiftUI

struct SongList: View {
    let allSongs = [
        Song(name:"不是因為天氣晴朗才愛你",capo:"2",sheet: "sheet-不是因為天氣晴朗才愛你", lyric: ""),
        Song(name:"HotelCalifornia",capo:"0",sheet: "sheet-HotelCalifornia", lyric: ""),
        Song(name:"YouSayGoodbyeEasily",capo:"0",sheet: "sheet-YouSayGoodbyeEasily", lyric: ""),
        Song(name:"煙幕",capo:"0",sheet: "sheet-煙幕", lyric: ""),
        Song(name:"說好的幸福呢",capo:"0",sheet: "sheet-說好的幸福呢", lyric: ""),
        Song(name:"刻在我心底的名字",capo:"1",sheet: "sheet-刻在我心底的名字", lyric: "")
    ]
    
    let songStyle = ["loveSongs","rockSongs","jazzSongs"]
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                Text("風格")
                ScrollView(.horizontal){
                    HStack{
                        ForEach(songStyle,id:\.self){
                            song in
                            NavigationLink(
                                destination: Style(style: song),
                                label: {
                                    VStack{
                                        Image(song)
                                            .resizable()
                                            .frame(width: 150, height: 100)
                                        if song == "loveSongs"{
                                            
                                            Text("情歌")
                                        }
                                        if song == "rockSongs"{
                                            
                                            Text("搖滾")
                                        }
                                        if song == "jazzSongs"{
                                            
                                            Text("爵士")
                                        }
                                    }
                                })
                        }
                    }
                }
                
                VStack{
                    
                    List{
                        Text("歌曲")
                        ForEach(allSongs){
                            song in
                            NavigationLink(destination: SongDetail(name:song.name, sheet: song.sheet),label:{
                                
                                HStack{
                                    Image("\(song.name)")
                                        .resizable()
                                        .frame(width: 120, height: 100)
                                    
                                    Text("\(song.name)")
                                }
                            })
                        }
                    }
                }
            }.navigationTitle("歌詞譜")
        }
    }
}

struct SongDetail: View {
    
    let name: String
    let sheet: String
    
    var body: some View {
        
        VStack{
            Text(name)
            Image(sheet)
                .resizable()
        }
    }
}

struct Style: View {
    
    let loveSongs = [
        Song(name:"不是因為天氣晴朗才愛你",capo:"2",sheet: "sheet-不是因為天氣晴朗才愛你", lyric: ""),
        Song(name:"刻在我心底的名字",capo:"1",sheet: "sheet-刻在我心底的名字", lyric: ""),
        Song(name:"煙幕",capo:"0",sheet: "sheet-煙幕", lyric: ""),
        Song(name:"說好的幸福呢",capo:"0",sheet: "sheet-說好的幸福呢", lyric: ""),
    ]
    let rockSongs = [
        Song(name:"HotelCalifornia",capo:"0",sheet: "sheet-hotelCalifornia", lyric: "")
    ]
    let jazzSongs = [
        Song(name:"YouSayGoodbyeEasily",capo:"0",sheet: "sheet-YouSayGoodbyeEasily", lyric: ""),
    ]
    
    let style: String
    
    var body: some View {
        
        VStack{
            Text(style)
            if style == "loveSongs"{
                
                List{
                    ForEach(loveSongs){
                        song in
                        NavigationLink(
                            destination: SongDetail(name: song.name, sheet: song.sheet),
                            label: {
                                HStack{
                                    Image("\(song.name)")
                                        .resizable()
                                        .frame(width: 120, height: 100)
                                    
                                    Text("\(song.name)")
                                }
                            })
                    }
                }
            }
            if style == "rockSongs"{
                
                List{
                    ForEach(rockSongs){
                        song in
                        NavigationLink(
                            destination: SongDetail(name: song.name, sheet: song.sheet),
                            label: {
                                HStack{
                                    Image("\(song.name)")
                                        .resizable()
                                        .frame(width: 120, height: 100)
                                    
                                    Text("\(song.name)")
                                }
                            })
                    }
                }
            }
            if style == "jazzSongs"{
                
                List{
                    ForEach(jazzSongs){
                        song in
                        NavigationLink(
                            destination: SongDetail(name: song.name, sheet: song.sheet),
                            label: {
                                HStack{
                                    Image("\(song.name)")
                                        .resizable()
                                        .frame(width: 120, height: 100)
                                    
                                    Text("\(song.name)")
                                }
                            })
                    }
                }
            }   
        }
    }
}
struct RestaurantList_Previews: PreviewProvider {
    static var previews: some View {
        SongList()
    }
}
