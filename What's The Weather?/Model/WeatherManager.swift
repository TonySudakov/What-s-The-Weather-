//
//  WeatherManager.swift
//  What's The Weather?
//
//  Created by Антон Судаков on 20.01.2022.
//

import Foundation

struct WeatherManager{
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=da5dbbf56017003abd467279694b5531&units=metric"
    
    func fetchWeather (cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString)
    }
    
    func performRequest(_ urlString: String) {
        
        //1. Создадим URL
        
        if let url = URL(string: urlString) {
            
            //2. Создадим URLSession
            
            let session = URLSession(configuration: .default)
            
            //3. Запустим задачу
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                print(url)
            
                
                if let safeData = data {
                    parseJSON(weatherData: safeData)
                }
            }
            
            //4. Начнем задачу.
            
            task.resume()
            
        }
        
        func parseJSON(weatherData: Data) {
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
                
                let id = decodedData.weather[0].id
                
            } catch {
                print(error)
                
            }
        }
        
        func getConditionName(weatherId: Int) -> String {
            
            
            
            return conditionName
        }
        
    }
}

