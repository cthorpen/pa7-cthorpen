//
//  Trip.swift
//  pa6-cthorpen
//
//  Created by Cole Thorpen on 10/29/20.
//

import Foundation

class Trip {
    //MARK: - properties
    
    var destinationName: String
    var startDate: Date
    var endDate: Date
    var imageFileName: String?
    
    var description: String {
        return "My trip to \(destinationName), from \(startDate) to \(endDate)."
    }
    
    //MARK: - initializers
    init() {
        self.destinationName = ""
        self.startDate = .init()
        self.endDate = .init()
        self.imageFileName = nil
    }
    
}
