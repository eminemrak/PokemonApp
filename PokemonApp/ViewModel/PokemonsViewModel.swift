//
//  PokemonsViewModel.swift
//  PokemonApp
//
//  Created by Eminko on 23.03.2023.
//

import Foundation

struct PokemonsViewModel {
    let pokemonPage : PokemonPage
    
    func cryptoAtIndex(_ index: Int) -> PokemonViewModel {
        let crypto = self.pokemonPage.results[index]
        return PokemonViewModel(pokemon: crypto)
        
    }
    

    
 
}

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



