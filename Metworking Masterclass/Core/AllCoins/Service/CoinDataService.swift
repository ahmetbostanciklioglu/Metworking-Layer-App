//
//  CoinDataService.swift
//  Metworking Masterclass
//
//  Created by Ahmet Bostanci on 11.05.2025.
//

import Foundation

class CoinDataService {
    func fetchPrice(coin: String, completion: @escaping(Double) -> Void)  {
        let urlString = "https://api.coingecko.com/api/v3/simple/price?ids=\(coin)&vs_currencies=usd"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                print("DEBUG: Failed with error: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                return
            }
            
            guard let data else { return }
            guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
            
            guard let value = jsonObject[coin] as? [String: Double] else {
                print("Failed to parse value")
                return
            }
            guard let price = value["usd"] else { return }
   
            print("DEBUG: Price in service is: \(price)")
            completion(price)
        }.resume()
    }
}
