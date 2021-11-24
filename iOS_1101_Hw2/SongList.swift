//
//  RestaurantList.swift
//  iOS_1101_Hw2
//
//  Created by CK on 2021/11/9.
//

import SwiftUI

struct SongList: View {
    let allSongs = [
        Song(name:"While Your Lips Are Still Red",capo:"1",sheet: "sheet-While Your Lips Are Still Red", sheetNumber:5),
        Song(name:"不是因為天氣晴朗才愛你",capo:"2",sheet: "sheet-不是因為天氣晴朗才愛你", sheetNumber: 2),
        Song(name:"HotelCalifornia",capo:"0",sheet: "sheet-HotelCalifornia", sheetNumber:1),
        Song(name:"YouSayGoodbyeEasily",capo:"0",sheet: "sheet-YouSayGoodbyeEasily", sheetNumber:1),
        Song(name:"煙幕",capo:"0",sheet: "sheet-煙幕", sheetNumber:1),
        Song(name:"說好的幸福呢",capo:"0",sheet: "sheet-說好的幸福呢", sheetNumber:1),
        Song(name:"刻在我心底的名字",capo:"1",sheet: "sheet-刻在我心底的名字", sheetNumber:1)
    ]
    
    let songStyle = ["loveSongs","rockSongs","jazzSongs"]
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                Text("風格:")
                    .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.green]), startPoint: UnitPoint(x:0,y:0), endPoint: UnitPoint(x:1,y:1)))
                    .offset(x: -85, y: 20)
                    .scaleEffect(1.5)
                ScrollView(.horizontal){
                    let rows = [GridItem()]
                    LazyHGrid(rows: rows){
                        ForEach(songStyle,id:\.self){
                            song in
                            NavigationLink(
                                destination: Style(style: song),
                                label: {
                                    VStack{
                                        Image(song)
                                            .resizable()
                                            .frame(width: 140, height: 100)
                                            .cornerRadius(20)
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
                            NavigationLink(destination: SongDetail(name:song.name, sheet: song.sheet, sheetNumber: song.sheetNumber),label:{
                                
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
    let sheetNumber: Int
    var number = 0
    
    var body: some View {
        
        VStack{
            Text(name)
            TabView{
                ForEach(1..<sheetNumber+1){numbers in
                    
                    
                    Image("\(sheet)"+"\(numbers)")
                        .resizable()
                        .transition(.opacity)
                }
            }.tabViewStyle(PageTabViewStyle())
        }
    }
}

struct Style: View {
    
    let loveSongs = [
        Song(name:"不是因為天氣晴朗才愛你",capo:"2",sheet: "sheet-不是因為天氣晴朗才愛你", sheetNumber:2),
        Song(name:"刻在我心底的名字",capo:"1",sheet: "sheet-刻在我心底的名字", sheetNumber:1),
        Song(name:"煙幕",capo:"0",sheet: "sheet-煙幕", sheetNumber:1),
        Song(name:"說好的幸福呢",capo:"0",sheet: "sheet-說好的幸福呢", sheetNumber:1),
    ]
    let rockSongs = [
        Song(name:"While Your Lips Are Still Red",capo:"1",sheet: "sheet-While Your Lips Are Still Red", sheetNumber:5),
        Song(name:"HotelCalifornia",capo:"0",sheet: "sheet-hotelCalifornia", sheetNumber:1)
    ]
    let jazzSongs = [
        Song(name:"YouSayGoodbyeEasily",capo:"0",sheet: "sheet-YouSayGoodbyeEasily", sheetNumber:1),
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
                            destination: SongDetail(name: song.name, sheet: song.sheet, sheetNumber: song.sheetNumber),
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
                            destination: SongDetail(name: song.name, sheet: song.sheet, sheetNumber: song.sheetNumber),
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
                            destination: SongDetail(name: song.name, sheet: song.sheet, sheetNumber: song.sheetNumber),
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
