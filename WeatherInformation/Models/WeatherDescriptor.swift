//
//  WeatherDescriptor.swift
//  WeatherInformation
//
//  Created by kaabi islem on 16/08/2020.
//  Copyright © 2020 kaabi islem. All rights reserved.
//

import Foundation

public struct WeatherDescriptor : Codable {
    public var id: Int
    public var main: String
    public var description: String
    public var icon: String
}
