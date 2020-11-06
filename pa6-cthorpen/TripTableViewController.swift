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
    
    // function to tell what cell should be put at this index path
        //parameters: tableView, indexPath
        //returns: UITableViewCell (selected cell)
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
    
    //function to fill in first 5 cells with trips
        //parameters: none
        //return: none
    func initializeTrips() {
        //create 5 Trip instances, at least 2 need images
        //need to add image files
        
        if let irelandStartOptional = Trip.dateFormat.date(from: "06/25/2018") {
            if let irelandEndOptional = Trip.dateFormat.date(from: "07/02/2018") {
                trips.append(Trip(destinationName: "Ireland", startDate: irelandStartOptional, endDate: irelandEndOptional, imageFileName: "ireland1.png"))
            }
        }
        if let spainStartOptional = Trip.dateFormat.date(from: "01/06/2018") {
            if let spainEndOptional = Trip.dateFormat.date(from: "03/14/2018") {
                trips.append(Trip(destinationName: "Spain", startDate: spainStartOptional, endDate: spainEndOptional, imageFileName: "spain1.jpg"))
            }
        }
        if let nassauStartOptional = Trip.dateFormat.date(from: "01/02/2019") {
            if let nassauEndOptional = Trip.dateFormat.date(from: "01/09/2019") {
                trips.append(Trip(destinationName: "Nassau", startDate: nassauStartOptional, endDate: nassauEndOptional, imageFileName: "nassau1.png")) //change from nil later
            }
        }
        if let amsterdamStartOptional = Trip.dateFormat.date(from: "02/25/2020") {
            if let amsterdamEndOptional = Trip.dateFormat.date(from: "02/29/2020") {
                trips.append(Trip(destinationName: "Amsterdam", startDate: amsterdamStartOptional, endDate: amsterdamEndOptional, imageFileName: "amsterdam1.png")) //change from nil later
            }
        }
        if let londonStartOptional = Trip.dateFormat.date(from: "03/14/2020") {
            if let londonEndOptional = Trip.dateFormat.date(from: "03/17/2020") {
                trips.append(Trip(destinationName: "London", startDate: londonStartOptional, endDate: londonEndOptional, imageFileName: "london1.png")) //change from nil later
            }
        }
    }
    
    //MARK: - Segues
    
    //function called before a segue from TripTableViewController. Segue could be either "DetailSegue" or "AddSegue"
        //parameters: segue: DetailSegue/AddSegue, sender: TripTableViewController
        //return: none
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("hello from prepare")
        if let identifier = segue.identifier {
            print("identifier in prepare: \(identifier)")
            if identifier == "DetailSegue" {
                if let tripDetailVC = segue.destination as? TripDetailViewController {
                    if let indexPath = tableView.indexPathForSelectedRow { //issue here
                        let trip = trips[indexPath.row]
                        tripDetailVC.tripOptional = trip
                        print("detail segue")
                    }
                }
            }
            else {
                if let indexPath = tableView.indexPathForSelectedRow {
                    tableView.deselectRow(at: indexPath, animated: true)
                    print("add segue")
                }
            }
        }
    }
    

    //unwind function to return to TripTableViewController from AddTripViewController
        //parameters: segue: AddTripViewController
        //return: none
    @IBAction func unwindToTripTableViewController(segue: UIStoryboardSegue) {
        print("hello from unwind")
        if let identifier = segue.identifier {
            print("identifier in unwind: \(identifier)")
            if identifier == "SaveUnwindSegue" {
                if let addTripVC = segue.source as? AddTripViewController {
                    if let trip = addTripVC.tripOptional {
                        trips.append(trip)
                        tableView.reloadData()
                        print("inside unwind...")
                        addTripVC.tripNum = trips.count
                    }
                }
            }
        }
    }
    
    //MARK: - Editing
    
    //function executes when the 'edit' button is pressed. Sets up editing mode
        //parameters: sender: 'Edit' button
        //return: none
    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
        print("edit button pressed")
        let newEditingMode = !tableView.isEditing
        tableView.setEditing(newEditingMode, animated: true)
        print("in editing function")
    }
    
    //allows for rearranging rows in table
        //parameters: tableView, sourceIndexPath, destinationIndexPath
        //return: none
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        print("rearrange")
        let trip = trips.remove(at: sourceIndexPath.row)
        trips.insert(trip, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    //allows for deleting a row in editing mode
        //Parameters: tableView, editingStyle, indexPath
        //returns: none
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print("delete")
        trips.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initializeTrips()
    }

}
