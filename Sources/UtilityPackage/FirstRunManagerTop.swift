//
//  FirstRunManager.swift
//  HabitsTracker
//
//  Created by Vaibhav on 01/02/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//
import Foundation

@available(iOS 13, *)
open class FirstRunMangerTop: Codable { // Never to be synced with iCloud
    static var shared = {
        retrieve()
    }()
    required public init() {}
    
    private static let key = Bundle.main.bundleIdentifier ?? "" + ".ModificationDateConfig"
    
    func save() {
        let jsonEncoder = JSONEncoder()
        do {
            let encodedData = try jsonEncoder.encode(Self.shared)
            UserDefaults.standard.set(encodedData, forKey:Self.key)
        }
        catch let error {
            //MARK: FIREBASE
            print(error.localizedDescription)
        }
    }
    
    private static func retrieve() -> Self {
        if let data = UserDefaults.standard.value(forKey:key) as? Data {
            let jsonDecoder = JSONDecoder()
            do {
                let decodedData = try jsonDecoder.decode(Self.self, from: data)
                return decodedData
            }
            catch let error {
                //MARK: FIREBASE
                print(error.localizedDescription)
            }
        }
        return Self()
    }
}
