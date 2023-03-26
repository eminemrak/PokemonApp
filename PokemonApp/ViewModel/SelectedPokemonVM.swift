//
//  SelectedPokemonVM.swift
//  PokemonApp
//
//  Created by Eminko on 25.03.2023.
//

import Foundation

struct SelectedPokemonVM {
    let selectedPokemon : SelectedPokemon
    
    var weight : Int {
        return self.selectedPokemon.weight
    }
    
    var height : Int {
        return self.selectedPokemon.height
    }
    
    var abilities : [Ability] {
        return self.selectedPokemon.abilities
    }
}

struct SpritesViewModel {
    let sprites : PokemonSprites
    
    var front_default : String {
        return self.sprites.front_default
    }
}


struct AbilityVM {
    let pokemonAbility : Ability
  
    var ability : Species {
        return self.pokemonAbility.ability
    }
     
    var is_hidden : Bool {
        return self.pokemonAbility.is_hidden
    }
     
     
    var slot : Int {
        return self.pokemonAbility.slot
    }
    
}

 


struct SpeciesVM {
    let species : Species
    
    var name : String {
        return self.species.name
    }
    var url : String {
        return self.species.url
    }
}
 

