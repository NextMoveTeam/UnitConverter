//
//  Conversion.swift
//  UnitConverter
//
//  Created by Khoi Truong Minh on 4/1/17.
//  Copyright © 2017 Khoi Truong Minh. All rights reserved.
//

import Foundation

enum ConversionType {
    case celsiusToFahrenheit
    case fahrenheitToCelsius
}

struct Conversion {

    let input: Float
    let output: Float
    let type: ConversionType

    init(input: Int, type: ConversionType) {
        let _input = Float(input)
        self.type = type
        self.input = _input
        self.output = convert(input: _input, type: type)
    }

}

fileprivate func convert(input: Float, type: ConversionType) -> Float {
    switch type {
    case .celsiusToFahrenheit:
        return getFahrenheit(fromCelsius: input)
    case .fahrenheitToCelsius:
        return getCelsius(fromFahrenheit: input)
    }
}

fileprivate func getFahrenheit(fromCelsius input: Float) -> Float {
    let output = input * 1.8 + 32.0
    return output
}

fileprivate func getCelsius(fromFahrenheit input: Float) -> Float {
    let output = (input - 32.0) / 1.8
    return output
}
