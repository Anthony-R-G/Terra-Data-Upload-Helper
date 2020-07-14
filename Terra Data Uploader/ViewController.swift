//
//  ViewController.swift
//  Terra Data Uploader
//
//  Created by Anthony Gonzalez on 7/13/20.
//  Copyright © 2020 Antnee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var inputTextFields: [UITextField]!
    
    @IBOutlet var inputTextViews: [UITextView]!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var habitatSystemSC: UISegmentedControl!
    
    @IBOutlet weak var popTrendSC: UISegmentedControl!
    
    @IBOutlet weak var conservationStatusSC: UISegmentedControl!
    
    
    @IBAction func clearFieldsButtonPressed(_ sender: UIButton) {
        let alertVC = UIAlertController(title: nil, message: "Are you sure?", preferredStyle: .alert)
        let confirm = UIAlertAction(title: "OK", style: .destructive) { (action) in
            self.inputTextViews.forEach {
                $0.text = ""
            }
            self.inputTextFields.forEach {
                $0.text = ""
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertVC.addAction(confirm)
        alertVC.addAction(cancel)
        self.present(alertVC, animated: true, completion: nil)
    }
    
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        validateTextFields()
        handleFirebaseUpload()
       }
       
    
    private func validateTextFields() {
        inputTextViews.forEach {
            guard $0.text?.isEmpty == false else {
                showBasicAlert("Fill in all fields")
                return
            }
        }
    }
    
    private func createNewSpeciesFromTextFields() -> Species {
        var commonName: String!
        var scientificName: String!
        var order: String?
        var classTaxonomy: String?
        var family: String?
        var genus: String?
        var popNumbers: String?
        var donationLink: String?
        var weight: String?
        var height: String?
        var cellImage: String?
        var detailImage: String?
        var habitat: String?
        var threats: String?
        var popSummary: String?
        let habitatSystem = habitatSystemSC.titleForSegment(at: habitatSystemSC.selectedSegmentIndex)
        let popTrend = popTrendSC.titleForSegment(at: popTrendSC.selectedSegmentIndex)
        let conservationStatus = conservationStatusSC.titleForSegment(at: conservationStatusSC.selectedSegmentIndex)
        
        for textField in inputTextFields {
            switch textField.tag {
            case 0: commonName = textField.text ?? ""
            case 1: scientificName = textField.text ?? ""
            case 2: order = textField.text ?? ""
            case 3: classTaxonomy = textField.text ?? ""
            case 4: family = textField.text ?? ""
            case 5: genus = textField.text ?? ""
            case 6: popNumbers = "~" + (textField.text ?? "")
            case 7: donationLink = textField.text ?? ""
            case 8: weight = (textField.text ?? "") + "lbs"
            case 9: height = (textField.text ?? "") + "ft"
            case 10: cellImage = textField.text ?? ""
            case 11: detailImage = textField.text ?? ""
            default: ()
            }
        }
        
        for textView in inputTextViews {
            switch textView.tag {
            case 0: habitat = textView.text ?? ""
            case 1: threats = textView.text ?? ""
            case 2: popSummary = textView.text ?? ""
            default: ()
            }
        }
        
        let newSpecies = Species(commonName: commonName!, scientificName: scientificName!, assessmentDate: "01/01/2001", kingdom: "Animalia", phylum: "Chordata", order: order!, classTaxonomy: classTaxonomy!, family: family!, genus: genus!, habitat: habitat!, habitatSystem: habitatSystem!, threats: threats!, populationSummary: popSummary!, populationTrend: popTrend!, populationNumbers: popNumbers!, conservationStatus: conservationStatus!, donationLink: donationLink!, weight: weight!, height: height!, cellImage: cellImage!, detailImage: detailImage!)
        
        return newSpecies
    }
    
    private func handleFirebaseUpload() {
        FirestoreService.manager.createSpeciesEntry(species: createNewSpeciesFromTextFields()) { (result) in
            switch result {
            case .success():
                self.showBasicAlert("Successfully added")
            case .failure(_):
                self.showBasicAlert("Error: Unsuccessfully added")
            }
        }
    }
    
   
    private func showBasicAlert(_ str: String) {
        let alertVC = UIAlertController(title: nil, message: str, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    private func roundUIElements() {
        inputTextFields.forEach { $0.layer.cornerRadius = 10 }
        inputTextViews.forEach { $0.layer.cornerRadius = 10 }
        submitButton.layer.cornerRadius = 10
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundUIElements()
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height + 2800)
    }
}




