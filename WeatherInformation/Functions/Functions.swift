//
//  Functions.swift
//  WeatherInformation
//
//  Created by kaabi islem on 16/08/2020.
//  Copyright © 2020 kaabi islem. All rights reserved.
//

import Foundation

internal let kKelvinZeroInCelsius = 273.15
internal let kFahrenheitZeroInKelvin = -459.67

func toCelsius(kelvin: Double) -> Double {
    return kelvin - kKelvinZeroInCelsius
}

func toFahrenheit(celsius: Double) -> Double {
    return celsius * 9 / 5 + 32
}
