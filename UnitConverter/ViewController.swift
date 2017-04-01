//
//  ViewController.swift
//  UnitConverter
//
//  Created by Khoi Truong Minh on 4/1/17.
//  Copyright © 2017 Khoi Truong Minh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var minValueLabel: UILabel!
    @IBOutlet weak var maxValueLabel: UILabel!

    let options = [
        "ºC -> ºF",
        "ºF -> ºC"
    ]

    fileprivate var conversion: Conversion = Conversion(input: 0, type: .celsiusToFahrenheit) {
        didSet {
            var inputUnit = "ºC"
            var ouputUnit = "ºF"
            minValueLabel.text = "0ºC"
            maxValueLabel.text = "100ºC"
            if conversion.type == .fahrenheitToCelsius {
                inputUnit = "ºF"
                ouputUnit = "ºC"
                minValueLabel.text = "0ºF"
                maxValueLabel.text = "100ºF"
            }
            inputLabel.text = String(format: "%d%@", Int(conversion.input), inputUnit)
            outputLabel.text = String(format: "%.1f%@", conversion.output, ouputUnit)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        slider.addTarget(self, action: #selector(changeSliderValue(sender:)), for: .valueChanged)
        pickerView.dataSource = self
        pickerView.delegate = self
    }

    @objc private func changeSliderValue(sender: UISlider) {
        conversion = Conversion(input: Int(sender.value), type: conversion.type)
    }

}

// MARK: - Picker view datasource

extension ViewController: UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }

}

// MARK: - Picker view delegate

extension ViewController: UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            conversion = Conversion(input: Int(conversion.input), type: .celsiusToFahrenheit)
        case 1:
            conversion = Conversion(input: Int(conversion.input), type: .fahrenheitToCelsius)
        default:
            break
        }
    }

}
