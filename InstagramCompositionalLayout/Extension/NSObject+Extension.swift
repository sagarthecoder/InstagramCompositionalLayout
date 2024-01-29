//
//  NSObject+Extension.swift
//  InstagramCompositionalLayout
//
//  Created by Sagar on 1/27/24.
//

import Foundation

extension NSObject {
    var className: String {
        return String(describing: self)
    }
    
    public class var className: String {
        return String(describing: self)
    }
}
