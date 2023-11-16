//
//  Model.swift
//  InterviewAPI
//
//  Created by Asher McConnell on 11/16/23.
//

import Foundation

//class OrderData {
//    
//    var order
//    
//    func getOrders() async {
//        guard let url = URL(string: "https://dtmad-store.up.railway.app/api/v1/orders") else { return }
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//            if let decodedOrder = try? JSONDecoder().decode(Pokemon.self, from: data)  {
//                DispatchQueue.main.async {
//                    self.pokemon = decodedPokemon
//                }
//                print("Successfully fetched \(pokemon?.name ?? "Pokemon") from the internet")
//            }
//        } catch {
//            print("Error fetching Pokemon from the internet. ERROR: \(error)")
//        }
//    }
//}
