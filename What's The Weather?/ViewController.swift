//
//  ViewController.swift
//  What's The Weather?
//
//  Created by Антон Судаков on 19.01.2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBAction func locationButton(_ sender: UIButton) {
    }
    @IBAction func searchButton(_ sender: UIButton) {
        print(searchCityField.text!)
    }
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var degreesLabel: UILabel!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var searchCityField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchCityField.delegate = self
    }


}

