//
//  ViewController.swift
//  LoveCalc
//
//  Created by Emina Mesic on 21/10/2020.
//

import UIKit

class ViewController: UIViewController {

    var firstName: String = ""
    var secondName: String = ""
    var percentage: String = ""
    var message: String = ""
    
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtSecondName: UITextField!
    @IBOutlet weak var calcButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //calcButton.sizeToFit()
    }
    
    @IBAction func calcButton_clicked(_ sender: Any) {
            guard let _ = txtFirstName.text, let _ = txtSecondName.text else { return }
            let calcRequest = CalcRequest(fname: txtFirstName.text!, sname: txtSecondName.text!)
            calcRequest.getPercentage{ [self] result in
            switch result{
            case .failure(let error):
                print(error)
            case .success(let result):
                firstName = result.fname
                secondName = result.sname
                percentage = result.percentage
                message = result.result
                
                DispatchQueue.main.async {
                    performSegue(withIdentifier: "details", sender: nil)
                }
                
            }
        }
        txtFirstName.text = ""
        txtSecondName.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "details"
        {
            let vc = segue.destination as! DetailsViewController
            
            vc.firstName = firstName
            vc.secondName = secondName
            vc.percentage = percentage
            vc.message = message
        }
    }
}
