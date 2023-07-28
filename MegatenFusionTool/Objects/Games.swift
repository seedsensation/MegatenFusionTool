//
//  Games.swift
//  MegatenFusionTool
//
//  Created by Mercury Evans on 27/07/2023.
//

import Foundation


extension Demon {
    
    // General Stats
    
    var g_resists: Dictionary<String, String>? {
        get {
            var result = Dictionary<String,String>()
            if let resistances = DataSet(self.resists, "resists") {
                for (i,c) in resistances.enumerated() {
                    // format resistances into an array
                    result[compendium.elements[i]] = String(c)
                }
                return result
            } else {
                return nil
            }
        }
    }
    
    var g_align: String? {
        get {
            if let result = DataSet(self.align, "align") {
                return result!
            } else {
                return nil
            }
        }
    }
    
    
    // Strange Journey Specific Stats
    
    var g_pcoeff: Int? {
        get {
            print(self.pcoeff)
            if let x = DataSet(self.pcoeff, "pcoeff") {
                return x
            } else { return nil }
        }
    }
    
    var g_ailments: Dictionary<String,String>? {
        get {
            var result = Dictionary<String,String>()
            if let ailments = DataSet(self.ailments, "ailments") {
                for (i,c) in ailments!.enumerated() {
                    result[compendium.ailments[i]] = String(c)
                }
                return result
            } else {
                return nil
            }
        }
    }
    
    
    
    
    
    
    func DataSet<T: Decodable>(_ data: T, _ varname: String) -> T? {
        if global_data.valid_stats.contains(varname) {
            return data
        } else {
            return nil
        }
    }
}
