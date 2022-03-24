//
//  Unsplash.swift
//  Unsplasher_UIKit
//
//  Created by KEEN on 2022/03/24.
//

import Foundation

struct Unsplash {
  let width: Int
  let height: Int
  let description: String
  let user: User
  let imageUrl: Urls
}

struct User {
  let username: String
}

struct Urls {
  let regular: String
}
