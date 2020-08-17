//
//  WeatherMode.swift
//  WeatherInformation
//
//  Created by kaabi islem on 16/08/2020.
//  Copyright © 2020 kaabi islem. All rights reserved.
//

import Foundation

/// Weather mode for which forecast must be retrieved.
///
/// - current: current weather data
/// - fiveDays: forecast for next 5 days
enum WeatherMode {
    case current
    case fiveDays
}
