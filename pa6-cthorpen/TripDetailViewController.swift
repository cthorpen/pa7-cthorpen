//
//  TripDetailViewController.swift
//  pa6-cthorpen
//
//  Created by Cole Thorpen on 11/5/20.
//

import UIKit

class TripDetailViewController: UIViewController {
    
    var tripOptional: Trip? = nil
    
    @IBOutlet var destinationNameLabel: UILabel!
    @IBOutlet var startDateLabel: UILabel!
    @IBOutlet var endDateLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let trip = tripOptional {
            destinationNameLabel.text = "Destination: \(trip.destinationName)"
            startDateLabel.text = "Start Date: \(Trip.dateFormat.string(from: trip.startDate))"
            endDateLabel.text = "End Date: \(Trip.dateFormat.string(from: trip.endDate))"
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


/*
 var tripOptional: Trip? = nil
 
 @IBOutlet var destinationNameLabel: UILabel!
 @IBOutlet var startDateLabel: UILabel!
 @IBOutlet var endDateLabel: UILabel!

 override func viewDidLoad() {
     super.viewDidLoad()

     // Do any additional setup after loading the view.
     if let trip = tripOptional {
         destinationNameLabel.text = "Destination: \(trip.destinationName)"
         startDateLabel.text = "Start Date: \(Trip.dateFormat.string(from: trip.startDate))"
         endDateLabel.text = "End Date: \(Trip.dateFormat.string(from: trip.endDate))"
     }
 }
 

 
 // MARK: - Navigation

 // In a storyboard-based application, you will often want to do a little preparation before navigation
 
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
 
 }
 */
 
