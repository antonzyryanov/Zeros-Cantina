//
//  SWAPIPlanetsContainerModel.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 16.06.2025.
//

import Foundation

// MARK: - SWAPIPlanetsContainerModel
struct SWAPIPlanetsContainerModel: Codable {
    let message: String
    let totalRecords, totalPages: Int
    let previous: JSONNull?
    let next: String
    let results: [SWAPIPlanet]
    let apiVersion, timestamp: String
    let support: Support
    let social: Social

    enum CodingKeys: String, CodingKey {
        case message
        case totalRecords = "total_records"
        case totalPages = "total_pages"
        case previous, next, results, apiVersion, timestamp, support, social
    }
}

// MARK: - Result
struct SWAPIPlanet: Codable {
    let uid, name: String
    let url: String
    let image: String?
}
