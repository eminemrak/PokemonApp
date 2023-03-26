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
    var urlDetails : String?
    
    private var pokemonsViewModel : PokemonsViewModel!
    
    
    @IBOutlet weak var pokemonsListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        pokemonsListTableView.dataSource = self
        pokemonsListTableView.delegate = self
        
        //better user interface with none separator
        pokemonsListTableView.separatorStyle = .none
        
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151")!
        
        //getting pokemons with this function, and reload tableView for listing all pokemons
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
        let pokemonsName = self.pokemonsViewModel.pokemonAtIndex(indexPath.row).name
        
        urlDetails = "https://pokeapi.co/api/v2/pokemon/\(indexPath.row+1)/"
        selectedPokemon = pokemonsName
        selectedIndex = indexPath.row+1
        self.performSegue(withIdentifier: "mainToDetails", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mainToDetails" {
            let destVC = segue.destination as! PokemonDetailsViewController
            destVC.selectedPokemon = selectedPokemon
            destVC.selectedIndex = selectedIndex
            destVC.urlDetails = urlDetails
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = pokemonsListTableView.dequeueReusableCell(withIdentifier: "pokemonsCell") as! PokemonsTableViewCell
        let pokemonsName = self.pokemonsViewModel.pokemonAtIndex(indexPath.row).name
        cell.pokemonNameLabel.text = pokemonsName

        
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

