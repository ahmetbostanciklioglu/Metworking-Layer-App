//
//  Coin.swift
//  Metworking Masterclass
//
//  Created by Ahmet Bostanci on 11.05.2025.
//

import Foundation

struct Coin: Codable, Identifiable {
    let id: String
    let symbol: String
    let name: String
//    let currentPrice: Double
//    let marketCapRank: Int
}
