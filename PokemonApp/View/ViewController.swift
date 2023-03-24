//
//  ViewController.swift
//  PokemonApp
//
//  Created by Eminko on 22.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var selectedPokemon : String?
    var selectedIndex = 15
    
    private var pokemonsViewModel : PokemonsViewModel!
    
    @IBOutlet weak var pokemonsListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonsListTableView.dataSource = self
        pokemonsListTableView.delegate = self
        
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151")!
        
        Webservice().downloadPokemons(url: url) { (pokemons) in
            if let pokemons = pokemons {
                
                self.pokemonsViewModel = PokemonsViewModel(pokemonPage: pokemons)
                
                DispatchQueue.main.async {
                    self.pokemonsListTableView.reloadData()
                }
            }
        }
   
        
        
        
        
      
        
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ccc = self.pokemonsViewModel.cryptoAtIndex(indexPath.row)

        selectedPokemon = ccc.name
        selectedIndex = indexPath.row+1
        self.performSegue(withIdentifier: "mainToDetails", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mainToDetails" {
            let destVC = segue.destination as! PokemonDetailsViewController
            destVC.selectedPokemon = selectedPokemon
            destVC.selectedIndex = selectedIndex
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = pokemonsListTableView.dequeueReusableCell(withIdentifier: "pokemonsCell") as! PokemonsTableViewCell
       // let ccc = self.pokemonsViewModel.cryptoAtIndex(indexPath.row)
        cell.pokemonNameLabel.text = self.pokemonsViewModel.cryptoAtIndex(indexPath.row).name
        //ccc.name
   
      
         
        
        ImageDownloader.downloadImage("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(indexPath.row+1).png") { image, urlString
            in
            if let imageObject = image {
                DispatchQueue.main.async {
                    cell.pokemonImage.image = imageObject
                }
            }
            
        }
         
        return cell
    }
    
    
   
    
}

