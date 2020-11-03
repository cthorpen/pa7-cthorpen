//
//  TripTableViewController.swift
//  pa6-cthorpen
//
//  Created by Cole Thorpen on 10/29/20.
//

import UIKit

class TripTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //instance of Trip
    var trips = [Trip]()
    //table view outlet
    @IBOutlet var tableView: UITableView!
    
    
    //MARK: - Data Source / Delegation
    //to tell how many rows are in the section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return trips.count
        }
        return 0
    }
    
    // to tell what cell to put at this index path
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let trip = trips[row]
        //to get a reuseable cell to display this trip
        let cell = tableView.dequeueReusableCell(withIdentifier: "TripCell", for: indexPath) as! TripTableViewCell
        //update the cell with the trip's info
        cell.update(with: trip)
        return cell
    }
    
    //MARK: - initial setup
    func initializeTrips() {
        //create 5 Trip instances, at least 2 need images
        //need to add image files
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "MM/dd/yyyy"
        
        if let irelandStartOptional = dateFormat.date(from: "06/25/2018") {
            if let irelandEndOptional = dateFormat.date(from: "07/02/2018") {
                trips.append(Trip(destinationName: "Ireland", startDate: irelandStartOptional, endDate: irelandEndOptional, imageFileName: nil)) //change from nil later
            }
        }
        if let spainStartOptional = dateFormat.date(from: "01/06/2018") {
            if let spainEndOptional = dateFormat.date(from: "03/14/2018") {
                trips.append(Trip(destinationName: "Spain", startDate: spainStartOptional, endDate: spainEndOptional, imageFileName: nil)) //change from nil later
            }
        }
        if let nassauStartOptional = dateFormat.date(from: "01/02/2019") {
            if let nassauEndOptional = dateFormat.date(from: "01/09/2019") {
                trips.append(Trip(destinationName: "Nassau", startDate: nassauStartOptional, endDate: nassauEndOptional, imageFileName: nil)) //change from nil later
            }
        }
        if let amsterdamStartOptional = dateFormat.date(from: "02/25/2020") {
            if let amsterdamEndOptional = dateFormat.date(from: "02/29/2020") {
                trips.append(Trip(destinationName: "Amsterdam", startDate: amsterdamStartOptional, endDate: amsterdamEndOptional, imageFileName: nil)) //change from nil later
            }
        }
        if let londonStartOptional = dateFormat.date(from: "03/14/2020") {
            if let londonEndOptional = dateFormat.date(from: "03/17/2020") {
                trips.append(Trip(destinationName: "London", startDate: londonStartOptional, endDate: londonEndOptional, imageFileName: nil)) //change from nil later
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initializeTrips()
    }

}
