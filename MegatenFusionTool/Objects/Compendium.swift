//
//  Compendium.swift
//  MegatenFusionTool
//
//  Created by Mercury Evans on 27/07/2023.
//

public struct global_data {
    static var file_directory: String = ""
    static var current_game: Current = .Undefined
    static var valid_stats: Array<String> = []
    static var skill_data_url: String = ""
    static var skill_data: Array<Skill> = []
    static var demon_data: Array<Demon> = []
    
}


import Foundation

struct Compendium {
    // standard data
    var file_directory = ""
    var current_game = Current.Undefined
    var demon_data_url = ""
    var skill_data_url = ""
    var custom_data = ""
    var demon_data = [Demon]()
    var valid_stats = [String]()
    var stat_line = [String]()
    var elements = [String]()
    var ailments = [String]()
    var skill_data: Array<Skill> = []
    
 
    struct DefaultStats {
        static var valid_stats = ["name","lvl","race","skills","stats"]
        static var stat_line = ["HP","MP","St","Ma","Vi","Ag","Lu"]
    }
    
    let lock = NSLock()
    
    init() {
        self.current_game = .smtsj
        self.Update()
    }
    mutating func Update() {
        
        demon_data = []
    
        lock.lock()
        file_directory = "fusion_tool_data/\(current_game)/data"
        demon_data_url = "demon-data.json"
        skill_data_url = "skill-data.json"
        
        lock.unlock()
        
        switch current_game {
        case .smtsj:
            valid_stats = ["ailments","inherits","lvl","pcoeff","race","resists","skills","source","stats","attack","align"]
            stat_line = DefaultStats.stat_line
            elements = ["phy", "gun", "fir", "ice", "ele", "win", "exp", "cur"]
            ailments = ["Poison","Paralyze","Stone","Strain","Sleep","Charm","Mute","Fear","Bomb"]

        case .smt1:
            valid_stats = ["align","atks","drop","lvl","race","resists","skills","stats"]
        case .smt4:
            stat_line = ["phy", "gun", "fir", "ice", "ele", "for", "lig", "dar"]
            
        // set file locations for all 3 versions of P3
        case .p3:
            demon_data_url = "van-\(demon_data_url)"
            skill_data_url = "van-\(skill_data_url)"
        case .p3p:
            demon_data_url = "p3p-\(demon_data_url)"
            skill_data_url = "p3p-\(skill_data_url)"
        case .p3fes:
            demon_data_url = "fes-\(demon_data_url)"
            skill_data_url = "fes-\(skill_data_url)"
        default:
            () // leave blank
        }
            
        global_data.valid_stats = valid_stats
        global_data.file_directory = file_directory
        global_data.current_game = current_game
        global_data.skill_data_url = skill_data_url

        
        var skills_json = Array<JSON>()
        if let skills_data: Dictionary<String, JSON> = try? load(skill_data_url, directory: file_directory) {
            // keys: skill name
            // values: skill data
            for key in skills_data.keys {
                var x = skills_data[key]!
                print(key)
                print(x)
                x["name"] = JSON(key)
                skills_json.append(x)
            }
        } else {
           skills_json = try! load(skill_data_url, directory: file_directory)
        }
        
        if skills_json.last == nil {
            fatalError("This is going to crash so i'll just stop it here.")
        }
        
        print("Started Unpacking Skills")
        
        for skill in skills_json {
            print("Unpacking skill \(skill["name"].string)")
            skill_data.append(Skill(data: skill))
        }

        print("Finished Unpacking Skills")
        
        global_data.skill_data = skill_data
        
        print("Archived skill data")
        
        let demon_data_import: Dictionary<String, JSON> = try! load(demon_data_url, directory: file_directory)
        
        print("Fetching demon data")
        var x = 0
        demon_data = demon_data_import.map { (k,v) in
            x += 1
            return Demon(key: k, val: v, id: x)
        }
        
        global_data.demon_data = self.demon_data
        
        
        
        
        
    }
    mutating func ClearData() {
        demon_data = []
    }
}


public enum Current {
    case smt1
    case smt2
    case smt3
    case smt4
    case smt4f
    case smt5
    case smtif
    case smtim
    case smtsj
    case smt9
    case p1, p2b, p2t, p3, p3p, p3fes, p4, p5
    case Undefined
}
