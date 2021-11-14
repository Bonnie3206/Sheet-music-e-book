//
//  ContentView.swift
//  iOS_1101_Hw2
//
//  Created by CK on 2021/10/20.
//水平歌手，垂直歌單

import SwiftUI


struct ContentView: View {
    var body: some View {
        
        
        TabView{
            
            Home()
                .tabItem {
                    Label("首頁",systemImage:"house")
                }
            SongList()
                .tabItem {
                    Label("歌詞譜",systemImage:"character.book.closed")
                }
            Image("和弦表")
                .resizable()
                .scaledToFit()
                .tabItem {
                    Label("和弦表",systemImage:"newspaper")
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
