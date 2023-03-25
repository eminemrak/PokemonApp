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
}
