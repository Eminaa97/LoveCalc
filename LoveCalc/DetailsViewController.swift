//
//  DetailsViewController.swift
//  LoveCalc
//
//  Created by Emina Mesic on 22/10/2020.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var FirstName: UILabel!
    @IBOutlet weak var SecondName: UILabel!
    @IBOutlet weak var Percentage: UILabel!
    @IBOutlet weak var Message: UILabel!
    
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    
    var firstName : String = ""
    var secondName : String = ""
    var percentage : String = ""
    var message : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FirstName.text = firstName
        SecondName.text = secondName
        Percentage.text = percentage
        Message.text = message
    }
    
    @IBAction func tap_gesture(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
        print("closed")
    }
    
    

}
