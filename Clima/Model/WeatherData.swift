//
//  WeatherData.swift
//  Clima
//
//  Created by Admin on 20/08/2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
    let id: Int
}
