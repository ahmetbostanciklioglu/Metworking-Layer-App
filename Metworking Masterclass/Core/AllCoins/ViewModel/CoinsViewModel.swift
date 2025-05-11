//
//  CoinsViewModel.swift
//  Metworking Masterclass
//
//  Created by Ahmet Bostanci on 11.05.2025.
//

import Foundation

class CoinsViewModel: ObservableObject {
    
    @Published var coins = [Coin]()
    @Published var errorMessage: String?
    private let service = CoinDataService()
    
    init() {
        fetchCoinsWithResult()
    }
    
    func fetchCoinsWithResult() {
        service.fetchCoinsWithResult { [weak self] result in
            guard let self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let coins):
                    self.coins = coins
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func fetchCoins() {
        service.fetchCoins { [weak self] coins, error in
           guard let self else { return }
            DispatchQueue.main.async{
                if let error {
                    self.errorMessage = error.localizedDescription
                }
                
                self.coins = coins ?? []
            }
        }
    }
}
