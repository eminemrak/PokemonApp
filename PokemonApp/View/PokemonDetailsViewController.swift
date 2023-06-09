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

    @IBOutlet weak var abilityWeight: UILabel!
    @IBOutlet weak var abilityHeight: UILabel!
    @IBOutlet weak var firstAbilityName: UILabel!
    @IBOutlet weak var firstAbilitySlot: UILabel!
    @IBOutlet weak var secondAbilityName: UILabel!
    @IBOutlet weak var secondAbilitySlot: UILabel!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstView.layer.cornerRadius = 30
        secondView.layer.cornerRadius = 30
        
       ImageDownloader.downloadImage("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(selectedIndex).png") { image, urlString
            in
            if let imageObject = image {
                DispatchQueue.main.async {
                   self.pokemonImage.image = imageObject
                }
            }
        }
        pokemonName.text = selectedPokemon
       
        

        
    
        var detailURL = URL(string: urlDetails!)
        Webservice().downloadDetailPokemon(url: detailURL!) { (detailPokemon) in
            if detailPokemon == detailPokemon {
                self.selectedPokemons = SelectedPokemonVM(selectedPokemon: detailPokemon!)
                DispatchQueue.main.async {
                    
                    var height = String(self.selectedPokemons.height)
                    var weight = String(self.selectedPokemons.weight)
                    
                    self.abilityHeight.text = "Height : \(height)"
                    self.abilityWeight.text = "Weight : \(weight)"
                    
                    self.firstAbilityName.text = self.selectedPokemons.selectedPokemon.abilities[0].ability.name
                    self.firstAbilitySlot.text = "Slot: \(String(self.selectedPokemons.selectedPokemon.abilities[0].slot))"
                    
                    self.secondAbilityName.text = self.selectedPokemons.selectedPokemon.abilities[1].ability.name
                    self.secondAbilitySlot.text = "Slot: \(String(self.selectedPokemons.selectedPokemon.abilities[1].slot))"
                    }
                  }
                }
              }
}
