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
    var imageFileName: String
    static let dateFormat: DateFormatter =  {
        let myDateFormat = DateFormatter()
        myDateFormat.dateFormat = "MM/dd/yyyy"
        return myDateFormat
    }()
    
    var description: String {
        return "My trip to \(destinationName), from \(startDate) to \(endDate)."
    }
    
    //MARK: - initializers
    init(destinationName: String, startDate: Date, endDate: Date, imageFileName: String) {
        self.destinationName = destinationName
        self.startDate = startDate
        self.endDate = endDate
        self.imageFileName = imageFileName
    }
    
}
