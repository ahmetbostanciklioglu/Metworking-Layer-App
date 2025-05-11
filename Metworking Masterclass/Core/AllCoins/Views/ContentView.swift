//
//  ContentView.swift
//  Metworking Masterclass
//
//  Created by Ahmet Bostanci on 11.05.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CoinsViewModel()
    
    var body: some View {
        Group {
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
            } else {
                Text("\(viewModel.coin): \(viewModel.price)")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
