//
//  InfoFormViewController.swift
//  Testing
//
//  Created by Emmanuel Casanas Cruz on 1/23/19.
//  Copyright © 2019 Emmanuel Cruz. All rights reserved.
//

import UIKit
import BonnusSDK

class InfoFormViewController: UIViewController {

    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var genderTextField: UITextField!
    
    @IBOutlet weak var zipCodeTextField: UITextField!
    

    @IBOutlet weak var latitudeTextField: UITextField!
    
    @IBOutlet weak var longitudeTextField: UITextField!
    
    @IBAction func clickSaveButton(_ sender: Any) {
        
        if !dateTextField.text!.isEmpty {
            UserSettings.setBirthday(date: dateTextField.text!)
        }
        if !genderTextField.text!.isEmpty {
            UserSettings.setGender(gender: genderTextField.text!)
        }
        
        if !zipCodeTextField.text!.isEmpty {
            UserSettings.setZipCode(zipcode: zipCodeTextField.text!)
        }
        
        if !latitudeTextField.text!.isEmpty && !latitudeTextField.text!.isEmpty {
            UserSettings.setGeo(latitude: latitudeTextField.text! , longitude: longitudeTextField.text!)
        }
        
        showAlert()
        
    }
    
    
    func showAlert(){
        let alert = UIAlertController(title: "Datos Cambiados", message: "Se cambiarón correctamente los datos, por favor configura nuevamente el SDK", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                self.dismiss(animated: true, completion: nil)
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
                
            }}))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   
}
