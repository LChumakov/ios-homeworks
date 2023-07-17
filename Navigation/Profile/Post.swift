
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
            autors: "Геральд",
            description: "Гераль из Риви, прозванный Белым Волком и Мясником из Блавикена",
            image: "Wicher",
            likes: 11322,
            views: 13457),
        PostModel(
            autors: "Енифер",
            description: "Йеннифэр из Венгерберга — могущественная чародейка",
            image: "Enifer",
            likes: 6457,
            views: 7653),
        PostModel(
            autors: "Трисс",
            description: "Трисс Меригольд – молодая и талантливая чародейка",
            image: "Triss",
            likes: 4567,
            views: 4799),
        PostModel(
            autors: "Цири",
            description: "Цирилла Фиона Элен Рианнон - дитя старшей крови",
            image: "Ciri",
            likes: 8945,
            views: 10342),
        ]
    }
}
