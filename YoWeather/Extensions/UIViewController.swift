//
//  UIViewController.swift
//  YoWeather
//
//  Created by Nikita Moskalenko on 12/1/20.
//

import UIKit

extension UIViewController {
    
    static func storyboardInstance<T: UIViewController>() -> T {
        let storyboard = UIStoryboard.init(name: String(describing: self), bundle: nil)
        let instance = storyboard.instantiateInitialViewController() as? T
        if instance != nil {
            return instance!
        } else {
            fatalError("Fail create instance \(String.init(describing: self))")
        }
        
    }

    func showErrorAlert(alertTitle: String, message: String) {
        let alert = UIAlertController.init(title: alertTitle,
                                           message: message, preferredStyle: .alert)
        alert.addAction(.init(title: NSLocalizedString("Back", comment: ""),
                              style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
