//
//  TripDetailViewController.swift
//  pa6-cthorpen
//
//  Created by Cole Thorpen on 11/4/20.
//

import UIKit

class TripDetailViewController: UIViewController {
    
    var tripOptional: Trip? = nil
    
    @IBOutlet var destinationTextField: UITextField!
    @IBOutlet var startDateTextField: UITextField!
    @IBOutlet var endDateTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let trip = tripOptional {
            destinationTextField.text = trip.destinationName
            //startDateTextField.text = trip.startDate
            //endDateTextField.text = trip.endDate
        }
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let identifier = segue.identifier {
            if identifier == "DetailSegue" {
                if let destination = destinationTextField.text { //add dates here too
                    if let trip = tripOptional {
                        trip.destinationName = destination
                        //trip.startDate = ...
                        //trip.endDate = ...
                        //same with the image
                    }
                    else {
                        //dog is nil...
                        //which means we got here from AddSegue
                        if let aTrip = tripOptional {
                            print(aTrip)
                        }
                        //tripOptional = Trip(destinationName: destination, startDate: "01/01/2020", endDate: "01/01/2020", imageFileName: nil)
                        
                    }
                }
            }
        }
    }
    

}
