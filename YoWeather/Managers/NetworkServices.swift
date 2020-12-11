//
//  NetworkServices.swift
//  YoWeather
//
//  Created by Nikita Moskalenko on 12/1/20.
//

import Network

protocol NetWorkServicesProtocol {
    var isAccessInthernet: Bool { get set }
}

final class NetworkServices: NetWorkServicesProtocol {
    
    static let shared = NetworkServices()
    var isAccessInthernet = false
    private let monitor = NWPathMonitor()
    let monitorQueue = DispatchQueue.global()
    
    func checkInthernetConnection() {
        monitor.start(queue: monitorQueue)
        monitor.pathUpdateHandler = { path in
            switch path.status {
            case .satisfied:
                //TODO: load view
                self.isAccessInthernet = true
                print("Connection")
            case .requiresConnection:
                // TODO: Alert
                self.isAccessInthernet = false
                print("Connection avalible")
            case .unsatisfied:
                // TODO: Alert
                self.isAccessInthernet = false
                print("Connection avalible")
            @unknown default:
                self.isAccessInthernet = false
                fatalError("Inthernet is availeble")
            }
            
        }
    }
    
}
