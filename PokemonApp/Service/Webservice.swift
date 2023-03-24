//
//  Webservice.swift
//  PokemonApp
//
//  Created by Eminko on 22.03.2023.
//

import Foundation
import UIKit

class Webservice {
    
    func downloadPokemons(url: URL, completion: @escaping (PokemonPage?) -> Void ) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("emin1")
                
                print(error.localizedDescription)
                print("emin2")
                //completion(nil)
                print("emin3")
                
            }else if let data = data {
                
                let pokemons = try? JSONDecoder().decode(PokemonPage.self, from: data)
              //  print("emin4")
                
              //  print("emin5")
                
                
                completion(pokemons)
               // print(pokemons)
                print("emin666666666666666666666666")
                
                //print(pokemons?.results)
                
                
            
                
                //                print(array)
                
                
                
                
            }
            
        }.resume()
        
        
        
    }
    
    
    
}

class ImageDownloader {
    static func downloadImage(_ urlString: String, completion: ((_ image: UIImage?,_ urlString: String?) -> ())?) {
       guard let url = URL(string: urlString) else {
          completion?(nil, urlString)
          return
      }
      URLSession.shared.dataTask(with: url) { (data, response,error) in
         if let error = error {
            print("error in downloading image: \(error)")
            completion?(nil, urlString)
            return
         }
         guard let httpResponse = response as? HTTPURLResponse,(200...299).contains(httpResponse.statusCode) else {
            completion?(nil, urlString)
            return
         }
         if let data = data, let image = UIImage(data: data) {
            completion?(image, urlString)
            return
         }
         completion?(nil, urlString)
      }.resume()
   }
}
    


    
