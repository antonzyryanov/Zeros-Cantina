//
//  SWAPICharactersContainerModel.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 15.06.2025.
//

import Foundation

import Foundation

struct SWAPICharactersContainerModel: Codable {
    let message: String
    let totalRecords, totalPages: Int
    let previous: JSONNull?
    let next: String
    let results: [SWAPICharacter]
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

struct SWAPICharacter: Codable {
    let uid, name: String
    let url: String
    let image: String?
}

// MARK: - Social
struct Social: Codable {
    let discord, reddit: String
    let github: String
}

// MARK: - Support
struct Support: Codable {
    let contact: String
    let donate: String
    let partnerDiscounts: PartnerDiscounts
}

// MARK: - PartnerDiscounts
struct PartnerDiscounts: Codable {
    let saberMasters, heartMath: HeartMath
}

// MARK: - HeartMath
struct HeartMath: Codable {
    let link: String
    let details: String
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
            return true
    }

    public var hashValue: Int {
            return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if !container.decodeNil() {
                    throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
    }

    public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
    }
}
