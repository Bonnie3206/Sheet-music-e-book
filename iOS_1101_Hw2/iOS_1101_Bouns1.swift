//
//  iOS_1101_Bouns1.swift
//  iOS_1101_Hw2
//
//  Created by CK on 2021/10/27.
//

import SwiftUI

struct iOS_1101_Bouns1: View {
    @State var action =  "幹麻呢"
    @State var option =  ["親親","抱抱","飛高高"]
    //@State var randNum =  1
    @State var randomElement =  1
    var body: some View {
        ZStack{
            Image("Bouns2")
                .resizable()
                .scaledToFit()
            VStack{
                Button(action:{
                    let randNum = 0...2
                    randomElement = randNum.randomElement()!
                    action = option[randomElement]
                }){
                    Text("今天要幹嘛")
                        .font(.largeTitle)
                }.offset(x: 0, y: -330)
                
                
                Text("\(action)")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .background(Color(red:91/255, green:199/255, blue:199/255))
                    .cornerRadius(10)
                    .offset(x: 0, y: 330)
                
                
            }
        }
    }
}

struct iOS_1101_Bouns1_Previews: PreviewProvider {
    static var previews: some View {
        iOS_1101_Bouns1()
    }
}
