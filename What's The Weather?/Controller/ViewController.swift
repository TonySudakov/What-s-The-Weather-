//
//  ViewController.swift
//  What's The Weather?
//
//  Created by Антон Судаков on 19.01.2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate { //Протокол UITextFieldDelegate создан для работы с текстовым полем

    @IBAction func locationButton(_ sender: UIButton) {
    }
    @IBAction func searchButton(_ sender: UIButton) {
        searchCityField.endEditing(true) //Когда кнопка поиска нажимается - текст закончил редактироваться
        print(searchCityField.text!)
    }
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var degreesLabel: UILabel!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var searchCityField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchCityField.delegate = self //Поисковая строка взаимодействует с самим объектом класса ViewController
    }

    var weatherManager = WeatherManager()
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { //Нажимается кнопка поиска на клавиатуре
        searchCityField.endEditing(true) //Когда кнопка поиска нажимается - текст закончил редактироваться
        print(searchCityField.text!)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let city = searchCityField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        
       searchCityField.text = "" //Очищаем строку, когда пользователь нажимает кнопку поиска.
            // use searchCityField.text. to get the weather for city.
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something" //Если пользователь ничего не ввел
            return false
        }
        
    }
    
}

