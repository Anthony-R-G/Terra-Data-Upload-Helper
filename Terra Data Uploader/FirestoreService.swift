//
//  FirestoreService.swift
//  Terra Data Uploader
//
//  Created by Anthony Gonzalez on 7/14/20.
//  Copyright © 2020 Antnee. All rights reserved.
//

import Foundation
import FirebaseFirestore

class FirestoreService {
    static let manager = FirestoreService()
    private let db = Firestore.firestore()
    
    func createSpeciesEntry(species: Species, completion: @escaping (Result<(), Error>) -> ()) {
        let fields = species.fieldsDict
        
        db.collection("Species").document(species.commonName.lowercased()).setData(fields) { (error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
    
}
