//
//  File.swift
//  UnitTestingDemo
//
//  Created by Prashant Gaikwad on 13/09/20.
//  Copyright © 2020 Prashant Gaikwad. All rights reserved.
//

import Foundation

enum PokemonType {
    case Neutral
    case Fire
    case Water
    case Electric
}

enum PokemonAttackType {
    case Normal
    case Fire
    case Water
    case Electric
}

class Pokemon {
    
    var pokemonType: PokemonType
    var pokemonAttackType: PokemonAttackType
    var health:Int = 100
    
    init(type: PokemonType, attackType: PokemonAttackType) {
        self.pokemonType = type
        self.pokemonAttackType = attackType
    }
    
    
    func attackBy(attackerPokemon: Pokemon) {
        var damage = 0
        
        if attackerPokemon.pokemonType == .Neutral && pokemonAttackType == .Electric {
            damage = 40
        }
        
        if attackerPokemon.pokemonType == .Neutral && pokemonAttackType == .Water {
            damage = 30
        }
        
        attackerPokemon.health -= damage
    }
}
