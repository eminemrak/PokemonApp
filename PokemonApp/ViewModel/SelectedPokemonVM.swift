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
    
    //var species : [Species] {
     //   return self.selectedPokemon.species
   // }
}

struct SprVM {
    let Psprites : PokemonSprites
    
    var front_default : String {
        return self.Psprites.front_default
    }
}

struct AbilitVM {
    let PokAbil : Ability
   
    
  
    var ability : Species {
        return self.PokAbil.ability
    }
     
    var is_hidden : Bool {
        return self.PokAbil.is_hidden
    }
     
     
    var slot : Int {
        return self.PokAbil.slot
    }
    
}

 


struct SpeciesVM {
    let PokSpecies : Species
    
    var name : String {
        return self.PokSpecies.name
    }
    var url : String {
        return self.PokSpecies.url
    }
}
 

