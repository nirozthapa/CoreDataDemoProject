//
//  DatabaseHelper.swift
//  CoreData
//
//  Created by Niroj Thapa on 11/2/20.
//

import Foundation
import UIKit
import SQLite



/// Shared Instance of Database Helper Class
let sharedDatabaseHelper = DatabaseHelper.sharedHelper
class DatabaseHelper {
    
    fileprivate static let sharedHelper = DatabaseHelper()
    var db: Connection? = nil
    
    
    /// Gets Database file from the application
    func getDatabase() {
        if sharedDatabaseHelper.db == nil {
            do{
                db = try Connection(CoreDataManager.getPath(fileName: "coredb.sqlite"))
            }
            catch let error {
                print("No database found. Error details: \(error)")
            }
            
        }
    }
    
    
    /// Checks if databasefile is available in helper class
    ///
    /// - Returns: True if file is available else false
func isDatabaseAvailabel() -> Bool {
        if db == nil {
            return false
        }
        return true
    }
    
    
    //fetching data from server
    func fetchData(){
        if let url = URL(string: "https://my-json-server.typicode.com/butterfly-systems/sample-data/purchase_orders") {
           URLSession.shared.dataTask(with: url) { data, response, error in
              if let data = data {
                  do {
                    let res = try JSONDecoder().decode(Array<Response>.self, from: data)
                    print(res)
                  } catch let error {
                     print(error)
                  }
               }
           }.resume()
        }
    }
}
