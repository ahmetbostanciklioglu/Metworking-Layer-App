//
//  CoinsViewModel.swift
//  Metworking Masterclass
//
//  Created by Ahmet Bostanci on 11.05.2025.
//

import Foundation

class CoinsViewModel: ObservableObject {
    
    @Published var coins = [Coin]()
    
    private let service = CoinDataService()
    
    init() {
        fetchCoins()
    }
    
    func fetchCoins() {
        service.fetchCoins { [weak self] coins in
            guard let self else { return }
            DispatchQueue.main.async {
                self.coins = coins
            }
        }
    }
}
