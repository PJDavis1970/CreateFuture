// Copyright © 2025 CreateFuture. All rights reserved.

import Foundation
import UIKit

class CharactersViewController: UIViewController, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!

    var cachedCharacters: [Character] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        getCharacters()
    }

    func getCharacters() {
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
                self.loadData(characters: characters)

            })
        task.resume()
    }

    func loadData(characters: [Character]) {
        cachedCharacters = characters
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cachedCharacters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell") as! CharacterTableViewCell
        cell.setupWith(character: cachedCharacters[indexPath.row])
        return cell
    }
}
