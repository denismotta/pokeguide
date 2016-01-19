//
//  PokemonDetailVC.swift
//  PokemonGuide
//
//  Created by Denis Motta on 1/18/16.
//  Copyright © 2016 Denis Motta. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    

    
    
    @IBOutlet weak var nameLbl: UILabel!
  
    @IBOutlet weak var mainImg: UIImageView!
   
    @IBOutlet weak var speciesLbl: UILabel!
    
    @IBOutlet weak var typeLbl: UILabel!
    
    @IBOutlet weak var pokedexLbl: UILabel!
    
    
    var pokemon: Pokemon!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    nameLbl.text = pokemon.name
        mainImg.image = UIImage(named: "\(pokemon.pokedexId)")
        pokedexLbl.text = "# \(pokemon.pokedexId)"
        
        
        
        pokemon.downloadPokemonDetails { () -> () in
            // this will be called after download is done
            self.updateUI()
        }
        
        
        
    }
    
    func updateUI() {
        
        pokedexLbl.text = "\(pokemon.pokedexId)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtnPressed(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
