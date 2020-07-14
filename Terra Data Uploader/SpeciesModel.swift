//
//  SpeciesModel.swift
//  Terra Data Uploader
//
//  Created by Anthony Gonzalez on 7/14/20.
//  Copyright © 2020 Antnee. All rights reserved.
//

import Foundation

public enum HabitatSystem: String {
    case marine = "marine"
    case freshwater = "freshwater"
    case terrestrial = "terrestrial"
}

public enum ConservationStatus: String {
    case critical = "Critical"
    case endangered = "Endangered"
    case vulnerable = "Vulnerable"
}


struct Species {
    let commonName: String
    let scientificName: String
    let assessmentDate: String
    let kingdom: String
    let phylum: String
    let order: String
    let classTaxonomy: String
    let family: String
    let genus: String
    let habitat: String
    let habitatSystem: HabitatSystem
    let threats: String
    let populationSummary: String
    let populationTrend: String
    let populationNumbers: String
    let conservationStatus: ConservationStatus
    let donationLink: String
    let weight: String
    let height: String
    let cellImage: String
    let detailImage: String
    
    init(commonName: String, scientificName: String, assessmentDate: String , kingdom: String = "Animalia", phylum: String = "Chordata", order: String, classTaxonomy: String, family: String, genus: String, habitat: String, habitatSystem: String, threats: String, populationSummary: String, populationTrend: String, populationNumbers: String, conservationStatus: String, donationLink: String, weight: String, height: String, cellImage: String, detailImage: String ) {
        self.commonName = commonName
        self.scientificName = scientificName
        self.assessmentDate = assessmentDate
        self.kingdom = kingdom
        self.phylum = phylum
        self.order = order
        self.classTaxonomy = classTaxonomy
        self.family = family
        self.genus = genus
        self.habitat = habitat
        self.habitatSystem = HabitatSystem(rawValue: habitatSystem)!
        self.threats = threats
        self.populationSummary = populationSummary
        self.populationTrend = populationTrend
        self.populationNumbers = populationNumbers
        self.conservationStatus = ConservationStatus(rawValue: conservationStatus)!
        self.donationLink = donationLink
        self.weight = weight
        self.height = height
        self.cellImage = cellImage
        self.detailImage = detailImage
    }
    
    
    init? (from dict: [String: Any]) {
        guard let commonName = dict["commonName"] as? String,
            let scientificName = dict["scientificName"] as? String,
            let assessmentDate = dict["assessmentDate"] as? String,
            let kingdom = dict["kingdom"] as? String,
            let phylum = dict["phylum"] as? String,
            let order = dict["order"] as? String,
            let classTaxonomy = dict["classTaxonomy"] as? String,
            let family = dict["family"] as? String,
            let genus = dict["genus"] as? String,
            let habitat = dict["habitat"] as? String,
            let habitatSystemString = dict["habitatSystem"] as? String,
            let threats = dict["threats"] as? String,
            let populationSummary = dict["populationSummary"] as? String,
            let populationTrend = dict["populationTrend"] as? String,
            let populationNumbers = dict["populationNumbers"] as? String,
            let conservationStatusString = dict["conservationStatus"] as? String,
            let donationLink = dict["donationLink"] as? String,
            let weight = dict["weight"] as? String,
            let height = dict["height"] as? String,
            let cellImage = dict["cellImage"] as? String,
            let detailImage = dict["detailImage"] as? String else { return nil }
        
        
        self.commonName = commonName
        self.scientificName = scientificName
        self.assessmentDate = assessmentDate
        self.kingdom = kingdom
        self.phylum = phylum
        self.order = order
        self.classTaxonomy = classTaxonomy
        self.family = family
        self.genus = genus
        self.habitat = habitat
        self.habitatSystem = HabitatSystem(rawValue: habitatSystemString)!
        self.threats = threats
        self.populationSummary = populationSummary
        self.populationTrend = populationTrend
        self.populationNumbers = populationNumbers
        self.conservationStatus = ConservationStatus(rawValue: conservationStatusString)!
        self.donationLink = donationLink
        self.weight = weight
        self.height = height
        self.cellImage = cellImage
        self.detailImage = detailImage
    }
    
    
    var fieldsDict: [String : Any] {
        return [
            "commonName" : self.commonName,
            "scientificName" : self.scientificName,
            "assessmentDate" : self.assessmentDate,
            "kingdom" : self.kingdom,
            "phylum" : self.phylum,
            "order" : self.order,
            "classTaxonomy" : self.classTaxonomy,
            "family" : self.family,
            "genus" : self.genus,
            "habitat" : self.habitat,
            "habitatSystem" : self.habitatSystem.rawValue,
            "threats" : self.threats,
            "populationSummary": self.populationSummary,
            "populationTrend" : self.populationTrend,
            "populationNumbers" : self.populationNumbers,
            "conservationStatus" : self.conservationStatus.rawValue,
            "donationLink" : self.donationLink,
            "weight" : self.weight,
            "height" : self.height,
            "cellImage" : self.cellImage,
            "detailImage" : self.detailImage
        ]
    }
}
