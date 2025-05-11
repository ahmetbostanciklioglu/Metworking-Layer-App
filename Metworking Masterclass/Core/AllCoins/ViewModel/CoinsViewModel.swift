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
    
    init() {
        fetchPrice(coin: "bitcoin") // main thread
    }
    
    func fetchPrice(coin: String) {
        print(Thread.current)
        
        let urlString = "https://api.coingecko.com/api/v3/simple/price?ids=\(coin)&vs_currencies=usd"
        
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            print(Thread.current) // background thread
            
            guard let data else { return }
            guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
            print(jsonObject)
            guard let value = jsonObject[coin] as? [String: Double] else {
                print("Failed to parse value")
                return
            }
            guard let price = value["usd"] else { return }
            
            DispatchQueue.main.async {
                print(Thread.current) // main thread
                self.coin = coin.capitalized
                self.price = "$\(price)"
            }
        }.resume()
        
    }
}
