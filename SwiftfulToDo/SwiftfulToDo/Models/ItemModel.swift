//
//  ItemModel.swift
//  SwiftfulToDo
//
//  Created by Okan Çifçi on 13.02.2024.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}


