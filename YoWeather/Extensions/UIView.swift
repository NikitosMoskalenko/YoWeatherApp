//
//  UIView.swift
//  YoWeather
//
//  Created by Nikita Moskalenko on 12/1/20.
//

import UIKit

extension UIView {
    
    static func fromNib<T: UIView>() -> T {
        let nibArray = Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)
        return nibArray![0] as! T
    }
    
}
