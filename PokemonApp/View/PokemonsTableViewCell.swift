//
//  PokemonsTableViewCell.swift
//  PokemonApp
//
//  Created by Eminko on 22.03.2023.
//

import UIKit

class PokemonsTableViewCell: UITableViewCell {

    @IBOutlet weak var pokemonImage: UIImageView!
    
    
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    @IBOutlet weak var uiView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        uiView.layer.cornerRadius = 30

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
