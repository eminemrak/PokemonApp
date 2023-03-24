//
//  Pokemons.swift
//  PokemonApp
//
//  Created by Eminko on 22.03.2023.
//

// This file was generated from JSON Schema using codebeautify, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome9 = try Welcome9(json)

import Foundation

struct PokemonPage : Codable{
    let count : Int
    let next : String
    let results : [Pokemon]
}

struct Pokemon : Codable, Identifiable {
    let id = UUID()
    let name : String
    let url : String

    
   static var samplePokemon = Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/")
   
}



struct DetailPokemon : Codable {
    let id : Int
    let height : Int
    let weight : Int
}


