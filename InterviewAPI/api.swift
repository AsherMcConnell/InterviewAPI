//
//  api.swift
//  InterviewAPI
//
//  Created by Asher McConnell on 11/16/23.
//

import Foundation
import Observation
import SwiftUI

@Observable
class OrderData {
    var orders: Welcome?
    
    func fetchDataFromAPI() async {
        let apiKey = "UndYxaTF7VnzVGQRYjAvzgtwvKXbrbBrDtZ5KQQbj0j6GXW1BU1BRk7aTrcvATHu"
        let urlString = "https://dtmad-store.up.railway.app/api/v1/orders/?count=50"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        request.addValue(apiKey, forHTTPHeaderField: "X-Api-Key")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            do {
                if let decodedData = try? JSONDecoder().decode(Welcome.self, from: data) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        self.orders = decodedData
                    }
                    print("Received data: \(decodedData)")
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
}



// MARK: - Welcome
struct Welcome: Codable {
    let responseCode, count: Int
    let errorMessage: String
    let results: [Resulte]

    enum CodingKeys: String, CodingKey {
        case responseCode = "response_code"
        case count
        case errorMessage = "error_message"
        case results
    }
}

// MARK: - Result
struct Resulte: Codable {
    let id: String
    let items: [Item]
    let purchaser: Purchaser
}

// MARK: - Item
struct Item: Codable, Identifiable {
    let id, productName: String
    let cost: Double

    enum CodingKeys: String, CodingKey {
        case id
        case productName = "product_name"
        case cost
    }
}

// MARK: - Purchaser
struct Purchaser: Codable {
    let id, name, address, phoneNumber: String
    let emailAddress: String

    enum CodingKeys: String, CodingKey {
        case id, name, address
        case phoneNumber = "phone_number"
        case emailAddress = "email_address"
    }
}
