//
//  Post.swift
//  Navigation
//
//  Created by Alex Chumakov on 10.07.2023.
//

import UIKit

struct Post {
    var title: String
}

struct PostModel {
    var autors: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
}

extension PostModel {
    static func make() -> [PostModel] {
        [
        PostModel(
            autors: "",
            description: "",
            image: "",
            likes: 322,
            views: 3457),
        PostModel(
            autors: "",
            description: "",
            image: "",
            likes: 457,
            views: 7653),
        PostModel(
            autors: "",
            description: "",
            image: "",
            likes: 4567,
            views: 9658),
        PostModel(
            autors: "",
            description: "",
            image: "",
            likes: 234,
            views: 543),
        ]
    }
}
