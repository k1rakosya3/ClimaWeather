//
//  WeatherManager.swift
//  Clima
//
//  Created by Admin on 20/08/2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

// MARK: Protocol Functions
protocol WeatherManagerDelegat {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

// MARK: Manager Obect
struct WeatherManager {
    
    // MARK: API
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=c5120b46adff47f83fbd7ca27a95d755&units=metric"
    
    var delegate: WeatherManagerDelegat?
    
    // MARK: Weather with location
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherUrl)&lat=\(latitude)&lon=\(longitude)"
        performRequest(urlString: urlString)
    }
    // MARK: Weather with city
    func fatchWeather(city: String) {
        let urlString = "\(weatherUrl)&q=\(city)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, tempreature: temp)
            return weather
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
