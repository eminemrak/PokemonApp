//
//  PokemonDetailsViewController.swift
//  PokemonApp
//
//  Created by Eminko on 24.03.2023.
//

import UIKit

class PokemonDetailsViewController: UIViewController {
    
    var selectedPokemon : String?
    
    var selectedIndex = 15
    
    var urlDetails : String?
    
    private var selectedPokemons : SelectedPokemonVM!
    
    

    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var abilityOne: UILabel!
    @IBOutlet weak var abilityTwo: UILabel!
    @IBOutlet weak var abilityThree: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       ImageDownloader.downloadImage("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(selectedIndex).png") { image, urlString
            in
            if let imageObject = image {
                DispatchQueue.main.async {
                   self.pokemonImage.image = imageObject
                }
            }
        }
        pokemonName.text = selectedPokemon
       
        //var url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(selectedIndex)/")!
        
        
        var URELE = URL(string: urlDetails!)
        Webservice().downloadDetailPokemon(url: URELE!) { (SP) in
            if SP == SP {
                self.selectedPokemons = SelectedPokemonVM(selectedPokemon: SP!)
                DispatchQueue.main.async {
                    print(self.selectedPokemons.weight)
                    self.abilityOne.text = String(self.selectedPokemons.weight)
                }
                

            }
        }
         
    }
    
    
    
    
}
