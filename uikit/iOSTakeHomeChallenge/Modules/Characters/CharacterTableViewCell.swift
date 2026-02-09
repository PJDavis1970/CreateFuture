// Copyright © 2025 CreateFuture. All rights reserved.

import UIKit

class CharacterTableViewCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var cultureLabel: UILabel!
    @IBOutlet var bornLabel: UILabel!
    @IBOutlet var diedLabel: UILabel!
    @IBOutlet var seasonLabel: UILabel!

    let seasonRoman = ["I", "II", "III", "IV", "V", "VI", "VII", "VIII"]
    
    func setupWith(character: Character) {
        selectionStyle = .none
        nameLabel.text = character.name
        cultureLabel.text = character.culture
        bornLabel.text = character.born
        diedLabel.text = character.died

        var seasons = ""
        for season in character.tvSeries {

            if let lastChar = season.last, let lastInt = Int(String(lastChar)) {
                
                if lastInt > 0 && lastInt < seasonRoman.count {
                    if seasons.count != 0 {
                        seasons.append(", ")
                    }
                    seasons.append(seasonRoman[lastInt-1])
                }
            }
        }
        seasonLabel.text = seasons
    }
}
