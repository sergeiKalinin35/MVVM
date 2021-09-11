//
//  Course.swift
//  MVVM
//
//  Created by Sergey on 10.09.2021.
//

import Foundation

struct Course: Decodable {
    let name: String?
    let imageUrl: URL?
    let numberOfLessons: Int?
    let numberOfTests: Int?
}
