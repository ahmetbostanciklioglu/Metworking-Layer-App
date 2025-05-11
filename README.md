# SwiftUI Networking Demo with CoinGecko API

[![Swift](https://img.shields.io/badge/Swift-5.9-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/iOS-16%2B-blue)](https://developer.apple.com/ios/)

A clean implementation of a networking layer in SwiftUI, featuring:

✅ Modern async/await networking  
✅ MVVM architecture  
✅ CoinGecko API integration  
✅ Error handling & loading states  
✅ Thread-safe data updates  

<p align="center">
  <img src="[https://i.imgur.com/your-screenshot.png](https://github.com/user-attachments/assets/06da6327-e77b-4bf9-9ed6-1f3ebe23b7d8)" width="300" alt="App Screenshot">

</p>

## Features

- **Networking Layer**:
  - `URLSession` with async/await
  - Custom `CoinDataService` abstraction
  - API error handling

- **App Architecture**:
  - ObservableObject ViewModels
  - Main-thread safety with `@MainActor`
  - Published property wrappers for reactive UI

- **UI Components**:
  - SwiftUI list with coin data
  - Loading/error states
  - Refreshable scroll view

## Installation

1. Clone the repository:
```bash
git clone https://github.com/ahmetbostanciklioglu/Metworking-Layer-App.git
