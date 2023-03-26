//
//  PokemonsViewModel.swift
//  PokemonApp
//
//  Created by Eminko on 23.03.2023.
//

import Foundation

//get pokemons from PokemonViewModel
struct PokemonsViewModel {
    
    let pokemonPage : PokemonPage
    
    //use this function at ViewController -> tableView protocols for get data with index
    func pokemonAtIndex(_ index: Int) -> PokemonViewModel {
        let pokemon = self.pokemonPage.results[index]
        return PokemonViewModel(pokemon: pokemon)
        
    }
    

    
 
}

//Model for each Pokemon, then we have list for all of pokemons
struct PokemonViewModel {
    let pokemon : Pokemon
    
    var id : UUID {
        return self.pokemon.id
    }
    
    var name : String {
        return self.pokemon.name
    }
    
    var url : String {
        return self.pokemon.url
    }
   
  
}





