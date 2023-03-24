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
                  //  sleep(1)
                    self.pokemonImage.image = imageObject
                }
            }
            
        }
   
     
        pokemonName.text = selectedPokemon
        
     
        

    }
    

   

}
