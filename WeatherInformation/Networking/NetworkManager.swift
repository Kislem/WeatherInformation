//
//  NetworkManager.swift
//  WeatherInformation
//
//  Created by kaabi islem on 16/08/2020.
//  Copyright © 2020 kaabi islem. All rights reserved.
//

import Foundation

internal final class NetworkManager {

    internal static let instance = NetworkManager()

    private init() {
    }

    internal func get<T : Codable>(from url: String,
                                   callback: @escaping (T?, Error?) -> ()) {
        guard let serviceUrl = URL(string: url) else { return }
        URLSession.shared.dataTask(with: serviceUrl) { (data, response, error) in
            if let error = error {
                callback(nil, error)
            }
            guard let data = data else { return }

            let decoder = JSONDecoder() // TODO: move decoding to othe place (dispatcher, for example)
            do {
                let result = try decoder.decode(T.self, from: data)
                callback(result, nil)
            } catch {
                callback(nil, error)
            }
            }.resume()
    }
}
