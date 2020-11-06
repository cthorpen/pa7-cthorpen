//
//  AddTripViewController.swift
//  pa6-cthorpen
//
//  Created by Cole Thorpen on 11/5/20.
//

import UIKit

class AddTripViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet var destinationTextField: UITextField!
    @IBOutlet var startDateTextField: UITextField!
    @IBOutlet var endDateTextField: UITextField!
    
    @IBOutlet var tripNumberLabel: UILabel!
    var tripNum = 5
    
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var cancelButton: UIButton!
    
    var tripOptional: Trip? = nil
    let dateFormatter = DateFormatter()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tripNumberLabel.text = "Add Trip #\(tripNum)"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //turn the string date to a real date
        dateFormatter.dateFormat = "MM/dd/yyyy"

        if let identifier = segue.identifier {
            if identifier == "SaveUnwindSegue" {
                if let destination = destinationTextField.text, let startDate = startDateTextField.text, let endDate = endDateTextField.text {
                    if let trip = tripOptional {
                        trip.destinationName = destination
                        let start = dateFormatter.date(from: startDate)!
                        let end = dateFormatter.date(from: endDate)!
                        tripOptional = Trip(destinationName: destination, startDate: start, endDate: end, imageFileName: "")
                        
                    }
                }
            }
        }
    }
    
    
    //MARK: - Input Error Control
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "SaveUnwindSegue" {
            if let destination = destinationTextField.text, let start = startDateTextField.text, let end = endDateTextField.text {
                //let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM/dd/yyyy"
                guard let start = dateFormatter.date(from: start), let end = dateFormatter.date(from: end) else {
                    //alert for bad dates
                    let alertController = UIAlertController(title: "Invalid Dates", message: "Please enter valid start and end dates", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                        print("OK pressed")
                    }))
                    present(alertController, animated: true, completion: { () -> Void in
                        print("Alert just presented")
                    })
                    return false;
                }
                if destination == "" {
                    //alert for no destination
                    let alertController = UIAlertController(title: "Invalid Destination", message: "Please enter a valid destination name", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                        print("OK pressed")
                    }))
                    present(alertController, animated: true, completion: { () -> Void in
                        print("Alert just presented")
                    })
                    destinationTextField.text = ""
                    return false;
                }
                if start > end {
                    //alert for bad dates
                    let alertController = UIAlertController(title: "Invalid Dates", message: "the end date cannot be before the start date", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                        print("OK pressed")
                    }))
                    present(alertController, animated: true, completion: { () -> Void in
                        print("Alert just presented")
                    })

                    return false;
                }
            }
        }
        return true;
    }

    @IBAction func backGroundTapped(_ sender: UITapGestureRecognizer) {
        destinationTextField.resignFirstResponder()
        startDateTextField.resignFirstResponder()
        endDateTextField.resignFirstResponder()
    }

}
