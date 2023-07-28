//
//  JSONLoad.swift
//  MegatenFusionTool
//
//  Created by Mercury Evans on 27/07/2023.
//

enum DecodingError: Error {
    case TypeError
}

import Foundation

func load<T: Decodable>(_ filename: String, directory: String? = nil) throws -> T {
    let data: Data


    guard let file = Bundle.main.url(forResource: filename, withExtension: nil, subdirectory: directory)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }


    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }


    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        throw DecodingError.TypeError
    }
}
