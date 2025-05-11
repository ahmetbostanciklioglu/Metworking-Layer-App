//
//  CoinsViewModel.swift
//  Metworking Masterclass
//
//  Created by Ahmet Bostanci on 11.05.2025.
//

import Foundation

class CoinsViewModel: ObservableObject {
    
    @Published var coin = ""
    @Published var price = ""
    @Published var errorMessage: String?
    
    private let service = CoinDataService()
    
    init() {
        fetchPrice(coin: "bitcoin")
    }
    
    func fetchPrice(coin: String) {
        service.fetchPrice(coin: coin) { [weak self] priceFromService in
            DispatchQueue.main.async {
                guard let self else { return }
                
                self.coin = coin.capitalized
                self.price = "$\(priceFromService)"
            }
        }
    }
}
