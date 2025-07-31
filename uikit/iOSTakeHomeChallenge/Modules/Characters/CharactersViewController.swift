// Copyright © 2025 CreateFuture. All rights reserved.

import Foundation
import UIKit

class CharactersViewController: UIViewController, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchbarTimer: Timer?
    
    var cachedCharacters: [Character] = []
    var filteredCharacters: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        
        configureSearchBar()
        getCharacters()
    }
    
    func configureSearchBar() {
        searchBar.searchBarStyle = .minimal
        if let textField = searchBar.searchTextField as? UITextField {
            textField.backgroundColor = UIColor.white.withAlphaComponent(0.3)
            textField.textColor = .white
            textField.tintColor = .white
        }
        searchBar.placeholder = "Search"
        searchBar.delegate = self
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
        filteredCharacters = characters
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredCharacters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell") as! CharacterTableViewCell
        cell.setupWith(character: filteredCharacters[indexPath.row])
        return cell
    }
}

extension CharactersViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchbarTimer?.invalidate()
        searchbarTimer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { _ in
            self.updateTableWithSearch(with: searchText)
        }
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        filteredCharacters = cachedCharacters
    }
    
    func updateTableWithSearch(with query: String) {
        
        if query.count == 0 {
            filteredCharacters = cachedCharacters
        } else {
            filteredCharacters = cachedCharacters.filter { character in
                character.name.lowercased().contains(query.lowercased())
            }
        }
        tableView.reloadData()
    }
}
