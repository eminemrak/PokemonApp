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
    var count : Int
    var next : String
    var results : [Pokemon]
}

struct Pokemon : Codable, Identifiable, Equatable {
    let id = UUID()
    var name : String
    var url : String

}

