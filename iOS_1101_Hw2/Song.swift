//
//  Restaurant.swift
//  iOS_1101_Hw2
//
//  Created by CK on 2021/11/9.
//

import Foundation
import SwiftUI

struct Song:Identifiable{
    let id = UUID()
    let name : String
    let capo : String
    let sheet : String
    let sheetNumber : Int
}
