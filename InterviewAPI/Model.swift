//
//  Model.swift
//  InterviewAPI
//
//  Created by Asher McConnell on 11/16/23.
//

import Foundation

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
