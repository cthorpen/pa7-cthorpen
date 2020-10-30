//
//  TripTableViewCell.swift
//  pa6-cthorpen
//
//  Created by Cole Thorpen on 10/29/20.
//

import UIKit

class TripTableViewCell: UITableViewCell {

    @IBOutlet var startDateLabel: UILabel!
    @IBOutlet var endDateLabel: UILabel!
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
    
    func update(with trip: Trip) {
        destinationLabel.text = trip.destinationName
        startDateLabel.text = "today"//trip.startDate
        endDateLabel.text = "tomorrow"//trip.endDate
        
    }

}
