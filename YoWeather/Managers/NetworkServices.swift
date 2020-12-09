//
//  NetworkServices.swift
//  YoWeather
//
//  Created by Nikita Moskalenko on 12/1/20.
//

import Network

final class NetworkServices {
    
    static let shared = NetworkServices()
    private let monitor = NWPathMonitor()
    let monitorQueue = DispatchQueue.global()
    
    func checkInthernetConnection() {
        monitor.start(queue: monitorQueue)
        monitor.pathUpdateHandler = { path in
            switch path.status {
            case .satisfied:
                //TODO: load view
                print("Connection")
            case .requiresConnection:
                // TODO: Alert
                print("Connection avalible")
            case .unsatisfied:
                // TODO: Alert
                print("Connection avalible")
            @unknown default:
                fatalError("Inthernet is availeble")
            }
            
        }
    }
    
}
