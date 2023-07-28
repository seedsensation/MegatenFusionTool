//
//  Demon.swift
//  MegatenFusionTool
//
//  Created by Mercury Evans on 27/07/2023.
//

import Foundation

public struct Skill: Hashable, Codable, CustomStringConvertible {
    public var description: String {
        return "\(name) (\(elem))"
    }
    
    var name: String
    var elem: String
    var target: String?
    var cost: Int?
    var power: Int?
    var rank: Int?
    var effect: String?
    
    init(data: JSON) {
        name = data["name"].string!
        target = data["target"].string
        power = data["power"].int
        cost = data["cost"].int
        rank = data["rank"].int
        effect = data["effect"].string
        
        if let test = data["elem"].string {
            elem = test
        } else {
            elem = data["element"].string!
        }
        
    }
}

public struct Demon: Hashable, Codable, CustomStringConvertible, Identifiable {
    public let id: Int
    var raw_data: JSON
    
    // base skills that every demon has
    var name: String
    var lvl: Int
    var race: String
    var skills: Array<Skill>
    
    
    // general stats interpreted differently per game
    var resists: String
    var stats: Array<Int>
    var align: String? = ""

    
    // stats specific to Strange Journey
    var ailments: String?
    var inherits: String?
    var pcoeff: Int?
    var source: Array<String>?
    var attack: String?
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(lvl)
        hasher.combine(race)
        hasher.combine(resists)
        hasher.combine(stats)
    }
    
    init(key name: String, val data: JSON, id: Int) {
        raw_data = data
        self.id = id
        self.name = name
        lvl = data["lvl"].int!
        race = data["race"].string!
        print("Unpacking skills for \(name)")
        skills = global_data.skill_data.finds((data["skills"].arrayValue.map {$0.stringValue}))
        
        resists = data["resists"].string!
        stats = data["stats"].arrayValue.map {$0.intValue}
        
        ailments = data["ailments"].string
        inherits = data["inherits"].string
        pcoeff = data["pcoeff"].int
        source = data["source"].arrayValue.map {$0.stringValue}
        attack = data["attack"].string
        
        
        let race_alignment: String?
        
        switch global_data.current_game {
        case .smt1:
            let alignments: Dictionary<String, Dictionary<String, String>> = try! load("alignments.json", directory: global_data.file_directory)
            race_alignment = alignments["races"]![race]
        case .smtsj:
            let alignments: Dictionary<String,String> = try! load("alignments.json", directory: global_data.file_directory)
            race_alignment = alignments[race]
        default:
            race_alignment = "None"
        }
        
        align = data["align"].string ?? race_alignment!

        
        
        
        
        
    }
    public var description: String {
        return "\(self.race) \(self.name) (\(self.lvl))"
    }
        
        
}






public extension Array where Self == [Demon]{

    func find(_ name: String) -> Demon? {
        if let x = self.first(where: {
            return $0.name == name
        }) {
            return x
        } else {
            return nil
        }

    }
    
    func finds(_ selection: [String]) -> [Demon]? {
        let x = self.filter {
            selection.contains($0.name)
        }
        if !(x.isEmpty) {
            return x
        } else {
            return nil
        }
    }
}

public extension Array where Self == [Skill] {
    
    func find(_ name: String) -> Skill? {
        if let x = self.first(where: {
            return $0.name == name
        }) {
            return x
        } else {
            return nil
        }
    }
    
    func finds(_ selection: [String]) -> [Skill] {
        let x = self.filter {
            selection.contains($0.name)
        }
        if !(x.isEmpty) {
            return x
        } else {
            return []
        }
    }
}
