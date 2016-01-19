//
//  PokeCellCollectionViewCell.swift
//  PokemonGuide
//
//  Created by Denis Motta on 11/29/15.
//  Copyright © 2015 Denis Motta. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    @IBOutlet weak var thumbImg:UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var pokemon: Pokemon!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    
        
    }
    
    func configureCell(pokemon: Pokemon) {
        
        self.pokemon = pokemon
        
        nameLbl.text = self.pokemon.name.capitalizedString
        
        thumbImg.image = UIImage(named:"\(self.pokemon.pokedexId)")
        
    }
    
    
}