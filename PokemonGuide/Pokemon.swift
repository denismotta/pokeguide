//
//  Pokemon.swift
//  PokemonGuide
//
//  Created by Denis Motta on 11/29/15.
//  Copyright © 2015 Denis Motta. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    private var _name: String!
    private var _pokedexId: Int!
    private var _type: String!
    private var _species: String!
    private var _pokemonUrl: String!
    
    
    var name: String {
        return _name
    }
    
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    
    init(name: String, pokedexId: Int) {
        
        self._name = name
        self._pokedexId = pokedexId
        _pokemonUrl = "\(URL_BASE)\(URL_POKEMON)\(self._pokedexId)/"
    }
    
    func downloadPokemonDetails(completed: DownloadComplete) {
        
        let url = NSURL(string: _pokemonUrl)!
        
        Alamofire.request(.GET, url).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                
                if let species = dict["species"] as? String {
                    self._species = species
                    print(species)
                }
                if let types = dict["types"] as? [Dictionary<String, String>]
                    where types.count > 0 {
                        
                        if let name = types[0]["name"] {
                            self._type = name.capitalizedString
                        }
                        if types.count > 1 {
                            
                            for var x = 1; x < types.count; x++ {
                                if let name = types[x]["name"] {
                                    self._type! += "/\(name.capitalizedString)"
                                    
                                }
                                
                            }
                        }
                } else {
                    self._type = ""
                    print(self._type)
                    
                }
                }
                
            
            
            }
        }
}
