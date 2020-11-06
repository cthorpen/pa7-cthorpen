//
//  TripTableViewCell.swift
//  pa6-cthorpen
//
//  Created by Cole Thorpen on 10/29/20.
//

import UIKit

class TripTableViewCell: UITableViewCell {

    @IBOutlet var DatesLabel: UILabel!
    @IBOutlet var destinationLabel: UILabel!
    @IBOutlet var tripImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //updates a cell with the correct trip information
        //parameters: trip
        //returns: none
    func update(with trip: Trip) {
        
        destinationLabel.text = trip.destinationName
        DatesLabel.text = ("\(Trip.dateFormat.string(from: trip.startDate)) - \(Trip.dateFormat.string(from: trip.endDate))")
        print(trip.description)
        tripImageView.image = UIImage(named: trip.imageFileName)
    }

}
