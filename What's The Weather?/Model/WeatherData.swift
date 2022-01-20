//
//  WeatherData.swift
//  What's The Weather?
//
//  Created by Антон Судаков on 20.01.2022.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
    let wind: Wind
    
}

struct Main: Decodable {
    let temp: Double
    let feels_like: Double
}

struct Weather: Decodable {
    let id: Int
}

struct Wind: Decodable {
    let speed: Double
}
