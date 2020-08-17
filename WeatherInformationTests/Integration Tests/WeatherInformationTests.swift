//
//  WeatherInformationTests.swift
//  WeatherInformationTests
//
//  Created by kaabi islem on 15/08/2020.
//  Copyright © 2020 kaabi islem. All rights reserved.
//

import XCTest
@testable import WeatherInformation

class WeatherInformationTests: XCTestCase {

    override func setUp() {
        WeatherInformation.initialize(withAppId: "7589683417b0d8c73a915beaa779ce71")
    }
    
    func test_currentWeather_forCity() {
        var result: ForecastItem?
        var caughtError: Error?
        let ex = expectation(description: "WeatherInformation should provide current weather for city")

        WeatherInformation.instance.currentWeather(forCity: "Paris") { (weatherItem, error) in
            result = weatherItem
            guard let result = result else {
                return
            }
            XCTAssertNotNil(result.weather.last!.id)
            XCTAssertNotNil(result.weather.last!.icon)
            caughtError = error
            ex.fulfill()
        }

        wait(for: [ex], timeout: 5.0)

        XCTAssertNotNil(result)
        XCTAssertNil(caughtError)
    }

    func test_currentWeather_forCityWithCountryCode() {
        var result: ForecastItem?
        var caughtError: Error?
        let ex = expectation(description: "WeatherInformation should provide current weather for city with country code")

        WeatherInformation.instance.currentWeather(forCity: "Paris", withCountryCode: "fr") { (weatherItem, error) in
            result = weatherItem
            caughtError = error
            ex.fulfill()
        }

        wait(for: [ex], timeout: 5.0)

        XCTAssertNotNil(result)
        XCTAssertNil(caughtError)
    }

    func test_currentWeather_forGeoCoordinate() {
        var result: ForecastItem?
        var caughtError: Error?
        let ex = expectation(description: "WeatherInformation should provide current weather for geo location")

        WeatherInformation.instance.currentWeather(forCoordiante: (latitude: 53.2610313, longitude: 50.0579958)) { (weatherItem, error) in
            result = weatherItem
            caughtError = error
            ex.fulfill()
        }

        wait(for: [ex], timeout: 5.0)

        XCTAssertNotNil(result)
        XCTAssertNil(caughtError)
    }

    func test_5_days_weather_forCity() {
        var result: ForecastItemsList?
        var caughtError: Error?

        let ex = expectation(description: "5 days weather forecast")

        WeatherInformation.instance.weatherForecastForFiveDays(forCity: "Paris") { (weatherItem, error) in
            result = weatherItem
            caughtError = error
            ex.fulfill()
        }

        wait(for: [ex], timeout: 5.0)

        XCTAssertNotNil(result)
        XCTAssertNil(caughtError)
    }

    func test_5_days_weather_forCity_and_countryCode() {
        var result: ForecastItemsList?
        var caughtError: Error?

        let ex = expectation(description: "5 days weather forecast")

        WeatherInformation.instance.weatherForecastForFiveDays(forCity: "Paris", withCountryCode: "fr") { (weatherItem, error) in
            result = weatherItem
            caughtError = error
            ex.fulfill()
        }

        wait(for: [ex], timeout: 5.0)

        XCTAssertNotNil(result)
        XCTAssertNil(caughtError)
    }

    func test_5_days_weather_forGeoCoordinate() {
        var result: ForecastItemsList?
        var caughtError: Error?

        let ex = expectation(description: "5 days weather forecast")

        WeatherInformation.instance.weatherForecastForFiveDays(forCoordiante: (latitude: 48.8566, longitude: 2.3522)) { (weatherItem, error) in
            result = weatherItem
            caughtError = error
            ex.fulfill()
        }

        wait(for: [ex], timeout: 5.0)

        XCTAssertNotNil(result)
        XCTAssertNil(caughtError)
    }

}
