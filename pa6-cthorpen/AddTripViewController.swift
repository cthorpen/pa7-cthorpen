//
//  AddTripViewController.swift
//  pa6-cthorpen
//
//  Created by Cole Thorpen on 11/5/20.
//

import UIKit

class AddTripViewController: UIViewController, UITextViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet var destinationTextField: UITextField!
    @IBOutlet var startDateTextField: UITextField!
    @IBOutlet var endDateTextField: UITextField!
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var tripNumberLabel: UILabel!
    
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var cancelButton: UIButton!
    
    var tripOptional: Trip? = nil
    let dateFormatter = DateFormatter()
    var tripNum: Int? = nil


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let tripNumber = tripNum {
            tripNumberLabel.text = "Add Trip #\(tripNumber)"
        }
        
    }
    
    //Function to resign the keyboard when return is pressed
        //parameters: UITextField, any of the ones in the VC
        //return: Bool value to determine if keyboard resigns
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


    // MARK: - Navigation

    //function that, when 'save' is pressed, will prepare to segue back to the table view
        //parameters: segue: SaveUnwindSegue, sender: TripTableViewController
        //return: none
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
                    
                    //auto unwrapped because the dates were checked in shouldPerformSegue(...)
                    else {
                        tripOptional = Trip(destinationName: destination, startDate: dateFormatter.date(from: startDate)!, endDate: dateFormatter.date(from: endDate)!, imageFileName: "")
                    }
                }
            }
        }
    }
    
    
    //MARK: - Input Error Control
    
    //executes before the segue is performed to see if all cases are met in order to return to previous screen
        //parameters: identifier: SaveUnwindSegue, sender: AddTripViewController
        //returns: Bool
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
    
    //MARK: - Add Photo
    
    @IBAction func addPhotoButtonPressed(_ sender: UIBarButtonItem) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        
        
        let alertController = UIAlertController(title: "Choose Photo", message: "Choose a photo to add to this trip.", preferredStyle: .actionSheet)
        
        // camera wont work on simulator
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                    let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: { (_) in
                        imagePickerController.sourceType = .photoLibrary
                    })
                    alertController.addAction(photoLibraryAction)
                }
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alertController.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        alertController.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action:UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        self.present(alertController, animated: true, completion: { () -> Void in
            print("alert presented")
        })
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        //set imageView to selected image
        imageView.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    //function to resign keyboard when background is tapped
        //parameters: sender (tapping on the background)
        //return: none
    @IBAction func backGroundTapped(_ sender: UITapGestureRecognizer) {
        destinationTextField.resignFirstResponder()
        startDateTextField.resignFirstResponder()
        endDateTextField.resignFirstResponder()
    }

}
