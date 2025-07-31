//
//  CharactersView.swift
//  iOSTakeHomeChallenge
//
//  Created by Martin Rist on 19/10/2022.
//

import SwiftUI

struct CharactersView: View {
    @State var characters: [Character] = []
    var previewMode: Bool

    init(previewMode: Bool = false) {
        self.previewMode = previewMode
    }

    var body: some View {
        ZStack {
            Image("imgCharacters")
                .resizable()

            ScrollView {
                VStack {
                    ForEach(characters, id: \.self) { character in
                        VStack(spacing: 4) {
                            HStack {
                                Text(character.name)
                                    .font(.title3)
                                Spacer()
                                VStack(alignment: .trailing) {
                                    Text("Seasons").bold()
                                    Text(getSeasons(for: character)).foregroundColor(.secondary)
                                }
                            }
                            HStack {
                                Text("Culture:").bold()
                                Text(character.culture).foregroundColor(.secondary)
                            }
                            HStack {
                                Text("Born:").bold()
                                Text(character.born).foregroundColor(.secondary)
                            }
                            HStack {
                                Text("Died:").bold()
                                Text(character.died).foregroundColor(.secondary)
                            }
                        }
                        Divider()
                            .border(.white)
                    }
                }
            }
            .padding()
        }
        .onAppear(perform: getCharacters)
    }

    func getSeasons(for character: Character) -> String {
        var seasons = ""

        for season in character.tvSeries {
            if season == "Season 1" {
                seasons.append("I ")
            } else if season == "Season 2" {
                seasons.append("II, ")
            } else if season == "Season 3" {
                seasons.append("III, ")
            } else if season == "Season 4" {
                seasons.append("IV, ")
            } else if season == "Season 5" {
                seasons.append("V, ")
            } else if season == "Season 6" {
                seasons.append("VI, ")
            } else if season == "Season 7" {
                seasons.append("VII, ")
            } else if season == "Season 8" {
                seasons.append("VIII")
            }
        }

        return seasons
    }

    func getCharacters() {
        if previewMode {
            characters = Character.examples
            return
        }

        var request = URLRequest(url: URL(string: "https://yj8ke8qonl.execute-api.eu-west-1.amazonaws.com/characters")!)
        request.httpMethod = "GET"
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 15
        config.httpAdditionalHeaders = [
            "Authorization": "Bearer 754t!si@glcE2qmOFEcN"
        ]
        let task = URLSession(configuration: config)
            .dataTask(with: request, completionHandler: { data, response, error in
                if error != nil {
                    print("Oops")
                }

                let characters = try! JSONDecoder().decode([Character].self, from: data!)
                self.characters = characters
            })
        task.resume()
    }
}

#Preview {
    CharactersView(previewMode: true)
        .preferredColorScheme(.dark)
}
