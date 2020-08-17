//
//  ForecastItem.swift
//  WeatherInformation
//
//  Created by kaabi islem on 16/08/2020.
//  Copyright © 2020 kaabi islem. All rights reserved.
//

import Foundation

public struct ForecastItem : Codable {
    public var dt_txt: String?
    public var dt: TimeInterval
    public var main: WeatherItem
    public var weather: [WeatherDescriptor]
    public var wind: Wind
}
