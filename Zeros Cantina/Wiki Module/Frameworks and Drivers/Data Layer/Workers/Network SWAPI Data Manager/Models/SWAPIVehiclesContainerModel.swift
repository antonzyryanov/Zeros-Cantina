//
//  SWAPIVehiclesContainerModel.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 15.06.2025.
//


import Foundation

struct SWAPIVehiclesContainerModel: Codable {
    let message: String
    let totalRecords, totalPages: Int
    let previous: JSONNull?
    let next: String
    let results: [SWAPIVehicle]
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

struct SWAPIVehicle: Codable {
    let uid, name: String
    let url: String
}
