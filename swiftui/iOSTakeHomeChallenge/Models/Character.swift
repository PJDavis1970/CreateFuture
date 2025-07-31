// Copyright © 2025 CreateFuture. All rights reserved.

import Foundation

struct Character: Codable, Hashable {
    let name: String
    let gender: String
    let culture: String
    let born: String
    let died: String
    let aliases: [Int]
    let tvSeries: [String]
    let playedBy: [String]
}

extension Character {
    static var examples: [Character] {
        [
            Character(name: "Eddard Stark",
                      gender: "Male",
                      culture: "Northmen",
                      born: "In 263 AC, at Winterfell",
                      died: "In 299 AC, at Great Sept of Baelor in King's Landing",
                      aliases: [],
                      tvSeries: ["Season 1", "Season 6"],
                      playedBy: ["Sean Bean", "Sebastian Croft", "Robert Aramayo"]),

            Character(name: "Tyrion Lannister",
                      gender: "Male",
                      culture: "",
                      born: "In 273 AC, at Casterly Rock",
                      died: "",
                      aliases: [],
                      tvSeries: ["Season 1", "Season 2", "Season 3", "Season 4", "Season 5", "Season 6"],
                      playedBy: ["Peter Dinklage"]),

            Character(name: "Cersei Lannister",
                      gender: "Female",
                      culture: "Westerman",
                      born: "In 266 AC, at Casterly Rock",
                      died: "",
                      aliases: [],
                      tvSeries: ["Season 1", "Season 2", "Season 3", "Season 4", "Season 5", "Season 6"],
                      playedBy: ["Lena Headey"]),

            Character(name: "Catelyn Stark",
                      gender: "Female",
                      culture: "Rivermen",
                      born: "In 264 AC, at Riverrun",
                      died: "In 299 AC, at the Twins",
                      aliases: [],
                      tvSeries: ["Season 1", "Season 2", "Season 3"],
                      playedBy: ["Michelle Fairley"])
        ]
    }
}
