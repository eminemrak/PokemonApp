//
//  PokemonDetails.swift
//  PokemonApp
//
//  Created by Eminko on 25.03.2023.
//

import Foundation

struct SelectedPokemon : Codable, Equatable {
    var weight : Int
    var height : Int
    var sprites : PokemonSprites
   var abilities : [Ability]
    var species : Species
}

struct PokemonSprites :Codable, Equatable {
    var front_default : String
}

 

struct Ability : Codable, Equatable {
    var ability : Species
  var is_hidden : Bool
    var slot : Int
}

 

struct Species : Codable, Equatable {
    var name : String
    var url : String
}


